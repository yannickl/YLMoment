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

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "YLMoment.h"

@interface YLMomentTests_Helpers : XCTestCase

@end

@implementation YLMomentTests_Helpers

- (void)testCalendarUnitForKeySingular
{
    expect([YLMoment calendarUnitForKey:@"year"]).to.equal(NSCalendarUnitYear);
    expect([YLMoment calendarUnitForKey:@"month"]).to.equal(NSCalendarUnitMonth);
    expect([YLMoment calendarUnitForKey:@"week"]).to.equal(NSCalendarUnitWeekOfMonth);
    expect([YLMoment calendarUnitForKey:@"day"]).to.equal(NSCalendarUnitDay);
    expect([YLMoment calendarUnitForKey:@"hour"]).to.equal(NSCalendarUnitHour);
    expect([YLMoment calendarUnitForKey:@"minute"]).to.equal(NSCalendarUnitMinute);
    expect([YLMoment calendarUnitForKey:@"second"]).to.equal(NSCalendarUnitSecond);
}

- (void)testCalendarUnitForKeyPlural
{
    expect([YLMoment calendarUnitForKey:@"years"]).to.equal(NSCalendarUnitYear);
    expect([YLMoment calendarUnitForKey:@"months"]).to.equal(NSCalendarUnitMonth);
    expect([YLMoment calendarUnitForKey:@"weeks"]).to.equal(NSCalendarUnitWeekOfMonth);
    expect([YLMoment calendarUnitForKey:@"days"]).to.equal(NSCalendarUnitDay);
    expect([YLMoment calendarUnitForKey:@"hours"]).to.equal(NSCalendarUnitHour);
    expect([YLMoment calendarUnitForKey:@"minutes"]).to.equal(NSCalendarUnitMinute);
    expect([YLMoment calendarUnitForKey:@"seconds"]).to.equal(NSCalendarUnitSecond);
}

- (void)testCalendarUnitForKeyShort
{
    expect([YLMoment calendarUnitForKey:@"y"]).to.equal(NSCalendarUnitYear);
    expect([YLMoment calendarUnitForKey:@"M"]).to.equal(NSCalendarUnitMonth);
    expect([YLMoment calendarUnitForKey:@"w"]).to.equal(NSCalendarUnitWeekOfMonth);
    expect([YLMoment calendarUnitForKey:@"d"]).to.equal(NSCalendarUnitDay);
    expect([YLMoment calendarUnitForKey:@"h"]).to.equal(NSCalendarUnitHour);
    expect([YLMoment calendarUnitForKey:@"m"]).to.equal(NSCalendarUnitMinute);
    expect([YLMoment calendarUnitForKey:@"s"]).to.equal(NSCalendarUnitSecond);
}

- (void)testMomentEqualsToMoment {
    YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
    YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
    YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @0]];
    
    expect([moment1 isEqualToMoment:moment2]).to.beTruthy();
    
    expect([moment1 isEqualToMoment:moment3]).to.beFalsy();
}

- (void)testNilEqualsToMoment {
    YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
    expect([moment1 isEqualToMoment:nil]).to.beFalsy();
}

@end
