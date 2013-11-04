//
//  NSMomentTests+Format.m
//  NSMomentTests
//
//  Created by YannickL on 26/10/2013.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "NSMoment.h"

@interface NSMomentTests_Format : XCTestCase

@end

@implementation NSMomentTests_Format

- (void)setUp
{
    [super setUp];
    
    [[NSMoment proxy] setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [[NSMoment proxy] setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
}

- (void)tearDown
{
    [[NSMoment proxy] setLocale:[NSLocale currentLocale]];
    [[NSMoment proxy] setTimeZone:[NSTimeZone defaultTimeZone]];
    
    [super tearDown];
}

- (void)testFomatWith_yy
{
    NSMoment *reference = [NSMoment momentWithDateAsString:@"2009/04/05"];
    expect([reference format:@"yy"]).to.equal(@"09");
}

- (void)testFormatShortStyle
{
    NSMoment *moment = [NSMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterShortStyle;
    moment.timeStyle = NSDateFormatterShortStyle;
    
    expect([moment format:nil]).to.equal(@"11/4/13, 2:56 PM");
}

- (void)testFormatMediumStyle
{
    NSMoment *moment = [NSMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterMediumStyle;
    moment.timeStyle = NSDateFormatterMediumStyle;
    
    expect([moment format:nil]).to.equal(@"Nov 4, 2013, 2:56:04 PM");
}

- (void)testFormatLongStyle
{
    NSMoment *moment = [NSMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterLongStyle;
    moment.timeStyle = NSDateFormatterLongStyle;
    
    expect([moment format:nil]).to.equal(@"November 4, 2013 at 2:56:04 PM GMT");
}

- (void)testFormatFullStyle
{
    NSMoment *moment = [NSMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterFullStyle;
    moment.timeStyle = NSDateFormatterFullStyle;
    
    expect([moment format:nil]).to.equal(@"Monday, November 4, 2013 at 2:56:04 PM GMT");
}

@end
