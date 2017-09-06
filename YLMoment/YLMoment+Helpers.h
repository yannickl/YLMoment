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
 * Category with some helper methods.
 */
@interface YLMoment (Helpers)

/**
 * @abstract Returns the `NSCalendarUnit` corresponding to a given unit string
 * key.
 * @param key A unit string key.
 * @return The `NSCalendarUnit` corresponding to a given unit string key. `-1`
 * if the key is unknown.
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
