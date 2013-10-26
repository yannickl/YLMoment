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
- (NSDate *)toDate;

#pragma mark Working with Moments
/** @name Working with Moments */

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
