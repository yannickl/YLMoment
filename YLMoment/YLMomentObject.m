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

#import "YLMomentObject.h"

/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentiOSBunbleName = @"YLMoment-iOS";
/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentOSXBunbleName = @"YLMoment-OSX";

@interface YLMoment ()
/** The internal date once data computed */
#pragma mark internal
@property (nonatomic, strong) NSDate *date;

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

#pragma mark - Validating Moments

- (BOOL)isValid
{
    return (_date != nil);
}

#pragma mark - Converting Moments

- (NSDate *)date
{
    return _date;
}

#pragma mark - Comparing Moments

- (BOOL)isEqualToMoment:(YLMoment *)anotherMoment
{
    if ([anotherMoment isMemberOfClass:[self class]])
    {
        NSDate *reference = [anotherMoment date];
        
        return [_date isEqualToDate:reference];
    }
    
    return NO;
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
