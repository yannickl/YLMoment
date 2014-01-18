//
//  YLMomentTests+Create
//  YLMomentTests
//
//  Created by YannickL on 26/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "YLMoment.h"

@interface YLMomentTests_Create : XCTestCase

@end

@implementation YLMomentTests_Create

- (void)setUp
{
    [super setUp];
    
    [[YLMoment proxy] setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
}

- (void)tearDown
{
    [[YLMoment proxy] setLocale:[NSLocale currentLocale]];
    
    [super tearDown];
}

- (void)testCreateFromArray
{
    YLMoment *moment = [YLMoment momentWithArray:@[@2010]];
    expect([moment date]).toNot.beNil();
    
    moment = [YLMoment momentWithArray:@[@2010, @1]];
    expect([moment date]).toNot.beNil();
    
    moment = [YLMoment momentWithArray:@[@2010, @1, @12]];
    expect([moment date]).toNot.beNil();
    
    moment = [YLMoment momentWithArray:@[@2010, @1, @12, @1]];
    expect([moment date]).toNot.beNil();
    
    moment = [YLMoment momentWithArray:@[@2010, @1, @12, @1, @1]];
    expect([moment date]).toNot.beNil();
    
    moment = [YLMoment momentWithArray:@[@2010, @1, @12, @1, @1, @1]];
    expect([moment date]).toNot.beNil();

    NSCalendar *calendar         = [[YLMoment proxy] calendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year              = 2010;
    components.month             = 1;
    components.day               = 12;
    components.hour              = 1;
    components.minute            = 1;
    components.second            = 1;
    
    NSDate *date        = [calendar dateFromComponents:components];
    YLMoment *reference = [YLMoment momentWithDate:date];
    
    expect([moment isEqualToMoment:reference]).to.beTruthy();
}

- (void)testCreateFromDate
{
    NSDate *reference = [NSDate date];
    
    YLMoment *moment = [YLMoment momentWithDate:reference];
    expect([moment date]).toNot.beNil();
    expect([moment date]).to.equal(reference);
}

- (void)testCreateForDateMutation
{
    NSDate *reference = [NSDate date];
    YLMoment *moment  = [YLMoment momentWithDate:reference];

    expect([moment date]).toNot.beIdenticalTo(reference);
}

- (void)testCreateFromNow
{
    YLMoment *moment = [YLMoment now];
    expect([moment date]).toNot.beNil();
}

- (void)testCreateUTCDate
{
    YLMoment *utc = [YLMoment utc];
    expect([utc date]).toNot.beNil();
    
    YLMoment *now = [YLMoment now];
    expect([utc format]).toNot.equal([now format]);
    
    now.timeZone  = [NSTimeZone timeZoneWithName:@"UTC"];
    expect([utc format]).to.equal([now format]);
}

- (void)testCreateFromStringWithoutFormat
{
    YLMoment *moment = [YLMoment momentWithDateAsString:@"Aug 9, 1995"];
    expect([moment date]).toNot.beNil();
    
    moment          = [[YLMoment alloc] initWithDateAsString:@"Sun 24 Jan 2014 at 10:24 PST"];
    moment.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    expect([moment date]).toNot.beNil();
    expect([moment format]).to.equal(@"2014-01-24T18:24:00+0000");
    
    moment          = [YLMoment momentWithDateAsString:@"Mon, 25 Dec 1995 13:30:00 GMT"];
    moment.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    expect([moment date]).toNot.beNil();
    expect([moment format]).to.equal(@"1995-12-25T13:30:00+0000");
    
    moment = [YLMoment momentWithDateAsString:@"I'm not a date"];
    expect([moment date]).to.beNil();
}

- (void)testCreateFromStringWithFormatDroppedAMPMBug
{
    expect([[YLMoment momentWithDateAsString:@"05/1/2012 12:25:00" format:@"MM/d/yyyy hh:mm:ss"] format:@"MM/dd/yyyy"]).to.equal(@"05/01/2012");
    expect([[YLMoment momentWithDateAsString:@"05/1/2012 12:25:00 am" format:@"MM/d/yyyy hh:mm:ss a"] format:@"MM/dd/yyyy"]).to.equal(@"05/01/2012");
    expect([[YLMoment momentWithDateAsString:@"05/1/2012 12:25:00 pm" format:@"MM/d/yyyy hh:mm:ss a"] format:@"MM/dd/yyyy"]).to.equal(@"05/01/2012");
    expect([[YLMoment momentWithDateAsString:@"05/1/2012 12:25:00 pm" format:@"not a format"] isValid]).to.beFalsy();
}

- (void)testCreateFromEmptyStringWithFormats
{
    expect([[YLMoment momentWithDateAsString:@"" format:@"MM"] format:@"yyyy-MM-dd HH:mm:ss"]).to.equal(@"Invalid Date");
    expect([[YLMoment momentWithDateAsString:@" " format:@"MM"] format:@"yyyy-MM-dd HH:mm:ss"]).to.equal(@"Invalid Date");
    expect([[YLMoment momentWithDateAsString:@" " format:@"DD"] format:@"yyyy-MM-dd HH:mm:ss"]).to.equal(@"Invalid Date");
    
    expect([[YLMoment momentWithDateAsString:@"" format:@"MM"] isValid]).to.beFalsy();
    expect([[YLMoment momentWithDateAsString:@" " format:@"MM"] isValid]).to.beFalsy();
    expect([[YLMoment momentWithDateAsString:@" " format:@"DD"] isValid]).to.beFalsy();
}

- (void)testCreateFromStringWithFormatWithLocale
{
    NSTimeZone *previousTimeZone = [[YLMoment proxy] timeZone];
    
    [[YLMoment proxy] setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    
    YLMoment *moment = [YLMoment momentWithDateAsString:@"14 juillet 1998 à 15h" format:@"dd MM yyyy 'à' HH'h'" localeIdentifier:@"fr_FR"];
    moment.timeZone  = [NSTimeZone timeZoneWithName:@"UTC"];
    expect([moment format]).to.equal(@"1998-07-14T15:00:00+0000");
    
    moment          = [YLMoment momentWithDateAsString:@"27 shtator 2004" format:@"dd MM yyyy" localeIdentifier:@"sq_AL"];
    moment.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    expect([moment format]).to.equal(@"2004-09-27T00:00:00+0000");
    
    moment = [YLMoment momentWithDateAsString:@"27 shtator 2004" format:@"dd MM yyyy" localeIdentifier:@"not a locale"];
    expect([moment isValid]).to.beFalsy();
    
    [[YLMoment proxy] setTimeZone:previousTimeZone];
}

- (void)testCreateFromStringWithFormatWithLocaleWithTimeZone
{
    NSTimeZone *utc    = [NSTimeZone timeZoneWithName:@"UTC"];
    NSLocale *french   = [NSLocale localeWithLocaleIdentifier:@"fr_FR"];
    NSLocale *albanian = [NSLocale localeWithLocaleIdentifier:@"sq_AL"];
    
    YLMoment *moment = [YLMoment momentWithDateAsString:@"14 juillet 1998 à 15h" format:@"dd MM yyyy 'à' HH'h'" locale:french timeZone:utc];
    expect([moment format]).to.equal(@"1998-07-14T15:00:00+0000");
    
    moment          = [YLMoment momentWithDateAsString:@"27 shtator 2004" format:@"dd MM yyyy" locale:albanian timeZone:utc];
    expect([moment format]).to.equal(@"2004-09-27T00:00:00+0000");
    
    moment = [YLMoment momentWithDateAsString:@"27 shtator 2004" format:@"dd MM yyyy" localeIdentifier:@"not a locale"];
    expect([moment isValid]).to.beFalsy();
}

@end
