//
//  YLMomentTests+Format
//  YLMomentTests
//
//  Created by YannickL on 26/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "YLMoment.h"

@interface YLMomentTests_Format : XCTestCase

@end

@implementation YLMomentTests_Format

- (void)setUp
{
    [super setUp];
    
    [[YLMoment proxy] setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [[YLMoment proxy] setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
}

- (void)tearDown
{
    [[YLMoment proxy] setLocale:[NSLocale currentLocale]];
    [[YLMoment proxy] setTimeZone:[NSTimeZone defaultTimeZone]];
    
    [super tearDown];
}

- (void)testFomatWith_yy
{
    YLMoment *reference = [YLMoment momentWithDateAsString:@"2009/04/05"];
    expect([reference format:@"yy"]).to.equal(@"09");
}

- (void)testFormatDefaultStyle
{
    // By default the format is set to `NSDateFormatterLongStyle`
    [self testFormatLongStyle];
}

- (void)testFormatNoStyle
{
    YLMoment *moment = [YLMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterNoStyle;
    moment.timeStyle = NSDateFormatterNoStyle;
    
    expect([moment format:nil]).to.equal(@"");
}

- (void)testFormatShortStyle
{
    YLMoment *moment = [YLMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterShortStyle;
    moment.timeStyle = NSDateFormatterShortStyle;
    
    expect([moment format:nil]).to.equal(@"11/4/13, 2:56 PM");
}

- (void)testFormatMediumStyle
{
    YLMoment *moment = [YLMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterMediumStyle;
    moment.timeStyle = NSDateFormatterMediumStyle;

    expect([[moment format:nil] isEqualToString:@"Nov 4, 2013, 2:56:04 PM"]).to.beTruthy();
}

- (void)testFormatLongStyle
{
    YLMoment *moment = [YLMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterLongStyle;
    moment.timeStyle = NSDateFormatterLongStyle;
    
    expect([moment format:nil]).to.equal(@"November 4, 2013 at 2:56:04 PM GMT");
}

- (void)testFormatFullStyle
{
    YLMoment *moment = [YLMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterFullStyle;
    moment.timeStyle = NSDateFormatterFullStyle;
    
    expect([moment format:nil]).to.equal(@"Monday, November 4, 2013 at 2:56:04 PM GMT");
}

@end
