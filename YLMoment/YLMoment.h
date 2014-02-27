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

#import <Foundation/Foundation.h>

static NSString * const YLMomentIso8601Format = @"yyyy-MM-dd'T'HH:mm:ssZ";

/**
 * YLMoment is a library which provides an high abstraction level for parsing,
 * validating, manipulating, and formatting the dates in Objective-C.
 *
 * Its API is inspired by the well known moment.js library, however unlike its
 * counterpart, its core is built upon the Foundation Framework components 
 * (NSDate, NSCalendar, etc.) to enable the interoperability with them.
 *
 * This library is designed to facilitate the manipulation of times, dates, 
 * calendars, and durations in Objective-C by providing a single, easy, and 
 * unified approach to dealing with them.
 */
@interface YLMoment : NSObject

#pragma mark Creating and Initializing Moment Objects
/** @name Creating and Initializing Moment Objects */

/**
 * @abstract Creates and returns a moment which is set to the current date.
 * @since 0.1.0
 */
+ (instancetype)now;

/**
 * @abstract Creates and returns a moment with the current datetime using 
 * the Universal Coordinated Time (UTC).
 * @since 0.4.0
 */
+ (instancetype)utc;

/**
 * @abstract Initializes a moment using a given date.
 * @param date a date.
 * @since 0.1.0
 */
- (instancetype)initWithDate:(NSDate *)date;

/**
 * @abstract Creates and returns a moment using a given date.
 * @param date a date.
 * @see initWithDate:
 * @since 0.1.0
 */
+ (instancetype)momentWithDate:(NSDate *)date;

/**
 * @abstract Initializes a moment with an array of numbers that mirror the 
 * following components ['year', 'month', 'day', 'hour', 'minute', 'second'].
 * @param dateAsArray An array which represent the date components.
 * @discussion The moment will create a date in the current timezone.
 * @since 0.1.0
 */
- (instancetype)initWithArray:(NSArray *)dateAsArray;

/**
 * @abstract Creates and returns a moment with an array of numbers that mirror
 * the following components ['year', 'month', 'day', 'hour', 'minute', 'second'].
 * @param dateAsArray An array which represent the date components.
 * @discussion The moment will create a date in the current timezone.
 * @see initWithArray:
 * @since 0.1.0
 */
+ (instancetype)momentWithArray:(NSArray *)dateAsArray;

/**
 * @abstract Initializes a moment using the date representation of a given
 * string interpreted.
 * @param dateAsString The date string to parse.
 * @discussion The initializer uses the `NSDataDetector` to interpret the date
 * format.
 * @since 0.1.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString;

/**
 * @abstract Creates and returns a moment using the date representation of a 
 * given string.
 * @param dateAsString The date string to parse.
 * @discussion The initializer uses the `NSDataDetector` to interpret the date
 * format.
 * @see initWithDateAsString:
 * @since 0.1.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted and using a given date format.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @since 0.1.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

/**
 * @abstract Creates and returns a moment using the date representation of a 
 * given string interpreted and using a given date format.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @see initWithDateAsString:format:
 * @since 0.1.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted, a given date format, and a given locale identifier.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param localeIdentifier The identifier for the new locale for the receiver.
 * @since 0.1.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;

/**
 * @abstract Creates and returns a moment using the date representation of a
 * given string interpreted, a given date format, and a given locale identifier.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param localeIdentifier The identifier for the new locale for the receiver.
 * @see initWithDateAsString:format:localeIdentifier:
 * @since 0.1.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted, a given date format, a given locale, and a time zone.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param locale The locale object.
 * @param timeZone The time zone object.
 * @discussion The given `locale` and `timeZone` are set by default to the new
 * moment. If you want you the global (proxy) value instead, set them to nil.
 * @since 0.4.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone;

/**
 * @abstract Creates and returns a moment using the date representation of a
 * given string interpreted, a given date format, a given locale, and a time
 * zone.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param locale The locale object.
 * @param timeZone The time zone object.
 * @discussion The given `locale` and `timeZone` are set by default to the new
 * moment. If you want you the global (proxy) value instead, set them to nil.
 * @see initWithDateAsString:format:locale:timeZone:
 * @since 0.4.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone;

#pragma mark - Proxy Method
/** @name Proxy Method */

/**
 * @abstract Returns the proxy for the receiver.
 * @return The appearance proxy for the receiver.
 * @discussion The proxy is useful to configuring the `YLMoment` in a global way.
 * @since 0.1.0
 */
+ (instancetype)proxy;

#pragma mark Configuring Moments
/** @name Configuring Moments */

/**
 * @abstract The calendar that will be used for the date calculations.
 * @discussion The default value is set to the current calendar.
 * @since 0.1.0
 */
@property (atomic, strong) NSCalendar *calendar;

/**
 * @abstract The local that will be used to display the dates.
 * @discussion The default value is set to the current locale.
 * @since 0.1.0
 */
@property (atomic, strong) NSLocale *locale;

/**
 * @abstract The time zone that will be used to display the dates.
 * @discussion The default value of the time zone is set to the default time 
 * zone of the user.
 * @since 0.2.0
 */
@property (atomic, strong) NSTimeZone *timeZone;

/**
 * @abstract The date style of the receiver.
 * @discussion By default the date style is set to `NSDateFormatterLongStyle`.
 * @since 0.2.0
 */
@property (atomic, assign) NSDateFormatterStyle dateStyle;

/**
 * @abstract The time style of the receiver.
 * @discussion By default the date style is set to `NSDateFormatterLongStyle`.
 * @since 0.2.0
 */
@property (atomic, assign) NSDateFormatterStyle timeStyle;

#pragma mark Representing Moments as Strings
/** @name Representing Moments as Strings */

/**
 * @abstract Returns a string representation of the moment formatted using the 
 * `ISO-8601` format.
 * @return A string representation of the moment formatted using the `ISO-8601`
 * format.
 * @since 0.1.0
 */
- (NSString *)format;

/**
 * @abstract Returns a string representation of the moment formatted using a
 * given date format.
 * @param dateFormat The date format for the receiver. See [Date Formatting Guide](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369-SW1)
 * for a list of the conversion specifiers permitted in date format strings.
 * @return A string representation of the moment formatted using a given date
 * format.
 * @discussion The breakdown of which string is displayed for each format 
 * tokens is outlined in the table below:
 *
 * Format String         | Output String
 * --------------------- | --------------
 * M/d/y                 | 11/4/2012
 * MM/dd/yy              | 11/04/12
 * MMM d, ''yy           | Nov 4, '12
 * MMMM                  | November
 * E                     | Sun
 * EEEE                  | Sunday
 * 'Week' w 'of 52'      | Week 45 of 52
 * 'Day' D 'of 365'      | Day 309 of 365
 * QQQ                   | Q4
 * QQQQ                  | 4th quarter
 * m 'minutes past' h    | 9 minutes past 8
 * h:mm a                | 8:09 PM
 * HH:mm:ss's'           | 20:09:00s
 * HH:mm:ss:SS           | 20:09:00:00
 * h:mm a zz             | 8:09 PM CST
 * h:mm a zzzz           | 8:09 PM Central Standard Time
 * yyyy-MM-dd HH:mm:ss Z | 2012-11-04 20:09:00 -0600
 *
 * @since 0.1.0
 */
- (NSString *)format:(NSString *)dateFormat;

#pragma mark Validating Moments
/** @name Validating Moments */

/**
 * @abstract Returns true whether the current moment is valid.
 * @return `true` whether the current moment is valid.
 * @since 0.1.0
 */
- (BOOL)isValid;

#pragma mark Converting Moments
/** @name Working with Moments */

/**
 * Returns the `NSDate` corresponding to the current moment.
 * @return the `NSDate` corresponding to the current moment.
 * @since 0.1.0
 */
- (NSDate *)date;

#pragma mark Comparing Moments
/** @name Comparing Moments */

/**
 * @abstract Returns a Boolean value that indicates whether a given object
 * is an `YLMoment` object and exactly equal the receiver.
 * @param anotherMoment The moment to compare with the receiver.
 * @return YES if the anotherMoment is an `YLMoment` object and is exactly
 * equal to the receiver, otherwise NO.
 * @since 0.1.0
 */
- (BOOL)isEqualToMoment:(YLMoment *)anotherMoment;

#pragma mark Working with Relative Time
/** @name Working with Relative Times */

/**
 * @abstract Returns a suffixed string representing the relative time using
 * the locale of the moment.
 * @return A suffixed string with the representing time using the locale of
 * the moment.
 * @see fromNowWithSuffix:
 * @since 0.1.0
 */
- (NSString *)fromNow;

/**
 * @abstract Returns a string representing the relative time using the 
 * locale of the moment and suffixed if necessary.
 * @param suffixed Tells whether the relative time needs to be suffixed. E.g.
 * a relative suffixed time looks that `4 years ago` whereas a relative 
 * unsuffixed time looks like this `4 years`.
 * @return a string representing the relative time using the locale of the
 * moment and suffixed if necessary.
 * @see: fromDate:withSuffix:
 */
- (NSString *)fromNowWithSuffix:(BOOL)suffixed;

/**
 * @abstract Returns a suffixed string representing the relative time from a
 * given date using the locale of the moment.
 * @param date The reference date.
 * @return A suffixed string representing the relative time from a given date
 * using the locale of the moment.
 * @see fromDate:withSuffix:
 * @since 0.1.0
 */
- (NSString *)fromDate:(NSDate *)date;

/**
 * @abstract Returns a suffixed string representing the relative time from a
 * given date using the locale of the moment and suffixed if necessary.
 * @param date The reference date.
 * @param suffixed Tells whether the relative time needs to be suffixed. E.g.
 * a relative suffixed time looks that `4 years ago` whereas a relative
 * unsuffixed time looks like this `4 years`.
 * @return A suffixed string representing the relative time from a given date
 * using the locale of the moment and suffixed if necessary.
 * @discussion The breakdown of which string is displayed for each length
 * of time is outlined in the table below:
 *
 * Range                       | Key | Sample Output
 * --------------------------- | --- | -------------
 * 0 to 45 seconds             | s   | a few seconds ago
 * 45 to 90 seconds            | m   | a minute ago
 * 90 seconds to 45 minutes    | mm  | 2 minutes ago ... 45 minutes ago
 * 45 to 90 minutes            | h   | an hour ago
 * 90 minutes to 22 hours      | hh  | 2 hours ago ... 22 hours ago
 * 22 to 36 hours              | d   | a day ago
 * 36 hours to 25 days         | dd  | 2 days ago ... 25 days ago
 * 25 to 45 days               | M   | a month ago
 * 45 to 345 days              | MM  | 2 months ago ... 11 months ago
 * 345 to 547 days (1.5 years) | y   | a year ago
 * 548 days+                   | yy  | 2 years ago ... 20 years ago
 *
 * @since 0.1.0
 */
- (NSString *)fromDate:(NSDate *)date withSuffix:(BOOL)suffixed;

/**
 * @abstract Returns a suffixed string representing the relative time from a
 * given moment using the locale of the moment.
 * @param moment The reference moment.
 * @return A suffixed string representing the relative time from a given
 * moment using the locale of the moment.
 * @see fromMoment:withSuffix:
 * @since 0.1.0
 */
- (NSString *)fromMoment:(YLMoment *)moment;

/**
 * @abstract Returns a suffixed string representing the relative time from a
 * given moment using the locale of the moment and suffixed if necessary.
 * @param moment The reference moment.
 * @param suffixed Tells whether the relative time needs to be suffixed. E.g.
 * a relative suffixed time looks that `4 years ago` whereas a relative
 * unsuffixed time looks like this `4 years`.
 * @return A suffixed string representing the relative time from a given moment
 * using the locale of the moment and suffixed if necessary.
 * @see fromDate:withSuffix:
 * @since 0.1.0
 */
- (NSString *)fromMoment:(YLMoment *)moment withSuffix:(BOOL)suffixed;

#pragma mark Manipulating Moments
/** @name Manipulating Moments */

/**
 * @abstract Mutates and returns the original moment by adding time. To add time,
 * pass the key of what time you want to add, and the corresponding amount.
 * @param amount The amount of time you want to add.
 * @param key The key of what time you want to add.
 * @return The current moment with the amount of time added for a fluent interface
 * pattern.
 * @see calendarUnitForKey:
 * @since 0.1.0
 */
- (YLMoment *)addAmountOfTime:(NSInteger)amount forUnitKey:(NSString *)key;

/**
 * @abstract Mutates and returns the original moment by adding time. To add
 * time, pass the calendar unit of what time you want to add, and the corresponding
 * amount.
 * @param amount The amount of time you want to add.
 * @param unit The calendar unit of what time you want to add.
 * @return The current moment with the amount of time added for a fluent interface
 * pattern.
 * @since 0.1.0
 */
- (YLMoment *)addAmountOfTime:(NSInteger)amount forCalendarUnit:(NSCalendarUnit)unit;

/**
 * @abstract Mutates and returns the original moment by adding a time duration.
 * @param duration A time interval to add.
 * @return The current moment with the time duration added for a fluent interface
 * pattern.
 * @since 0.1.0
 */
- (YLMoment *)addDuration:(NSTimeInterval)duration;

/**
 * @abstract Mutates and returns the original moment by subtracting time. To subtract
 * time, pass the key of what time you want to subtract, and the corresponding amount.
 * @param amount The amount of time you want to subtract.
 * @param key The key of what time you want to subtract.
 * @return The current moment with the amount of time subtracted for a fluent interface
 * pattern.
 * @see calendarUnitForKey:
 * @see addAmountOfTime:forUnitKey:
 * @since 0.3.0
 */
- (YLMoment *)subtractAmountOfTime:(NSInteger)amount forUnitKey:(NSString *)key;

/**
 * @abstract Mutates and returns the original moment by subtracting time. To add
 * time, pass the calendar unit of what time you want to subtract, and the corresponding
 * amount.
 * @param amount The amount of time you want to subtract.
 * @param unit The calendar unit of what time you want to subtract.
 * @return The current moment with the amount of time subtracted for a fluent interface
 * pattern.
 * @see addAmountOfTime:forCalendarUnit:
 * @since 0.3.0
 */
- (YLMoment *)subtractAmountOfTime:(NSInteger)amount forCalendarUnit:(NSCalendarUnit)unit;

/**
 * @abstract Mutates and returns the original moment by subtracting a time duration.
 * @param duration A time interval to subtract.
 * @return The current moment with the time duration subtracted for a fluent interface
 * pattern.
 * @see addDuration:
 * @since 0.3.0
 */
- (YLMoment *)subtractDuration:(NSTimeInterval)duration;

/**
 * @abstract Mutates and returns the original moment by setting it to the start of
 * a given unit of time.
 * @param unitString The key of what time you want to start.
 * @return The original moment with the setting applied for a fluent interface
 * pattern.
 * @see startOfCalendarUnit:
 * @since 0.1.0
 */
- (YLMoment *)startOf:(NSString *)unitString;

/**
 * @abstract Mutates and returns the original moment by setting it to the start of
 * a given unit of time.
 * @param unit The key of what time you want to start.
 * @return The original moment with the setting applied for a fluent interface
 * pattern.
 * @since 0.1.0
 */
- (YLMoment *)startOfCalendarUnit:(NSCalendarUnit)unit;

/**
 * @abstract Mutates and returns the original moment by setting it to the end of
 * a given unit of time. This is the same as `startOf`, only instead of setting 
 * to the start of a unit of time, it sets to the end of a unit of time.
 * @param unitString The key of what time you want to end.
 * @return The original moment with the setting applied for a fluent interface
 * pattern.
 * @see endOfCalendarUnit:
 * @since 0.1.0
 */
- (YLMoment *)endOf:(NSString *)unitString;

/**
 * @abstract Mutates and returns the original moment by setting it to the end of
 * a given unit of time. This is the same as `startOfCalendarUnit`, only instead
 * of setting to the start of a unit of time, it sets to the end of a unit of time.
 * @param unit The key of what time you want to end.
 * @return The original moment with the setting applied for a fluent interface
 * pattern.
 * @since 0.1.0
 */
- (YLMoment *)endOfCalendarUnit:(NSCalendarUnit)unit;

#pragma mark Getting/Setting Moment Components
/** @name Getting/Setting Moment Components */

/**
 * @abstract Gets or sets the seconds.
 * @discussion Accepts numbers from 0 to 59. If the range is exceeded, it will bubble
 * up to the minutes.
 * @since 0.1.0
 */
@property (nonatomic, assign) NSUInteger second;

/**
 * @abstract Gets or sets the minutes.
 * @discussion Accepts numbers from 0 to 59. If the range is exceeded, it will bubble
 * up to the hours.
 * @since 0.1.0
 */
@property (nonatomic, assign) NSUInteger minute;

/**
 * @abstract Gets or sets the hour.
 * @discussion Accepts numbers from 0 to 23. If the range is exceeded, it will bubble 
 * up to the day.
 * @since 0.1.0
 */
@property (nonatomic, assign) NSUInteger hour;

/**
 * @abstract Gets or sets the day of the month.
 * @discussion Accepts numbers from 1 to 31. If the range is exceeded, it will bubble
 * up to the months.
 * @since 0.1.0
 */
@property (nonatomic, assign) NSUInteger day;

/**
 * @abstract Gets or sets the month.
 * @discussion Accepts numbers from 1 to 12. If the range is exceeded, it will bubble
 * up to the year.
 * @since 0.1.0
 */
@property (nonatomic, assign) NSUInteger month;

/**
 * @abstract Gets or sets the year.
 * @since 0.1.0
 */
@property (nonatomic, assign) NSUInteger year;

#pragma mark Helpers
/** @name Helpers */

/**
 * @abstract Returns the `NSCalendarUnit` corresponding to a given unit string
 * key.
 * @param key A unit string key.
 * @return The `NSCalendarUnit` corresponding to a given unit string key. `-1`
 * if the key is unknow.
 * @discussion There are some shorthand keys as well if you're into that whole
 * brevity thing:
 *
 * Singular  | Plural    | Shorthand | NSCalendarUnit Correspondence
 * --------- | --------- | --------- | -----------------------------
 * year      | years     | y         | `NSCalendarUnitYear`
 * month     | months    | M         | `NSCalendarUnitMonth`
 * week      | weeks     | w         | `NSCalendarUnitWeekOfMonth`
 * day       | days      | d         | `NSCalendarUnitDay`
 * hour      | hours     | h         | `NSCalendarUnitHour`
 * minute    | minutes   | m         | `NSCalendarUnitMinute`
 * second    | seconds   | s         | `NSCalendarUnitSecond`
 *
 * @since 0.1.0
 */
+ (NSCalendarUnit)calendarUnitForKey:(NSString *)key;

@end
