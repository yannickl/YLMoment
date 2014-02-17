/*
 * YLMoment
 *
 * Copyright 2013 - present Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

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

- (void)testFormatNoStyle
{
    YLMoment *moment = [YLMoment momentWithArray:@[@2013, @11, @4, @14, @56, @4]];
    moment.dateStyle = NSDateFormatterNoStyle;
    moment.timeStyle = NSDateFormatterNoStyle;
    
    expect([moment format:nil]).to.equal(@"");
}

- (void)testDescription {
    YLMoment *moment = [YLMoment now];
    
    expect([moment description]).to.equal([moment format]);
}

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED

- (void)testFormatDefaultStyle
{
    // By default the format is set to `NSDateFormatterLongStyle`
    [self testFormatLongStyle];
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

    expect([moment format:nil]).to.equal(@"Nov 4, 2013, 2:56:04 PM");
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

#endif

@end
