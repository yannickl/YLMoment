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

@interface YLMomentTests_SOD_EOD : XCTestCase

@end

@implementation YLMomentTests_SOD_EOD

- (void)setUp
{
    [super setUp];
    
    [[YLMoment proxy] setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
}

- (void)tearDown
{
    [[YLMoment proxy] setLocale:[NSLocale currentLocale]];
    
    [super tearDown];
}

#pragma mark years

- (void)testStartOfYear
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"year"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"years"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"y"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitYear];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(1);
    expect([m day]).to.equal(1);
    expect([m hour]).to.equal(0);
    expect([m minute]).to.equal(0);
    expect([m second]).to.equal(0);
}

- (void)testEndOfYear
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"year"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"years"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"y"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitYear];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(12);
    expect([m day]).to.equal(31);
    expect([m hour]).to.equal(23);
    expect([m minute]).to.equal(59);
    expect([m second]).to.equal(59);
}

#pragma mark months

- (void)testStartOfMonth
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"month"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"months"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"M"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitMonth];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(1);
    expect([m hour]).to.equal(0);
    expect([m minute]).to.equal(0);
    expect([m second]).to.equal(0);
}

- (void)testEndOfMonth
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"month"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"months"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"M"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitMonth];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(28);
    expect([m hour]).to.equal(23);
    expect([m minute]).to.equal(59);
    expect([m second]).to.equal(59);
}

#pragma mark days

- (void)testStartOfDay
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"day"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"days"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"d"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitDay];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(0);
    expect([m minute]).to.equal(0);
    expect([m second]).to.equal(0);
}

- (void)testEndOfDay
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"day"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"days"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"d"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitDay];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(23);
    expect([m minute]).to.equal(59);
    expect([m second]).to.equal(59);
}

#pragma mark hours

- (void)testStartOfHour
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"hour"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"hours"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"h"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitHour];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(3);
    expect([m minute]).to.equal(0);
    expect([m second]).to.equal(0);
}

- (void)testEndOfHour
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"hour"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"hours"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"h"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitHour];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(3);
    expect([m minute]).to.equal(59);
    expect([m second]).to.equal(59);
}

#pragma mark minutes

- (void)testStartOfMinute
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"minute"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"minutes"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"m"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitMinute];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(3);
    expect([m minute]).to.equal(4);
    expect([m second]).to.equal(0);
}

- (void)testEndOfMinute
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"minute"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"minutes"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"m"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitMinute];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(3);
    expect([m minute]).to.equal(4);
    expect([m second]).to.equal(59);
}

#pragma mark seconds

- (void)testStartOfSecond
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"second"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"seconds"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"s"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitSecond];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(3);
    expect([m minute]).to.equal(4);
    expect([m second]).to.equal(5);
}

- (void)testEndOfSecond
{
    YLMoment *m  = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"second"];
    YLMoment *ms = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"seconds"];
    YLMoment *ma = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"s"];
    YLMoment *mu = [[YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitSecond];
    
    expect([m isEqualToMoment:ms]).to.beTruthy();
    expect([m isEqualToMoment:ma]).to.beTruthy();
    expect([m isEqualToMoment:mu]).to.beTruthy();
    
    expect([m year]).to.equal(2011);
    expect([m month]).to.equal(2);
    expect([m day]).to.equal(2);
    expect([m hour]).to.equal(3);
    expect([m minute]).to.equal(4);
    expect([m second]).to.equal(5);
}

@end
