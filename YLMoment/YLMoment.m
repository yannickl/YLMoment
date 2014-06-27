/*
 * YLMoment
 *
 * Copyright 2013 - present Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "YLMoment.h"

/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentiOSBunbleName = @"YLMoment-iOS";
/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentOSXBunbleName = @"YLMoment-OSX";
/** The table name for the relative time strings. */
static NSString * const kYLMomentRelativeTimeStringTable = @"YLMomentRelativeTimeLocalizable";

@interface YLMoment ()
/** The internal date once data computed */
#pragma mark internal
@property (nonatomic, strong) NSDate *date;

/** Returns the specified field value of the moment. */
- (NSUInteger)getCalendarUnit:(NSCalendarUnit)unit;

#pragma mark langs
/** Bundle the current language */
@property (nonatomic, strong) NSBundle *langBundle;

#pragma mark proxy
/** Date detector used to convert strings to date */
@property (nonatomic, strong) NSDataDetector *dateDetector;

/** Init the proxy with the default values. */
- (id)initProxy;

/** Called when the moment is initiated. */
- (void)momentInitiated;

/** Returns the YLMoment lang bundle corresponding to a given locale identifier. */
- (NSBundle *)langBundleForLocaleWithIdentifier:(NSString *)localeIdentifier;

@end

@implementation YLMoment

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"locale"];
}

#pragma mark - Creating and Initializing Moment Objects

- (instancetype)init
{
    return [self initWithDate:[NSDate date]];
}

+ (instancetype)now
{
    return [[self alloc] init];
}

+ (instancetype)utc {
    YLMoment *moment = [[self class] now];
    moment.timeZone  = [NSTimeZone timeZoneWithName:@"UTC"];
    
    return moment;
}

#pragma mark -

- (instancetype)initWithDate:(NSDate *)date
{
    if ((self = [super init]))
    {
        if (date)
        {
            _date      = [[NSDate alloc] initWithTimeInterval:0 sinceDate:date];
            _dateStyle = -1;
            _timeStyle = -1;
        }
        
        [self momentInitiated];
    }
    return self;
}

+ (instancetype)momentWithDate:(NSDate *)date
{
    return [[self alloc] initWithDate:date];
}

#pragma mark -

- (instancetype)initWithArray:(NSArray *)dateAsArray
{
    NSInteger componentCount = [dateAsArray count];
    
    NSInteger year   = (componentCount > 0) ? [dateAsArray[0] integerValue] : 0;
    NSInteger month  = (componentCount > 1) ? [dateAsArray[1] integerValue] : 0;
    NSInteger day    = (componentCount > 2) ? [dateAsArray[2] integerValue] : 0;
    NSInteger hour   = (componentCount > 3) ? [dateAsArray[3] integerValue] : 0;
    NSInteger minute = (componentCount > 4) ? [dateAsArray[4] integerValue] : 0;
    NSInteger second = (componentCount > 5) ? [dateAsArray[5] integerValue] : 0;
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year              = year;
    components.month             = month;
    components.day               = day;
    components.hour              = hour;
    components.minute            = minute;
    components.second            = second;
    
    NSCalendar *calendar = [[[self class] proxy] calendar];
    calendar.timeZone    = [[[self class] proxy] timeZone];
    
    return [self initWithDate:[calendar dateFromComponents:components]];
}

+ (instancetype)momentWithArray:(NSArray *)dateAsArray
{
    return [[self alloc] initWithArray:dateAsArray];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString
{
    NSDataDetector *dateDetector = [[[self class] proxy] dateDetector];
    NSTextCheckingResult *match  = [dateDetector firstMatchInString:dateAsString options:0 range:NSMakeRange(0, [dateAsString length])];
    
    return [self initWithDate:match.date];
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString
{
    return [[self alloc] initWithDateAsString:dateAsString];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat
{
    return [self initWithDateAsString:dateAsString format:dateFormat localeIdentifier:nil];
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat
{
    return [[self alloc] initWithDateAsString:dateAsString format:dateFormat];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier
{
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    
    return [self initWithDateAsString:dateAsString format:dateFormat locale:locale timeZone:nil];
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier
{
    return [[self alloc] initWithDateAsString:dateAsString format:dateFormat localeIdentifier:localeIdentifier];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale           = locale ?: [[[self class] proxy] locale];
    formatter.timeZone         = timeZone ?: [[[self class] proxy] timeZone];
    formatter.dateFormat       = dateFormat;
    
    YLMoment *moment = [self initWithDate:[formatter dateFromString:dateAsString]];
    moment.locale    = locale;
    moment.timeZone  = timeZone;
    
    return moment;
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone
{
    return [[self alloc] initWithDateAsString:dateAsString format:dateFormat locale:locale timeZone:timeZone];
}

#pragma mark - Properties

- (NSString *)description
{
    return [self format];
}

#pragma mark - Proxy Method

+ (instancetype)proxy
{
    static YLMoment *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initProxy];
    });
    return _sharedInstance;
}

#pragma mark Representing Moments as Strings

- (NSString *)format
{
    return [self format:YLMomentIso8601Format];
}

- (NSString *)format:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale           = _locale ?: [[[self class] proxy] locale];
    formatter.timeZone         = _timeZone ?: [[[self class] proxy] timeZone];
    if (!dateFormat)
    {
        formatter.dateStyle = ((NSUInteger)_dateStyle != -1) ? _dateStyle : [[[self class] proxy] dateStyle];
        formatter.timeStyle = ((NSUInteger)_timeStyle != -1) ? _timeStyle : [[[self class] proxy] timeStyle];
    } else
    {
        formatter.dateFormat = dateFormat;
    }
    
    return [formatter stringFromDate:_date] ?: @"Invalid Date";
}

#pragma mark Validating Moments

- (BOOL)isValid
{
    return (_date != nil);
}

#pragma mark Converting Moments

- (NSDate *)date
{
    return _date;
}

#pragma mark Comparing Moments

- (BOOL)isEqualToMoment:(YLMoment *)anotherMoment
{
    if ([anotherMoment isMemberOfClass:[self class]])
    {
        NSDate *reference = [anotherMoment date];
        
        return [_date isEqualToDate:reference];
    }
    
    return NO;
}

#pragma mark Working with Relative Time

- (NSString *)fromNow
{
    return [self fromNowWithSuffix:YES];
}

- (NSString *)fromNowWithSuffix:(BOOL)suffixed
{
    return [self fromDate:[NSDate date] withSuffix:suffixed];
}

- (NSString *)fromDate:(NSDate *)date
{
    return [self fromDate:date withSuffix:YES];
}

- (NSString *)fromDate:(NSDate *)date withSuffix:(BOOL)suffixed
{
    // Get the lang bundle
    NSBundle *langBundle = _langBundle ?: [[[self class] proxy] langBundle] ?: [NSBundle mainBundle];

    // Compute the time interval
    double referenceTime = [_date timeIntervalSinceDate:date];
    double seconds       = round(fabs(referenceTime));
    double minutes       = round(seconds / 60.0f);
    double hours         = round(minutes / 60.0f);
    double days          = round(hours / 24.0f);
    double years         = round(days / 365.0f);
    
    // Build the formatted string
    NSString *formattedString = @"";
    int unit                  = 0;
    if (seconds < 45)
    {
        formattedString = [langBundle localizedStringForKey:@"s" value:@"a few seconds" table:kYLMomentRelativeTimeStringTable];
        unit            = seconds;
    } else if (minutes == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"m" value:@"a minute" table:kYLMomentRelativeTimeStringTable];
    } else if (minutes < 45)
    {
        formattedString = [langBundle localizedStringForKey:@"mm" value:@"%d minutes" table:kYLMomentRelativeTimeStringTable];
        unit            = minutes;
    } else if (hours == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"h" value:@"an hour" table:kYLMomentRelativeTimeStringTable];
    } else if (hours < 22)
    {
        formattedString = [langBundle localizedStringForKey:@"hh" value:@"%d hours" table:kYLMomentRelativeTimeStringTable];
        unit            = hours;
    } else if (days == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"d" value:@"a day" table:kYLMomentRelativeTimeStringTable];
    } else if (days <= 25)
    {
        formattedString = [langBundle localizedStringForKey:@"dd" value:@"%d days" table:kYLMomentRelativeTimeStringTable];
        unit            = days;
    } else if (days <= 45)
    {
        formattedString = [langBundle localizedStringForKey:@"M" value:@"a month" table:kYLMomentRelativeTimeStringTable];
    } else if (days < 345)
    {
        formattedString = [langBundle localizedStringForKey:@"MM" value:@"%d months" table:kYLMomentRelativeTimeStringTable];
        unit            = round(days / 30);
    } else if (years == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"y" value:@"a year" table:kYLMomentRelativeTimeStringTable];
    } else
    {
        formattedString = [langBundle localizedStringForKey:@"yy" value:@"%d years" table:kYLMomentRelativeTimeStringTable];
        unit            = years;
    }
    formattedString = [NSString stringWithFormat:formattedString, unit];
    
    // If the string needs to be suffixed
    if (suffixed)
    {
        BOOL isFuture = (referenceTime > 0);
        
        NSString *suffixedString = nil;
        if (isFuture)
        {
            suffixedString = [langBundle localizedStringForKey:@"future" value:@"in %@" table:kYLMomentRelativeTimeStringTable];
        } else
        {
            suffixedString = [langBundle localizedStringForKey:@"past" value:@"%@ ago" table:kYLMomentRelativeTimeStringTable];
        }
        
        formattedString = [NSString stringWithFormat:suffixedString, formattedString];
    }
    
    return formattedString;
}

- (NSString *)fromMoment:(YLMoment *)moment
{
    return [self fromMoment:moment withSuffix:YES];
}

- (NSString *)fromMoment:(YLMoment *)moment withSuffix:(BOOL)suffixed
{
    return [self fromDate:[moment date] withSuffix:suffixed];
}

#pragma mark Manipulating Moments

- (YLMoment *)addAmountOfTime:(NSInteger)amount forUnitKey:(NSString *)key
{
    NSCalendarUnit unit = [[self class] calendarUnitForKey:key];
    
    return [self addAmountOfTime:amount forCalendarUnit:unit];
}

- (YLMoment *)addAmountOfTime:(NSInteger)amount forCalendarUnit:(NSCalendarUnit)unit
{
    NSCalendar *currentCalendar  = _calendar ?: [[[self class] proxy] calendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    switch (unit)
    {
        case kCFCalendarUnitYear:
            components.year = amount;
            break;
        case kCFCalendarUnitMonth:
            components.month = amount;
            break;
        case kCFCalendarUnitWeekOfMonth:
            components.weekOfMonth = amount;
            break;
        case kCFCalendarUnitDay:
            components.day = amount;
            break;
        case kCFCalendarUnitHour:
            components.hour = amount;
            break;
        case kCFCalendarUnitMinute:
            components.minute = amount;
            break;
        case kCFCalendarUnitSecond:
            components.second = amount;
            break;
        default:
            break;
    }
    
    _date = [currentCalendar dateByAddingComponents:components toDate:_date options:0];
    
    return self;
}

- (YLMoment *)addDuration:(NSTimeInterval)duration
{
    _date = [_date dateByAddingTimeInterval:duration];
    
    return self;
}

- (YLMoment *)subtractAmountOfTime:(NSInteger)amount forUnitKey:(NSString *)key
{
    return [self addAmountOfTime:-amount forUnitKey:key];
}

- (YLMoment *)subtractAmountOfTime:(NSInteger)amount forCalendarUnit:(NSCalendarUnit)unit
{
    return [self addAmountOfTime:-amount forCalendarUnit:unit];
}

- (YLMoment *)subtractDuration:(NSTimeInterval)duration
{
    return [self addDuration:-duration];
}

- (YLMoment *)startOf:(NSString *)unitString
{
    NSCalendarUnit unit = [[self class] calendarUnitForKey:unitString];
    
    return [self startOfCalendarUnit:unit];
}

- (YLMoment *)startOfCalendarUnit:(NSCalendarUnit)unit
{
    switch (unit)
    {
        case kCFCalendarUnitYear:
            [self setMonth:1];
            /* falls through */
        case kCFCalendarUnitMonth:
            [self setDay:1];
            /* falls through */
        case kCFCalendarUnitWeekOfMonth:
        case kCFCalendarUnitDay:
            [self setHour:0];
            /* falls through */
        case kCFCalendarUnitHour:
            [self setMinute:0];
            /* falls through */
        case kCFCalendarUnitMinute:
            [self setSecond:0];
            /* falls through */
        default:
            break;
    }
    
    return self;
}

- (YLMoment *)endOf:(NSString *)unitString
{
    NSCalendarUnit unit = [[self class] calendarUnitForKey:unitString];
    
    return [self endOfCalendarUnit:unit];
}

- (YLMoment *)endOfCalendarUnit:(NSCalendarUnit)unit
{
    return [[[self startOfCalendarUnit:unit] addAmountOfTime:1 forCalendarUnit:unit] addAmountOfTime:-1 forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitSecond];
}

#pragma mark Getting/Setting Moment Components

- (NSUInteger)getCalendarUnit:(NSCalendarUnit)unit
{
    NSCalendar *currentCalendar  = _calendar ?: [[[self class] proxy] calendar];
    NSDateComponents *components = [currentCalendar components:unit fromDate:_date];
    
    switch (unit)
    {
        case kCFCalendarUnitSecond:
            return components.second;
        case kCFCalendarUnitMinute:
            return components.minute;
        case kCFCalendarUnitHour:
            return components.hour;
        case kCFCalendarUnitDay:
            return components.day;
        case kCFCalendarUnitMonth:
            return components.month;
        case kCFCalendarUnitYear:
            return components.year;
        default:
            return 0;
    }
}

- (void)setValue:(NSUInteger)value forCalendarUnit:(NSCalendarUnit)unit
{
    NSCalendar *currentCalendar  = _calendar ?: [[[self class] proxy] calendar];
    NSDateComponents *components = [currentCalendar components:(kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond) fromDate:_date];
 
    switch (unit)
    {
        case kCFCalendarUnitSecond:
            components.second = value;
            break;
        case kCFCalendarUnitMinute:
            components.minute = value;
            break;
        case kCFCalendarUnitHour:
            components.hour = value;
            break;
        case kCFCalendarUnitDay:
            components.day = value;
            break;
        case kCFCalendarUnitMonth:
            components.month = value;
            break;
        case kCFCalendarUnitYear:
            components.year = value;
            break;
        default:
            break;
    }

    _date = [currentCalendar dateFromComponents:components];
}

- (NSUInteger)second
{
    return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitSecond];
}

- (void)setSecond:(NSUInteger)second
{
    if (second < 60)
    {
        [self setValue:second forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitSecond];
    }
}

- (NSUInteger)minute
{
    return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMinute];
}

- (void)setMinute:(NSUInteger)minute
{
    if (minute < 60)
    {
        [self setValue:minute forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMinute];
    }
}

- (NSUInteger)hour
{
    return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitHour];
}

- (void)setHour:(NSUInteger)hour
{
    if (hour < 24)
    {
        [self setValue:hour forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitHour];
    }
}

- (NSUInteger)day
{
    return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitDay];
}

- (void)setDay:(NSUInteger)day
{
    if (day > 0 && day <= 31)
    {
        [self setValue:day forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitDay];
    }
}

- (NSUInteger)month
{
    return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMonth];
}

- (void)setMonth:(NSUInteger)month
{
    if (month > 0 && month <= 12)
    {
        [self setValue:month forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMonth];
    }
}

- (NSUInteger)year
{
    return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitYear];
}

- (void)setYear:(NSUInteger)year
{
    [self setValue:year forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitYear];
}

#pragma mark Helpers

+ (NSCalendarUnit)calendarUnitForKey:(NSString *)key
{
    if ([key isEqualToString:@"y"] || [key isEqualToString:@"year"] || [key isEqualToString:@"years"])
    {
        return (NSCalendarUnit)kCFCalendarUnitYear;
    } else if ([key isEqualToString:@"M"] || [key isEqualToString:@"month"] || [key isEqualToString:@"months"])
    {
        return (NSCalendarUnit)kCFCalendarUnitMonth;
    } else if ([key isEqualToString:@"w"] | [key isEqualToString:@"week"] || [key isEqualToString:@"weeks"])
    {
        return (NSCalendarUnit)kCFCalendarUnitWeekOfMonth;
    } else if ([key isEqualToString:@"d"] || [key isEqualToString:@"day"] || [key isEqualToString:@"days"])
    {
        return (NSCalendarUnit)kCFCalendarUnitDay;
    } else if ([key isEqualToString:@"h"] || [key isEqualToString:@"hour"] || [key isEqualToString:@"hours"])
    {
        return (NSCalendarUnit)kCFCalendarUnitHour;
    } else if ([key isEqualToString:@"m"] || [key isEqualToString:@"minute"] || [key isEqualToString:@"minutes"])
    {
        return (NSCalendarUnit)kCFCalendarUnitMinute;
    } else if ([key isEqualToString:@"s"] || [key isEqualToString:@"second"] || [key isEqualToString:@"seconds"])
    {
        return (NSCalendarUnit)kCFCalendarUnitSecond;
    }
    
    return -1;
}

#pragma mark - Private Methods

- (id)initProxy
{
    if ((self = [super init]))
    {
        _calendar  = [NSCalendar currentCalendar];
        _locale    = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
        _timeZone  = [NSTimeZone defaultTimeZone];
        _dateStyle = NSDateFormatterLongStyle;
        _timeStyle = NSDateFormatterLongStyle;
        
        // Created at the proxy level to multiple instance (optimization)
        _dateDetector = [NSDataDetector dataDetectorWithTypes:(NSTextCheckingTypes)NSTextCheckingTypeDate error:nil];
        
        _langBundle = [self langBundleForLocaleWithIdentifier:_locale.localeIdentifier];
        
        [self momentInitiated];
    }
    return self;
}

- (void)momentInitiated
{
    [self addObserver:self forKeyPath:@"locale" options:0 context:nil];
}

- (NSBundle *)langBundleForLocaleWithIdentifier:(NSString *)localeIdentifier
{
    static NSBundle *classBundle  = nil;
    static NSBundle *momentBundle = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        classBundle = [NSBundle bundleForClass:[self class]];
        
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
        NSString *bundlePath = [classBundle pathForResource:kYLMomentiOSBunbleName ofType:@"bundle"];
#else
        NSString *bundlePath = [classBundle pathForResource:kYLMomentOSXBunbleName ofType:@"bundle"];
#endif
        momentBundle = [NSBundle bundleWithPath:bundlePath];
    });

    NSBundle *bundle   = momentBundle ?: classBundle;
    NSString *lang     = [localeIdentifier substringToIndex:2];
    NSString *langPath = [bundle pathForResource:lang ofType:@"lproj"];
    
    if (langPath)
    {
       return [NSBundle bundleWithPath:langPath];
    } else
    {
        NSArray *preferredLocales = [NSLocale preferredLanguages];
        
        for (NSString *preferredLocale in preferredLocales)
        {
            langPath = [bundle pathForResource:preferredLocale ofType:@"lproj"];
            
            if (langPath)
            {
                return [NSBundle bundleWithPath:langPath];
            }
        }
    }
    return nil;
}

#pragma mark - KVO Delegate Method

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"locale"])
    {
        _langBundle = [self langBundleForLocaleWithIdentifier:_locale.localeIdentifier];
    }
}

@end
