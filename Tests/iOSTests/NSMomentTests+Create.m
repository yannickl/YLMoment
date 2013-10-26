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

- (void)testCreateFromDate
{
    NSMoment *moment = [NSMoment momentWithDate:[NSDate date]];
    expect([moment toDate]).notTo.beNil();
}

- (void)testCreateFromNow
{
    NSMoment *moment = [NSMoment now];
    expect([moment toDate]).notTo.beNil();
}

- (void)testCreateFromStringWithoutFormat
{
    NSMoment *moment = [NSMoment momentWithDateAsString:@"Aug 9, 1995"];
    expect([moment toDate]).notTo.beNil();
    
    moment = [NSMoment momentWithDateAsString:@"Mon, 25 Dec 1995 13:30:00 GMT"];
    expect([moment toDate]).notTo.beNil();
}

@end
