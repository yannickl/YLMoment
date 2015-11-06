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

/** 
 * Category to make the moments more readable by displaying date in the correct
 * format.
 */
@interface YLMoment (Description)

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

@end
