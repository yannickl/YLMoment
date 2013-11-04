//
//  NSMomentTests+Helpers.m
//  NSMomentTests
//
//  Created by YannickL on 29/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "NSMoment.h"

@interface NSMomentTests_Helpers : XCTestCase

@end

@implementation NSMomentTests_Helpers

- (void)testCalendarUnitForKeySingular
{
    expect([NSMoment calendarUnitForKey:@"year"]).to.equal(NSCalendarUnitYear);
    expect([NSMoment calendarUnitForKey:@"month"]).to.equal(NSCalendarUnitMonth);
    expect([NSMoment calendarUnitForKey:@"week"]).to.equal(NSCalendarUnitWeekOfMonth);
    expect([NSMoment calendarUnitForKey:@"day"]).to.equal(NSCalendarUnitDay);
    expect([NSMoment calendarUnitForKey:@"hour"]).to.equal(NSCalendarUnitHour);
    expect([NSMoment calendarUnitForKey:@"minute"]).to.equal(NSCalendarUnitMinute);
    expect([NSMoment calendarUnitForKey:@"second"]).to.equal(NSCalendarUnitSecond);
}

- (void)testCalendarUnitForKeyPlural
{
    expect([NSMoment calendarUnitForKey:@"years"]).to.equal(NSCalendarUnitYear);
    expect([NSMoment calendarUnitForKey:@"months"]).to.equal(NSCalendarUnitMonth);
    expect([NSMoment calendarUnitForKey:@"weeks"]).to.equal(NSCalendarUnitWeekOfMonth);
    expect([NSMoment calendarUnitForKey:@"days"]).to.equal(NSCalendarUnitDay);
    expect([NSMoment calendarUnitForKey:@"hours"]).to.equal(NSCalendarUnitHour);
    expect([NSMoment calendarUnitForKey:@"minutes"]).to.equal(NSCalendarUnitMinute);
    expect([NSMoment calendarUnitForKey:@"seconds"]).to.equal(NSCalendarUnitSecond);
}

- (void)testCalendarUnitForKeyShort
{
    expect([NSMoment calendarUnitForKey:@"y"]).to.equal(NSCalendarUnitYear);
    expect([NSMoment calendarUnitForKey:@"M"]).to.equal(NSCalendarUnitMonth);
    expect([NSMoment calendarUnitForKey:@"w"]).to.equal(NSCalendarUnitWeekOfMonth);
    expect([NSMoment calendarUnitForKey:@"d"]).to.equal(NSCalendarUnitDay);
    expect([NSMoment calendarUnitForKey:@"h"]).to.equal(NSCalendarUnitHour);
    expect([NSMoment calendarUnitForKey:@"m"]).to.equal(NSCalendarUnitMinute);
    expect([NSMoment calendarUnitForKey:@"s"]).to.equal(NSCalendarUnitSecond);
}

@end
