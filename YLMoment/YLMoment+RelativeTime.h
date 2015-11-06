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
 * Category to work with relative times.
 */
@interface YLMoment (RelativeTime)

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

@end
