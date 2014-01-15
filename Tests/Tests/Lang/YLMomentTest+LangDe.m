//
//  YLMomentTest+LangDe
//  YLMomentTests
//
//  Created by  Michel Albers on 15/01/2014.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "YLMoment.h"

@interface YLMomentTest_LangEn : XCTestCase

@end

@implementation YLMomentTest_LangDe

- (void)setUp
{
    [super setUp];
    
    [[YLMoment proxy] setLocale:[NSLocale localeWithLocaleIdentifier:@"de_DE"]];
}

- (void)tearDown
{
    [[YLMoment proxy] setLocale:[NSLocale currentLocale]];

    [super tearDown];
}

- (void)testLangFrom
{
    YLMoment *start = [YLMoment momentWithArray:@[@2007, @1, @28]];
    YLMoment *end;
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:44 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"ein paar Sekunden");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:45 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einer Minute");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:89 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einer Minute");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:90 forUnitKey:@"s"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 Minuten");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:44 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"44 Minuten");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:45 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einer Stunde");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:89 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einer Stunde");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:90 forUnitKey:@"m"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 Stunden");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 Stunden");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:21 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"21 Stunden");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:22 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Tag");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:35 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Tag");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:36 forUnitKey:@"h"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 Tage");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:1 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Tag");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 Tage");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:25 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"25 Tage");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:26 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Monat");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:30 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Monat");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:45 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Monat");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:46 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 Monate");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:74 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 Monate");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:76 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"3 Monate");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:1 forUnitKey:@"M"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Monat");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"M"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 Monate");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:344 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"11 Monate");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:345 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Jahr");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:547 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Jahr");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:548 forUnitKey:@"d"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"2 Jahre");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:1 forUnitKey:@"y"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"einem Jahr");
    
    end = [[YLMoment momentWithArray:@[@2007, @1, @28]] addAmountOfTime:5 forUnitKey:@"y"];
    expect([start fromMoment:end withSuffix:NO]).to.equal(@"5 Jahre");
}

- (void)testLangSuffix
{
    YLMoment *moment = [YLMoment now];
    YLMoment *future = [[YLMoment now] addAmountOfTime:3 forUnitKey:@"s"];
    YLMoment *past   = [[YLMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
    
    expect([future fromMoment:moment]).to.equal(@"in ein paar Sekunden");
    expect([past fromMoment:moment]).to.equal(@"vor ein paar Sekunden");
}

- (void)testLangNowFromNow
{
    expect([[YLMoment now] fromNow]).to.equal(@"vor ein paar Sekunden");
}

- (void)testLangFromNow
{
    YLMoment *reference1 = [[YLMoment now] addAmountOfTime:30 forCalendarUnit:NSCalendarUnitSecond];
    expect([reference1 fromNow]).to.equal(@"in ein paar Sekunden");
    
    YLMoment *reference2 = [[YLMoment now] addAmountOfTime:5 forCalendarUnit:NSCalendarUnitDay];
    expect([reference2 fromNow]).to.equal(@"in 5 Tagen");
    
    YLMoment *reference3 = [[YLMoment now] addAmountOfTime:-1 forCalendarUnit:NSCalendarUnitDay];
    expect([reference3 fromNow]).to.equal(@"vor einem Tag");
}

- (void)testLangFromNowWithSuffix
{
    YLMoment *reference1 = [[YLMoment now] addAmountOfTime:-3 forCalendarUnit:NSCalendarUnitMonth];
    expect([reference1 fromNowWithSuffix:NO]).to.equal(@"3 Monate");
    
    YLMoment *reference2 = [[YLMoment now] addAmountOfTime:9 forCalendarUnit:NSCalendarUnitHour];
    expect([reference2 fromNowWithSuffix:YES]).to.equal(@"in 9 Stunden");
}

@end
