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

- (void)testLangFrom
{
    NSMoment *start = [NSMoment momentWithArrayComponents:@[@2007, @1, @28]];
    NSMoment *end;
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:44 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a few seconds");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:45 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a minute");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:89 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a minute");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:90 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 minutes");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:44 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"44 minutes");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:45 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"an hour");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:89 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"an hour");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:90 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 hours");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 hours");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:21 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"21 hours");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:22 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a day");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:35 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a day");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:36 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 days");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:1 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a day");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 days");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:25 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"25 days");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:26 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a month");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:30 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a month");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:45 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a month");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:46 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 months");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:74 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 months");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:76 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"3 months");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:1 forUnitKey:@"M"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a month");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"M"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 months");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:344 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"11 months");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:345 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a year");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:547 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a year");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:548 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 years");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:1 forUnitKey:@"y"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"a year");
    
    end = [[NSMoment momentWithArrayComponents:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"y"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 years");
}

- (void)testLangSuffix
{
    NSMoment *moment = [NSMoment now];
    NSMoment *future = [[NSMoment now] addAmountOfTime:3 forUnitKey:@"s"];
    NSMoment *past   = [[NSMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
    
    expect([future fromMoment:moment]).to.equal(@"in a few seconds");
    expect([past fromMoment:moment]).to.equal(@"a few seconds ago");
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
