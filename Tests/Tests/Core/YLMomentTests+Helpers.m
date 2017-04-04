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

- (void)testCalUnitForInvalidKey
{
  NSUInteger invalid = -1;

  expect([YLMoment calendarUnitForKey:@"foo"]).to.equal(invalid);
  expect([YLMoment calendarUnitForKey:@"bar"]).to.equal(invalid);
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

- (void)testMomentIsSameMoment {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @0]];

  expect([moment1 isSameMoment:moment2]).to.beTruthy();
  expect([moment1 isSameMoment:moment3]).to.beFalsy();
}

- (void)testMomentIsSameMomentForUnitYear {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2012, @2, @2, @3, @4, @5]];

  expect([moment1 isSameMoment:moment2 forUnit:NSCalendarUnitYear]).to.beTruthy();
  expect([moment1 isSameMoment:moment3 forUnit:NSCalendarUnitYear]).to.beFalsy();
}

- (void)testMomentIsSameMomentForUnitMonth {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @3, @2, @3, @4, @5]];
  YLMoment *moment4 = [YLMoment momentWithArray:@[@2012, @2, @2, @3, @4, @5]];

  expect([moment1 isSameMoment:moment2 forUnit:NSCalendarUnitMonth]).to.beTruthy();
  expect([moment1 isSameMoment:moment3 forUnit:NSCalendarUnitMonth]).to.beFalsy();
  expect([moment1 isSameMoment:moment4 forUnit:NSCalendarUnitMonth]).to.beFalsy();
}

- (void)testMomentIsSameMomentForUnitDay {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @3, @3, @4, @5]];
  YLMoment *moment4 = [YLMoment momentWithArray:@[@2011, @3, @2, @3, @4, @5]];
  YLMoment *moment5 = [YLMoment momentWithArray:@[@2012, @2, @2, @3, @4, @5]];

  expect([moment1 isSameMoment:moment2 forUnit:NSCalendarUnitDay]).to.beTruthy();
  expect([moment1 isSameMoment:moment3 forUnit:NSCalendarUnitDay]).to.beFalsy();
  expect([moment1 isSameMoment:moment4 forUnit:NSCalendarUnitDay]).to.beFalsy();
  expect([moment1 isSameMoment:moment5 forUnit:NSCalendarUnitDay]).to.beFalsy();
}

- (void)testMomentIsSameMomentForUnitHour {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @4, @4, @5]];
  YLMoment *moment4 = [YLMoment momentWithArray:@[@2011, @2, @3, @3, @4, @5]];
  YLMoment *moment5 = [YLMoment momentWithArray:@[@2011, @3, @2, @3, @4, @5]];
  YLMoment *moment6 = [YLMoment momentWithArray:@[@2012, @2, @2, @3, @4, @5]];

  expect([moment1 isSameMoment:moment2 forUnit:NSCalendarUnitHour]).to.beTruthy();
  expect([moment1 isSameMoment:moment3 forUnit:NSCalendarUnitHour]).to.beFalsy();
  expect([moment1 isSameMoment:moment4 forUnit:NSCalendarUnitHour]).to.beFalsy();
  expect([moment1 isSameMoment:moment5 forUnit:NSCalendarUnitHour]).to.beFalsy();
  expect([moment1 isSameMoment:moment6 forUnit:NSCalendarUnitHour]).to.beFalsy();
}

- (void)testMomentIsSameMomentForUnitMinute {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @5, @5]];
  YLMoment *moment4 = [YLMoment momentWithArray:@[@2011, @2, @2, @4, @4, @5]];
  YLMoment *moment5 = [YLMoment momentWithArray:@[@2011, @2, @3, @3, @4, @5]];
  YLMoment *moment6 = [YLMoment momentWithArray:@[@2011, @3, @2, @3, @4, @5]];
  YLMoment *moment7 = [YLMoment momentWithArray:@[@2012, @2, @2, @3, @4, @5]];

  expect([moment1 isSameMoment:moment2 forUnit:NSCalendarUnitMinute]).to.beTruthy();
  expect([moment1 isSameMoment:moment3 forUnit:NSCalendarUnitMinute]).to.beFalsy();
  expect([moment1 isSameMoment:moment4 forUnit:NSCalendarUnitMinute]).to.beFalsy();
  expect([moment1 isSameMoment:moment5 forUnit:NSCalendarUnitMinute]).to.beFalsy();
  expect([moment1 isSameMoment:moment6 forUnit:NSCalendarUnitMinute]).to.beFalsy();
  expect([moment1 isSameMoment:moment7 forUnit:NSCalendarUnitMinute]).to.beFalsy();
}

- (void)testMomentIsSameMomentForUnitSecond {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @6]];
  YLMoment *moment4 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @5, @5]];
  YLMoment *moment5 = [YLMoment momentWithArray:@[@2011, @2, @2, @4, @4, @5]];
  YLMoment *moment6 = [YLMoment momentWithArray:@[@2011, @2, @3, @3, @4, @5]];
  YLMoment *moment7 = [YLMoment momentWithArray:@[@2011, @3, @2, @3, @4, @5]];
  YLMoment *moment8 = [YLMoment momentWithArray:@[@2012, @2, @2, @3, @4, @5]];

  expect([moment1 isSameMoment:moment2 forUnit:NSCalendarUnitSecond]).to.beTruthy();
  expect([moment1 isSameMoment:moment3 forUnit:NSCalendarUnitSecond]).to.beFalsy();
  expect([moment1 isSameMoment:moment4 forUnit:NSCalendarUnitSecond]).to.beFalsy();
  expect([moment1 isSameMoment:moment5 forUnit:NSCalendarUnitSecond]).to.beFalsy();
  expect([moment1 isSameMoment:moment6 forUnit:NSCalendarUnitSecond]).to.beFalsy();
  expect([moment1 isSameMoment:moment7 forUnit:NSCalendarUnitSecond]).to.beFalsy();
  expect([moment1 isSameMoment:moment8 forUnit:NSCalendarUnitSecond]).to.beFalsy();
}

- (void)testMomentIsSameMomentForUnsupportedUnit {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  expect([moment1 isSameMoment:moment2 forUnit:NSCalendarUnitWeekday]).to.beFalsy();
}

- (void)testMomentIsBeforeMoment {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @6]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @4]];

  expect([moment1 isBeforeMoment:moment2]).to.beTruthy();
  expect([moment1 isBeforeMoment:moment1]).to.beFalsy();
  expect([moment1 isBeforeMoment:moment3]).to.beFalsy();
}

- (void)testMomentIsBeforeMomentYear {
  YLMoment *moment1 = [YLMoment momentWithDateAsString:@"01/01/2016 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];
  YLMoment *moment2 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];

  expect([moment1 isBeforeMoment:moment2]).to.beTruthy();
  expect([moment2 isBeforeMoment:moment1]).to.beFalsy();
}

- (void)testMomentIsBeforeMomentMonth {
  YLMoment *moment1 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];
  YLMoment *moment2 = [YLMoment momentWithDateAsString:@"01/02/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];

  expect([moment1 isBeforeMoment:moment2]).to.beTruthy();
  expect([moment2 isBeforeMoment:moment1]).to.beFalsy();
}

- (void)testMomentIsBeforeMomentDay {
  YLMoment *moment1 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];
  YLMoment *moment2 = [YLMoment momentWithDateAsString:@"02/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];

  expect([moment1 isBeforeMoment:moment2]).to.beTruthy();
  expect([moment2 isBeforeMoment:moment1]).to.beFalsy();
}

- (void)testMomentIsBeforeMomentHour {
  YLMoment *moment1 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];
  YLMoment *moment2 = [YLMoment momentWithDateAsString:@"01/01/2017 01:00:00" format:@"dd/MM/yyyy hh:mm:ss"];

  expect([moment1 isBeforeMoment:moment2]).to.beTruthy();
  expect([moment2 isBeforeMoment:moment1]).to.beFalsy();
}

- (void)testMomentIsBeforeMomentMinute {
  YLMoment *moment1 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];
  YLMoment *moment2 = [YLMoment momentWithDateAsString:@"01/01/2017 00:01:00" format:@"dd/MM/yyyy hh:mm:ss"];

  expect([moment1 isBeforeMoment:moment2]).to.beTruthy();
  expect([moment2 isBeforeMoment:moment1]).to.beFalsy();
}

- (void)testMomentIsBeforeMomentSecond {
  YLMoment *moment1 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];
  YLMoment *moment2 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:01" format:@"dd/MM/yyyy hh:mm:ss"];

  expect([moment1 isBeforeMoment:moment2]).to.beTruthy();
  expect([moment2 isBeforeMoment:moment1]).to.beFalsy();
}

- (void)testMomentIsBeforeMomentEqual {
  YLMoment *moment1 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];
  YLMoment *moment2 = [YLMoment momentWithDateAsString:@"01/01/2017 00:00:00" format:@"dd/MM/yyyy hh:mm:ss"];

  expect([moment1 isBeforeMoment:moment2]).to.beFalsy();
  expect([moment2 isBeforeMoment:moment1]).to.beFalsy();
}

- (void)testMomentIsAfterMoment {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @6]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @4]];

  expect([moment1 isAfterMoment:moment2]).to.beFalsy();
  expect([moment1 isAfterMoment:moment1]).to.beFalsy();
  expect([moment1 isAfterMoment:moment3]).to.beTruthy();
}

- (void)testMomentIsBetweenMoments {
  YLMoment *moment1 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]];
  YLMoment *moment2 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @4]];
  YLMoment *moment3 = [YLMoment momentWithArray:@[@2011, @2, @2, @3, @4, @6]];

  expect([moment1 isBetweenMoments:moment2 andEndMoment:moment3]).to.beTruthy();
  expect([moment1 isBetweenMoments:moment2 andEndMoment:moment1]).to.beFalsy();
  expect([moment1 isBetweenMoments:moment1 andEndMoment:moment2]).to.beFalsy();
  expect([moment1 isBetweenMoments:moment3 andEndMoment:moment1]).to.beFalsy();
  expect([moment1 isBetweenMoments:moment1 andEndMoment:moment3]).to.beFalsy();
  expect([moment1 isBetweenMoments:moment1 andEndMoment:moment1]).to.beTruthy();
}

@end
