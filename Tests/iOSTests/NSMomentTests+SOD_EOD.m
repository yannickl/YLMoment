//
//  NSMomentTests+SOD_EOD.m
//  NSMomentTests
//
//  Created by YannickL on 29/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "NSMoment.h"

@interface NSMomentTests_SOD_EOD : XCTestCase

@end

@implementation NSMomentTests_SOD_EOD

- (void)setUp
{
    [super setUp];
    
    [[NSMoment proxy] setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
}

- (void)tearDown
{
    [[NSMoment proxy] setLocale:[NSLocale currentLocale]];
    
    [super tearDown];
}

#pragma mark years

- (void)testStartOfYear
{
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"year"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"years"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"y"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitYear];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"year"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"years"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"y"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitYear];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"month"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"months"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"M"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitMonth];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"month"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"months"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"M"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitMonth];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"day"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"days"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"d"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitDay];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"day"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"days"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"d"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitDay];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"hour"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"hours"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"h"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitHour];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"hour"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"hours"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"h"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitHour];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"minute"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"minutes"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"m"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitMinute];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"minute"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"minutes"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"m"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitMinute];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"second"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"seconds"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOf:@"s"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] startOfCalendarUnit:NSCalendarUnitSecond];
    
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
    NSMoment *m  = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"second"];
    NSMoment *ms = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"seconds"];
    NSMoment *ma = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOf:@"s"];
    NSMoment *mu = [[NSMoment momentWithArray:@[@2011, @2, @2, @3, @4, @5]] endOfCalendarUnit:NSCalendarUnitSecond];
    
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
