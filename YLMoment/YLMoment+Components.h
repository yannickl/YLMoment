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
 * Category to work with the date components of the moment.
 */
@interface YLMoment (Components)

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

@end
