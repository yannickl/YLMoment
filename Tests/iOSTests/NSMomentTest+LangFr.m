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
    NSMoment *reference1 = [[NSMoment now] addAmountOfTime:30 forCalendarUnit:NSCalendarUnitSecond];
    expect([reference1 fromNow]).to.equal(@"dans quelques secondes");

    NSMoment *reference2 = [[NSMoment now] addAmountOfTime:5 forCalendarUnit:NSCalendarUnitDay];
    expect([reference2 fromNow]).to.equal(@"dans 5 jours");
    
    NSMoment *reference3 = [[NSMoment now] addAmountOfTime:-1 forCalendarUnit:NSCalendarUnitDay];
    expect([reference3 fromNow]).to.equal(@"il y a un jour");
}

@end
