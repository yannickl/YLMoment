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

#pragma mark Working with Moments

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
    
    NSLog(@"updateLangBundle: %@", _langBundle);
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
