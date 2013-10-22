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

/**
 `NSMoment` is an object with convenience methods for manipulating dates inspired by the [moment.js](http://momentjs.com/) library.
 */
@interface NSMoment : NSObject

///---------------------
/// @name Initialization
///---------------------

/**
 * @abstract Creates and returns an `NSMoment` with the current date.
 */
+ (id)now;

- (id)initWithDate:(NSDate *)date;
+ (id)momentWithDate:(NSDate *)date;

- (id)initWithDateAsString:(NSString *)dateAsString;
+ (id)momentWithDateAsString:(NSString *)dateAsString;

- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;
+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

- (NSString *)format;
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
