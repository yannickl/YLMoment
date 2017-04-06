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
#import "YLMoment+Bundle.h"

@interface YLMoment ()
#pragma mark internal

/** The internal date once data computed */
@property (nonatomic, strong) NSDate *date;

/** Called when the moment is initiated. */
- (void)momentInitiated;

#pragma mark langs

/** Bundle the current language */
@property (nonatomic, strong) NSBundle *langBundle;

#pragma mark proxy

/** Date detector used to convert strings to date */
@property (nonatomic, strong) NSDataDetector *dateDetector;

/** Init the proxy with the default values. */
- (id)initProxy;

@end

@implementation YLMoment

- (void)dealloc {
  [self removeObserver:self forKeyPath:@"locale"];
}

#pragma mark - Creating and Initializing Moment Objects

- (instancetype)init {
  return [self initWithDate:[NSDate date]];
}

+ (instancetype)now {
  return [[self alloc] init];
}

+ (instancetype)utc {
  YLMoment *moment = [[self class] now];
  moment.timeZone  = [NSTimeZone timeZoneWithName:@"UTC"];

  return moment;
}

#pragma mark -

- (instancetype)initWithDate:(NSDate *)date {
  if ((self = [super init])) {
    if (date) {
      _date      = [[NSDate alloc] initWithTimeInterval:0 sinceDate:date];
      _dateStyle = -1;
      _timeStyle = -1;
    }

    [self momentInitiated];
  }
  return self;
}

+ (instancetype)momentWithDate:(NSDate *)date {
  return [[self alloc] initWithDate:date];
}

#pragma mark -

- (instancetype)initWithArray:(NSArray *)dateAsArray {
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

+ (instancetype)momentWithArray:(NSArray *)dateAsArray {
  return [[self alloc] initWithArray:dateAsArray];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString {
  NSDataDetector *dateDetector = [[[self class] proxy] dateDetector];
  NSTextCheckingResult *match  = [dateDetector firstMatchInString:dateAsString options:0 range:NSMakeRange(0, [dateAsString length])];

  return [self initWithDate:match.date];
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString {
  return [[self alloc] initWithDateAsString:dateAsString];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat {
  return [self initWithDateAsString:dateAsString format:dateFormat localeIdentifier:nil];
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat {
  return [[self alloc] initWithDateAsString:dateAsString format:dateFormat];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier {
  NSLocale *locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];

  return [self initWithDateAsString:dateAsString format:dateFormat locale:locale timeZone:nil];
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier {
  return [[self alloc] initWithDateAsString:dateAsString format:dateFormat localeIdentifier:localeIdentifier];
}

#pragma mark -

- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.locale           = locale ?: [[[self class] proxy] locale];
  formatter.timeZone         = timeZone ?: [[[self class] proxy] timeZone];
  formatter.dateFormat       = dateFormat;

  YLMoment *moment = [self initWithDate:[formatter dateFromString:dateAsString]];
  moment.locale    = locale;
  moment.timeZone  = timeZone;

  return moment;
}

+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone {
  return [[self alloc] initWithDateAsString:dateAsString format:dateFormat locale:locale timeZone:timeZone];
}

#pragma mark - Validating Moments

- (BOOL)isValid {
  return (_date != nil);
}

#pragma mark - Converting Moments

- (NSDate *)date {
  return _date;
}

#pragma mark - Comparing Moments

- (BOOL)isEqualToMoment:(YLMoment *)anotherMoment {
  if ([anotherMoment isMemberOfClass:[self class]]) {
    NSDate *reference = [anotherMoment date];

    return [_date isEqualToDate:reference];
  }

  return NO;
}

- (BOOL)isSameMoment:(YLMoment *)comparedMoment {
    if (![[self timeZone] isEqualToTimeZone:comparedMoment.timeZone]) {
        comparedMoment.timeZone = [NSTimeZone timeZoneWithName:self.timeZone.name];
    }

    return [self isEqualToMoment:comparedMoment];
}

- (BOOL)isSameMoment:(YLMoment *)comparedMoment forUnit:(NSCalendarUnit)calendarUnit{
    if (![[self timeZone] isEqualToTimeZone:comparedMoment.timeZone]) {
        comparedMoment.timeZone = [NSTimeZone timeZoneWithName:self.timeZone.name];
    }

    NSCalendar *currentCalendar = self.calendar ?: [[[self class] proxy] calendar];

    NSCalendar *comparedCalendar = comparedMoment.calendar ?: [[[self class] proxy] calendar];

    NSDateComponents *c1 = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self.date];

    NSDateComponents *c2 = [comparedCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:comparedMoment.date];

    switch (calendarUnit) {
        case NSCalendarUnitYear:
            return (c1.year == c2.year);
        case NSCalendarUnitMonth:
            return (c1.year == c2.year) && (c1.month == c2.month);
        case NSCalendarUnitDay:
            return (c1.year == c2.year) && (c1.month == c2.month) && (c1.day == c2.day);
        case NSCalendarUnitHour:
            return (c1.year == c2.year) && (c1.month == c2.month) && (c1.day == c2.day) && (c1.hour == c2.hour);
        case NSCalendarUnitMinute:
            return (c1.year == c2.year) && (c1.month == c2.month) && (c1.day == c2.day) && (c1.hour == c2.hour) && (c1.minute == c2.minute);
        case NSCalendarUnitSecond:
            return (c1.year == c2.year) && (c1.month == c2.month) && (c1.day == c2.day) && (c1.hour == c2.hour) && (c1.minute == c2.minute) && (c1.second == c2.second);
        default:
            return NO;
    }
}

- (BOOL)isBeforeMoment:(YLMoment *)comparedMoment {
    // If moment is equal to comparedMoment or not a `YLMoment` then return NO
    if ([self isEqualToMoment:comparedMoment]) {
        return NO;
    }

    if (![[self timeZone] isEqualToTimeZone:comparedMoment.timeZone]) {
        comparedMoment.timeZone = [NSTimeZone timeZoneWithName:self.timeZone.name];
    }
    
    return [_date isEqualToDate:[_date earlierDate:[comparedMoment date]]];
}

- (BOOL)isAfterMoment:(YLMoment *)comparedMoment {
    // If moment is equal to comparedMoment or not a `YLMoment` then return NO
    // Keep isEqualToMoment check before isBeforeMoment to prevent false positive
    if ([self isEqualToMoment:comparedMoment]) {
        return NO;
    }
    
    // If moment is before the comparedMoment then return NO
    if ([self isBeforeMoment:comparedMoment]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isBetweenMoments:(YLMoment *)startMoment andEndMoment:(YLMoment *)endMoment {
    // Guard condition when startMoment is same as endMoment and the reference moment, return YES
    // Keep isEqualToMoment checks before isBeforeMoment and isAfterMoment checks to prevent false positive
    if ([startMoment isEqualToMoment:endMoment] && [self isEqualToMoment:startMoment]) {
        return YES;
    }
    
    if ([self isBeforeMoment:endMoment] && [self isAfterMoment:startMoment]) {
        return YES;
    }
    
    return NO;
}

#pragma mark - Proxy Method

+ (instancetype)proxy {
  static YLMoment *_sharedInstance = nil;
  static dispatch_once_t onceToken;

  dispatch_once(&onceToken, ^{
    _sharedInstance = [[self alloc] initProxy];
  });

  return _sharedInstance;
}

- (id)initProxy {
  if ((self = [super init])) {
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

#pragma mark - Private Methods

- (void)momentInitiated {
  [self addObserver:self forKeyPath:@"locale" options:0 context:nil];
}

#pragma mark - KVO Delegate Method

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if ([keyPath isEqualToString:@"locale"]) {
    _langBundle = [self langBundleForLocaleWithIdentifier:_locale.localeIdentifier];
  }
}

@end
