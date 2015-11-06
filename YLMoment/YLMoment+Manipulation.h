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
 * Category to make date manipulation easier.
 */
@interface YLMoment (Manipulation)

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

@end
