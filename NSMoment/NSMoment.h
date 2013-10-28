/*
 * NSMoment.h
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

#import <Foundation/Foundation.h>

static NSString * const NSMomentIso8601Format = @"yyyy-MM-dd'T'HH:mm:ssZ";

/**
 * `NSMoment` is a library which provides an high abstraction level for parsing,
 * validating, manipulating, and formatting the dates in Objective-C.
 *
 * Its API is inspired by the well know [moment.js](http://momentjs.com/)
 * library and its core is build upon the `Foundation Framework` components
 * (`NSDate`, `NSDateFormatter`,etc.).
 */
@interface NSMoment : NSObject

#pragma mark Creating and Initializing Moment Objects
/** @name Creating and Initializing Moment Objects */

/**
 * @abstract Creates and returns a moment which is set to the current date.
 */
+ (id)now;

/**
 * @abstract Initializes a moment using a given date.
 * @param date a date.
 */
- (id)initWithDate:(NSDate *)date;

/**
 * @abstract Creates and returns a moment using a given date.
 * @param date a date.
 * @see initWithDate:
 */
+ (id)momentWithDate:(NSDate *)date;

/**
 * @abstract Initializes a moment with an array of numbers that mirror the 
 * following components ['year', 'month', 'day', 'hour', 'minute', 'second'].
 * @param dateAsArray An array which represent the date components.
 * @discussion The moment will create a date in the current timezone.
 */
- (id)initWithArrayComponents:(NSArray *)dateAsArray;

/**
 * @abstract Creates and returns a moment with an array of numbers that mirror
 * the following components ['year', 'month', 'day', 'hour', 'minute', 'second'].
 * @param dateAsArray An array which represent the date components.
 * @discussion The moment will create a date in the current timezone.
 */
+ (id)momentWithArrayComponents:(NSArray *)dateAsArray;

/**
 * @abstract Initializes a moment using the date representation of a given
 * string interpreted.
 * @param dateAsString The date string to parse.
 * @discussion The initializer uses the `NSDataDetector` to interpret the date
 * format.
 */
- (id)initWithDateAsString:(NSString *)dateAsString;

/**
 * @abstract Creates and returns a moment using the date representation of a 
 * given string.
 * @param dateAsString The date string to parse.
 * @discussion The initializer uses the `NSDataDetector` to interpret the date
 * format.
 * @see initWithDateAsString:
 */
+ (id)momentWithDateAsString:(NSString *)dateAsString;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted and using a given date format.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 */
- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

/**
 * @abstract Creates and returns a moment using the date representation of a 
 * given string interpreted and using a given date format.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @see initWithDateAsString:format:
 */
+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted, a given date format, and a given locale identifier.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param localeIdentifier The identifier for the new locale for the receiver.
 */
- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;

/**
 * @abstract Creates and returns a moment using the date representation of a
 * given string interpreted, a given date format, and a given locale identifier.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param localeIdentifier The identifier for the new locale for the receiver.
 * @see initWithDateAsString:format:localeIdentifier:
 */
+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;

#pragma mark Configuring Moments
/** @name Configuring Moments */

/**
 * @abstract Returns the proxy for the receiver.
 * @return The appearance proxy for the receiver.
 * @discussion The proxy is useful to configuring the `NSMoment` in a global way.
 */
+ (instancetype)proxy;

/**
 * @abstract The calendar that will be used for the date calculations.
 * @discussion The default value is set to the current calendar.
 */
@property (atomic, strong) NSCalendar *calendar;

/**
 * @abstract The local that will be used to display the dates.
 * @discussion The default value is set to the current locale.
 */
@property (atomic, strong) NSLocale *locale;

#pragma mark Representing Moments as Strings
/** @name Representing Moments as Strings */

/**
 * @abstract Returns a string representation of the moment formatted using the 
 * `ISO-8601` format.
 * @return A string representation of the moment formatted using the `ISO-8601`
 * format.
 */
- (NSString *)format;

/**
 * @abstract Returns a string representation of the moment formatted using a
 * given date format.
 * @param dateFormat The date format for the receiver. See [Date Formatting Guide](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369-SW1)
 * for a list of the conversion specifiers permitted in date format strings.
 * @return A string representation of the moment formatted using a given date
 * format.
 */
- (NSString *)format:(NSString *)dateFormat;

#pragma mark Validating Moments
/** @name Validating Moments */

/**
 * @abstract Returns true whether the current moment is valid.
 * @return `true` whether the current moment is valid.
 */
- (BOOL)isValid;

#pragma mark Converting Moments
/** @name Working with Moments */

/**
 * Returns the `NSDate` corresponding to the current moment.
 * @return the `NSDate` corresponding to the current moment.
 */
- (NSDate *)date;

#pragma mark Comparing Moments
/** @name Comparing Moments */

/**
 * @abstract Returns a Boolean value that indicates whether a given object
 * is an `NSMoment` object and exactly equal the receiver.
 * @param anotherMoment The moment to compare with the receiver.
 * @return YES if the anotherMoment is an `NSMoment` object and is exactly
 * equal to the receiver, otherwise NO.
 */
- (BOOL)isEqualToMoment:(NSMoment *)anotherMoment;

#pragma mark Working with Relative Time
/** @name Working with Relative Times */

/**
 * @abstract Returns a suffixed string representing the relative time using
 * the locale of the moment.
 * @return A suffixed string with the representing time using the locale of
 * the moment.
 * @see fromNowWithSuffix:
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
 * @discussion The breakdown of which string is displayed for each length
 * of time is outlined in the table below:
 *
 * Range                       | Key | Sample Output
 * --------------------------- | --- | -------------
 * 0 to 45 seconds             | s   | seconds ago
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
 */
- (NSString *)fromNowWithSuffix:(BOOL)suffixed;

/*
 - (void)clone;
 - (void)valueOf;
 - (void)unix;
 - (void)toString;
 - (void)toDate;
 - (void)toISOString;
 - (void)toArray;
 - (void)isValid;
 - (void)isDSTShifted;
 - (void)parsingFlags;
 - (void)incalidAt;
 - (void)utc;
 - (void)local;
 - (void)formatWithString:(NSString *)inputString;
 - (void)addWithInput:Value;
 - (void)substractWithInput:Value;
 - (void)diffWithInput:units:asFloat:
 - (void)fromWithTime:withoutSuffix:
 - (void)fromNowWithoutSuffix;
 - (void)calendar;
 - (void)isLeapYear;
 - (void)isDST;
 - (void)dayWithInput:;
 - (void)monthWithInput:;
 - (void)startOfWithUnits:;
 - (void)endOfWithUnits:;
 - (void)isAfterWithInput:units:;
 - (void)isBeforeWithInput:units:;
 - (void)isSameWithInput:units;
 - (void)minWithOther:;
 - (void)maxWithOther:;
 - (void)zoneWithInput:;
 - (void)zoneAddr;
 - (void)zoneName;
 - (void)parseZone;
 - (void)hasAlignedHourOffsetWithInput:;
 - (void)daysInMonth;
 - (void)dayOfYearWithInput:;
 - (void)weekYearWithInput:;
 - (void)isoWeekYearWithInput:;
 - (void)weekWithInput:;
 - (void)isoWeekWithInput:;
 - (void)weekdayWithInput:;
 - (void)isoWeekdayWithInput:;
 - (void)setWithUnits:;
 - (void)setWithUnits:value:;
 - (void)langWithKey:;
 */

@end
