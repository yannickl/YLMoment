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

- (void)testLangNowFromNow
{
    expect([[NSMoment now] fromNow]).to.equal(@"a few seconds ago");
}

- (void)testLangFromNow
{
    NSMoment *reference1 = [[NSMoment now] addAmountOfTime:30 forCalendarUnit:NSCalendarUnitSecond];
    expect([reference1 fromNow]).to.equal(@"in a few seconds");
    
    NSMoment *reference2 = [[NSMoment now] addAmountOfTime:5 forCalendarUnit:NSCalendarUnitDay];
    expect([reference2 fromNow]).to.equal(@"in 5 days");
    
    NSMoment *reference3 = [[NSMoment now] addAmountOfTime:-1 forCalendarUnit:NSCalendarUnitDay];
    expect([reference3 fromNow]).to.equal(@"a day ago");
}

@end
