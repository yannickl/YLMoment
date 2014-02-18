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

@interface YLMomentTests_Add_Substract : XCTestCase

@end

@implementation YLMomentTests_Add_Substract

- (void)testAddCalendarUnit
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitSecond] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitMinute] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitHour] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitDay] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitWeekOfMonth] day]).to.equal(20);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitMonth] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitYear] year]).to.equal(2012);
}

- (void)testAddStringLong
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forUnitKey:@"second"] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forUnitKey:@"minute"] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forUnitKey:@"hour"] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forUnitKey:@"day"] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forUnitKey:@"month"] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forUnitKey:@"year"] year]).to.equal(2012);
}

- (void)testAddStringLongPlural
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forUnitKey:@"seconds"] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forUnitKey:@"minutes"] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forUnitKey:@"hours"] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forUnitKey:@"days"] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forUnitKey:@"months"] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forUnitKey:@"years"] year]).to.equal(2012);
}

- (void)testAddStringShort
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forUnitKey:@"s"] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forUnitKey:@"m"] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forUnitKey:@"h"] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forUnitKey:@"d"] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forUnitKey:@"M"] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forUnitKey:@"y"] year]).to.equal(2012);
}

- (void)testAddDuration {
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addDuration:12] second]).to.equal(20);
    expect([[a addDuration:-20] second]).to.equal(0);
    expect([[a addDuration:-2] second]).to.equal(58);
}

- (void)testSubtractCalendarUnit
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a subtractAmountOfTime:1 forCalendarUnit:NSCalendarUnitSecond] second]).to.equal(7);
    expect([[a subtractAmountOfTime:1 forCalendarUnit:NSCalendarUnitMinute] minute]).to.equal(6);
    expect([[a subtractAmountOfTime:1 forCalendarUnit:NSCalendarUnitHour] hour]).to.equal(5);
    expect([[a subtractAmountOfTime:1 forCalendarUnit:NSCalendarUnitDay] day]).to.equal(11);
    expect([[a subtractAmountOfTime:1 forCalendarUnit:NSCalendarUnitWeekOfMonth] day]).to.equal(4);
    expect([[a subtractAmountOfTime:1 forCalendarUnit:NSCalendarUnitMonth] month]).to.equal(8);
    expect([[a subtractAmountOfTime:1 forCalendarUnit:NSCalendarUnitYear] year]).to.equal(2010);
}

- (void)testSubtractStringLong
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a subtractAmountOfTime:1 forUnitKey:@"second"] second]).to.equal(7);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"minute"] minute]).to.equal(6);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"hour"] hour]).to.equal(5);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"day"] day]).to.equal(11);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"month"] month]).to.equal(8);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"year"] year]).to.equal(2010);
}

- (void)testSubtractStringLongPlural
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a subtractAmountOfTime:1 forUnitKey:@"seconds"] second]).to.equal(7);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"minutes"] minute]).to.equal(6);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"hours"] hour]).to.equal(5);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"days"] day]).to.equal(11);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"months"] month]).to.equal(8);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"years"] year]).to.equal(2010);
}

- (void)testSubtractStringShort
{
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a subtractAmountOfTime:1 forUnitKey:@"s"] second]).to.equal(7);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"m"] minute]).to.equal(6);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"h"] hour]).to.equal(5);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"d"] day]).to.equal(11);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"M"] month]).to.equal(8);
    expect([[a subtractAmountOfTime:1 forUnitKey:@"y"] year]).to.equal(2010);
}

- (void)testSubstractDuration {
    YLMoment *a = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a subtractDuration:8] second]).to.equal(0);
    expect([[a subtractDuration:-10] second]).to.equal(10);
    expect([[a subtractDuration:0] second]).to.equal(10);
}

@end
