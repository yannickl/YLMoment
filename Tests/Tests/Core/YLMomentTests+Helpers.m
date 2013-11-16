//
//  YLMomentTests+Helpers
//  YLMomentTests
//
//  Created by YannickL on 29/10/2013.
//
//

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

@end
