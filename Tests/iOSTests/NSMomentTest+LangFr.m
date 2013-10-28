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

@interface NSMomentTest_LangFr : XCTestCase

@end

@implementation NSMomentTest_LangFr

- (void)setUp
{
    [super setUp];
    
    [[NSMoment proxy] setLocale:[NSLocale localeWithLocaleIdentifier:@"fr_FR"]];
}

- (void)tearDown
{
    [[NSMoment proxy] setLocale:[NSLocale currentLocale]];
    
    [super tearDown];
}

- (void)testLangNowFromNow
{
    expect([[NSMoment now] fromNow]).to.equal(@"il y a quelques secondes");
}

- (void)testLangFromNow
{
    NSDate *now             = [NSDate date];
    
    NSCalendar *calendar    = [[NSMoment proxy] calendar];

    NSDateComponents *comp1 = [[NSDateComponents alloc] init];
    comp1.second            = 30;
    
    NSDate *newDate         = [calendar dateByAddingComponents:comp1 toDate:now options:0];
    NSMoment *reference     = [NSMoment momentWithDate:newDate];
    expect([reference fromNow]).to.equal(@"dans quelques secondes");
    
    NSDateComponents *comp2 = [[NSDateComponents alloc] init];
    comp2.day               = 5;
    
    newDate       = [calendar dateByAddingComponents:comp2 toDate:now options:0];
    reference     = [NSMoment momentWithDate:newDate];
    expect([reference fromNow]).to.equal(@"dans 5 jours");
    
    NSDateComponents *comp3 = [[NSDateComponents alloc] init];
    comp3.day               = -1;
    
    newDate       = [calendar dateByAddingComponents:comp3 toDate:now options:0];
    reference     = [NSMoment momentWithDate:newDate];
    expect([reference fromNow]).to.equal(@"il y a un jour");
}

@end
