/*
 * NSMoment.m
 *
 * Copyright 2013 Yannick Loriot.
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

#import "NSMoment.h"

@interface NSMoment ()
#pragma mark internal
@property (nonatomic, strong) NSDate   *date;

#pragma mark langs
@property (nonatomic, strong) NSBundle *langBundle;

/** Init the proxy with the default values. */
- (id)initProxy;

/** Called when the moment is initiated. */
- (void)momentInitiated;

/** Update the lang bundle with the current locale preferred localizations. */
- (void)updateLangBundle;

@end

@implementation NSMoment

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"locale"];
}

- (id)init
{
    return [self initWithDate:[NSDate date]];
}

+ (id)now
{
    return [[self alloc] init];
}

#pragma mark -

- (id)initWithDate:(NSDate *)date
{
    if ((self = [super init]))
    {
        if (date)
        {
            _date = [[NSDate alloc] initWithTimeInterval:0 sinceDate:date];
        }
        
        [self momentInitiated];
    }
    return self;
}

+ (id)momentWithDate:(NSDate *)date
{
    return [[self alloc] initWithDate:date];
}

#pragma mark -

- (id)initWithArrayComponents:(NSArray *)dateAsArray
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
    
    return [self initWithDate:[calendar dateFromComponents:components]];
}

+ (id)momentWithArrayComponents:(NSArray *)dateAsArray
{
    return [[self alloc] initWithArrayComponents:dateAsArray];
}

#pragma mark -

- (id)initWithDateAsString:(NSString *)dateAsString
{
    NSDataDetector *detector    = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeDate error:nil];
    NSTextCheckingResult *match = [detector firstMatchInString:dateAsString options:0 range:NSMakeRange(0, [dateAsString length])];
    
    return [self initWithDate:match.date];
}

+ (id)momentWithDateAsString:(NSString *)dateAsString
{
    return [[self alloc] initWithDateAsString:dateAsString];
}

#pragma mark -

- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat
{
    NSLocale *locale = [[[self class] proxy] locale];
    
    return [self initWithDateAsString:dateAsString format:dateFormat localeIdentifier:[locale localeIdentifier]];
}

+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat
{
    return [[self alloc] initWithDateAsString:dateAsString format:dateFormat];
}

#pragma mark -

- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier
{
    NSDateFormatter *formatter  = [[NSDateFormatter alloc] init];
    formatter.locale            = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    formatter.dateFormat        = dateFormat;
    
    return [self initWithDate:[formatter dateFromString:dateAsString]];
}

+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier
{
    return [[self alloc] initWithDateAsString:dateAsString format:dateFormat localeIdentifier:localeIdentifier];
}

#pragma mark - Properties

- (NSString *)description
{
    return [self format];
}

#pragma mark - Configuring Moments

+ (instancetype)proxy
{
    static NSMoment *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initProxy];
    });
    return _sharedInstance;
}

#pragma mark - Public Methods

#pragma mark Representing Moments as Strings

- (NSString *)format
{
    return [self format:NSMomentIso8601Format];
}

- (NSString *)format:(NSString *)dateFormat
{
    NSDateFormatter *formatter  = [[NSDateFormatter alloc] init];
    formatter.locale            = _locale ?: [[[self class] proxy] locale];
    formatter.dateFormat        = dateFormat;
    
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

- (BOOL)isEqualToMoment:(NSMoment *)anotherMoment
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
    // Get the lang bundle
    NSBundle *langBundle = _langBundle ?: [[[self class] proxy] langBundle] ?: [NSBundle mainBundle];
    
    // Compute the time interval
    double referenceTime = [_date timeIntervalSinceDate:[NSDate date]];
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
        formattedString = [langBundle localizedStringForKey:@"s" value:@"a few seconds" table:nil];
        unit            = seconds;
    } else if (minutes == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"m" value:@"a minute" table:nil];
    } else if (minutes < 45)
    {
        formattedString = [langBundle localizedStringForKey:@"mm" value:@"%d minutes" table:nil];
        unit            = minutes;
    } else if (hours == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"h" value:@"an hour" table:nil];
    } else if (hours < 22)
    {
        formattedString = [langBundle localizedStringForKey:@"hh" value:@"%d hours" table:nil];
        unit            = hours;
    } else if (days == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"d" value:@"a day" table:nil];
    } else if (days <= 25)
    {
        formattedString = [langBundle localizedStringForKey:@"dd" value:@"%d days" table:nil];
        unit            = days;
    } else if (days <= 45)
    {
        formattedString = [langBundle localizedStringForKey:@"M" value:@"a month" table:nil];
    } else if (days < 345)
    {
        formattedString = [langBundle localizedStringForKey:@"MM" value:@"%d months" table:nil];
        unit            = round(days / 30);
    } else if (years == 1)
    {
        formattedString = [langBundle localizedStringForKey:@"y" value:@"a year" table:nil];
    } else
    {
        formattedString = [langBundle localizedStringForKey:@"yy" value:@"%d years" table:nil];
        unit            = years;
    }
    formattedString = [NSString stringWithFormat:formattedString, unit];

    // If the string needs to be suffixed
    if (suffixed)
    {
        BOOL isFuture = (referenceTime > 0);
        
        NSString *suffixedString = @"";
        if (isFuture)
        {
            suffixedString = [langBundle localizedStringForKey:@"future" value:@"in %@" table:nil];
        } else
        {
            suffixedString = [langBundle localizedStringForKey:@"past" value:@"%@ ago" table:nil];
        }
        
        formattedString = [NSString stringWithFormat:suffixedString, formattedString];
    }
    
    return formattedString;
}

#pragma mark Manipulating Moments

- (NSMoment *)addAmountOfTime:(NSInteger)amount forUnitKey:(NSString *)key
{
    if ([key isEqualToString:@"years"] || [key isEqualToString:@"y"])
    {
        return [self addAmountOfTime:amount forCalendarUnit:NSCalendarUnitYear];
    } else if ([key isEqualToString:@"months"] || [key isEqualToString:@"M"])
    {
        return [self addAmountOfTime:amount forCalendarUnit:NSCalendarUnitMonth];
    } else if ([key isEqualToString:@"weeks"] || [key isEqualToString:@"w"])
    {
        return [self addAmountOfTime:amount forCalendarUnit:NSCalendarUnitWeekOfMonth];
    } else if ([key isEqualToString:@"days"] || [key isEqualToString:@"d"])
    {
        return [self addAmountOfTime:amount forCalendarUnit:NSCalendarUnitDay];
    } else if ([key isEqualToString:@"hours"] || [key isEqualToString:@"h"])
    {
        return [self addAmountOfTime:amount forCalendarUnit:NSCalendarUnitHour];
    } else if ([key isEqualToString:@"minutes"] || [key isEqualToString:@"m"])
    {
        return [self addAmountOfTime:amount forCalendarUnit:NSCalendarUnitMinute];
    } else if ([key isEqualToString:@"seconds"] || [key isEqualToString:@"s"])
    {
        return [self addAmountOfTime:amount forCalendarUnit:NSCalendarUnitSecond];
    }
    return self;
}

- (NSMoment *)addAmountOfTime:(NSInteger)amount forCalendarUnit:(NSCalendarUnit)unit
{
    NSCalendar *currentCalendar  = _calendar ?: [[[self class] proxy] calendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    switch (unit)
    {
        case NSCalendarUnitYear:
            components.year = amount;
            break;
        case NSCalendarUnitMonth:
            components.month = amount;
            break;
        case NSCalendarUnitWeekOfMonth:
            components.week = amount;
            break;
        case NSCalendarUnitDay:
            components.day = amount;
            break;
        case NSCalendarUnitHour:
            components.hour = amount;
            break;
        case NSCalendarUnitMinute:
            components.minute = amount;
            break;
        case NSCalendarUnitSecond:
            components.second = amount;
            break;
        default:
            break;
    }
    
    _date = [currentCalendar dateByAddingComponents:components toDate:_date options:0];
    
    return self;
}

- (NSMoment *)addDuration:(NSTimeInterval)duration
{
    _date = [_date dateByAddingTimeInterval:duration];
    
    return self;
}

#pragma mark - Private Methods

- (id)initProxy
{
    if ((self = [super init]))
    {
        _calendar = [NSCalendar currentCalendar];
        _locale   = [NSLocale currentLocale];
        
        [self updateLangBundle];
        [self momentInitiated];
    }
    return self;
}

- (void)momentInitiated
{
    [self addObserver:self forKeyPath:@"locale" options:0 context:nil];
}

- (void)updateLangBundle
{
    NSString *lang = [[_locale localeIdentifier] substringToIndex:2];
    
    NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
    NSURL *langURL        = [classBundle URLForResource:lang withExtension:@"lproj"];
    
    if (langURL)
    {
        _langBundle = [NSBundle bundleWithURL:langURL];
    } else
    {
        NSArray *preferredLocalizations = [classBundle preferredLocalizations];
        
        for (NSString *preferredLocalization in preferredLocalizations)
        {
            langURL = [classBundle URLForResource:preferredLocalization withExtension:@"lproj"];
            
            if (langURL)
            {
                _langBundle = [NSBundle bundleWithURL:langURL];
                break;
            }
        }
    }
}

#pragma mark - KVO Delegate Method

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if ([keyPath isEqualToString:@"locale"])
    {
        [self updateLangBundle];
    } else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
