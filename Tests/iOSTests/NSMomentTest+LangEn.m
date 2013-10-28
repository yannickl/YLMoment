//
//  NSMomentTest+LangFr.m
//  NSMomentTests
//
//  Created by YannickL on 28/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "NSMoment.h"

@interface NSMomentTest_LangEn : XCTestCase

@end

@implementation NSMomentTest_LangEn

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

- (void)testLangFromNow
{
    NSDate *now             = [NSDate date];
    
    NSCalendar *calendar    = [[NSMoment proxy] calendar];
    NSDateComponents *comp1 = [[NSDateComponents alloc] init];
    comp1.second            = 30;
    
    NSDate *newDate         = [calendar dateByAddingComponents:comp1 toDate:now options:0];
    NSMoment *reference     = [NSMoment momentWithDate:newDate];
    expect([reference fromNow]).to.equal(@"in a few seconds");
    
    NSDateComponents *comp2 = [[NSDateComponents alloc] init];
    comp2.day               = 5;
    
    newDate       = [calendar dateByAddingComponents:comp2 toDate:now options:0];
    reference     = [NSMoment momentWithDate:newDate];
    expect([reference fromNow]).to.equal(@"in 5 days");
    
    NSDateComponents *comp3 = [[NSDateComponents alloc] init];
    comp3.day               = -1;
    
    newDate       = [calendar dateByAddingComponents:comp3 toDate:now options:0];
    reference     = [NSMoment momentWithDate:newDate];
    expect([reference fromNow]).to.equal(@"a day ago");
    
    
}

@end
