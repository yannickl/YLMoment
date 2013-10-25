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
 * `NSMoment` is an object with convenience methods for manipulating dates 
 * inspired by the [moment.js](http://momentjs.com/) library.
 * It aims to provide just one entry class to work with dates in Objective-C. It
 * only uses the `Foundation` components (`NSDate`, `NSDateFormatter`, etc.) in
 * order to be as simple as possible.
 */
@interface NSMoment : NSObject

///-----------------------------------------------
/// @name Creating and Initializing Moment Objects
///-----------------------------------------------

#pragma mark Creating and Initializing Moment Objects

/**
 * @abstract Creates and returns a moment which is set to the current date.
 */
+ (id)now;

/**
 * @abstract Initialize a moment using a given date.
 * @param date a date.
 */
- (id)initWithDate:(NSDate *)date;
+ (id)momentWithDate:(NSDate *)date;

/**
 * @abstract Initialize a moment using a date representation of a given string 
 * interpreted using the receiver’s current settings.
 * @param dateAsString The string to parse.
 * @discussion If the `dateAsString` can not be parsed the moment will be not 
 * valid.
 */
- (id)initWithDateAsString:(NSString *)dateAsString;
+ (id)momentWithDateAsString:(NSString *)dateAsString;

- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;
+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;
+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;

///--------------------------------------
/// @name Representing Moments as Strings
///--------------------------------------

#pragma mark Representing Moments as Strings

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
 * @param dateFormat The date format for the receiver. See Data Formatting Guide
 * for a list of the conversion specifiers permitted in date format strings.
 * @return A string representation of the moment formatted using a given date
 * format.
 */
- (NSString *)format:(NSString *)dateFormat;

- (BOOL)isValid;

/**
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
