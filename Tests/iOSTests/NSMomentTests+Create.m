//
//  NSMomentTests+Create.m
//  NSMomentTests
//
//  Created by YannickL on 26/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "NSMoment.h"

@interface NSMomentTests_Create : XCTestCase

@end

@implementation NSMomentTests_Create

- (void)testCreateFromArray
{
    NSMoment *moment = [NSMoment momentWithArrayComponents:@[@2010]];
    expect([moment date]).notTo.beNil();
    
    moment = [NSMoment momentWithArrayComponents:@[@2010, @1]];
    expect([moment date]).notTo.beNil();
    
    moment = [NSMoment momentWithArrayComponents:@[@2010, @1, @12]];
    expect([moment date]).notTo.beNil();
    
    moment = [NSMoment momentWithArrayComponents:@[@2010, @1, @12, @1]];
    expect([moment date]).notTo.beNil();
    
    moment = [NSMoment momentWithArrayComponents:@[@2010, @1, @12, @1, @1]];
    expect([moment date]).notTo.beNil();
    
    moment = [NSMoment momentWithArrayComponents:@[@2010, @1, @12, @1, @1, @1]];
    expect([moment date]).notTo.beNil();
    
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year              = 2010;
    components.month             = 1;
    components.day               = 12;
    components.hour              = 1;
    components.minute            = 1;
    components.second            = 1;
    
    NSDate *date        = [calendar dateFromComponents:components];
    NSMoment *reference = [NSMoment momentWithDate:date];
    
    expect([moment isEqualToMoment:reference]).to.beTruthy();
}

- (void)testCreateFromDate
{
    NSDate *reference = [NSDate date];
    
    NSMoment *moment = [NSMoment momentWithDate:reference];
    expect([moment date]).notTo.beNil();
    expect([[moment date] isEqualToDate:reference]).to.beTruthy();
}

- (void)testCreateForDateMutation
{
    NSDate *reference = [NSDate date];
    NSMoment *moment  = [NSMoment momentWithDate:reference];

    expect([moment date] == reference).notTo.beTruthy();
}

- (void)testCreateFromNow
{
    NSMoment *moment = [NSMoment now];
    expect([moment date]).notTo.beNil();
}

- (void)testCreateFromStringWithoutFormat
{
    NSMoment *moment = [NSMoment momentWithDateAsString:@"Aug 9, 1995"];
    expect([moment date]).notTo.beNil();
    
    moment = [NSMoment momentWithDateAsString:@"Mon, 25 Dec 1995 13:30:00 GMT"];
    expect([moment date]).notTo.beNil();
}

@end
