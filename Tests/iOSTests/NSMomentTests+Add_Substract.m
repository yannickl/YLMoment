//
//  NSMomentTests+Add_Substract.m
//  NSMomentTests
//
//  Created by YannickL on 29/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "NSMoment.h"

@interface NSMomentTests_Add_Substract : XCTestCase

@end

@implementation NSMomentTests_Add_Substract

- (void)testAddCalendarUnit
{
    NSMoment *a = [NSMoment momentWithArrayComponents:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitSecond] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitMinute] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitHour] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitDay] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitMonth] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forCalendarUnit:NSCalendarUnitYear] year]).to.equal(2012);
}

- (void)testAddStringLong
{
    NSMoment *a = [NSMoment momentWithArrayComponents:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forUnitKey:@"second"] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forUnitKey:@"minute"] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forUnitKey:@"hour"] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forUnitKey:@"day"] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forUnitKey:@"month"] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forUnitKey:@"year"] year]).to.equal(2012);
}

- (void)testAddStringLongPlural
{
    NSMoment *a = [NSMoment momentWithArrayComponents:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forUnitKey:@"seconds"] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forUnitKey:@"minutes"] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forUnitKey:@"hours"] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forUnitKey:@"days"] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forUnitKey:@"months"] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forUnitKey:@"years"] year]).to.equal(2012);
}

- (void)testAddStringShort
{
    NSMoment *a = [NSMoment momentWithArrayComponents:@[@2011, @9, @12, @6, @7, @8]];
    
    expect([[a addAmountOfTime:1 forUnitKey:@"s"] second]).to.equal(9);
    expect([[a addAmountOfTime:1 forUnitKey:@"m"] minute]).to.equal(8);
    expect([[a addAmountOfTime:1 forUnitKey:@"h"] hour]).to.equal(7);
    expect([[a addAmountOfTime:1 forUnitKey:@"d"] day]).to.equal(13);
    expect([[a addAmountOfTime:1 forUnitKey:@"M"] month]).to.equal(10);
    expect([[a addAmountOfTime:1 forUnitKey:@"y"] year]).to.equal(2012);
}

@end
