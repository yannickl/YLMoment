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

@interface YLMomentTests_Getters_Setters : XCTestCase

@end

@implementation YLMomentTests_Getters_Setters

- (void)testGetters
{
    YLMoment *reference = [YLMoment momentWithArray:@[@2011, @9, @12, @6, @7, @8]];

    expect([reference year]).to.equal(2011);
    expect([reference month]).to.equal(9);
    expect([reference day]).to.equal(12);
    expect([reference hour]).to.equal(6);
    expect([reference minute]).to.equal(7);
    expect([reference second]).to.equal(8);
}

- (void)testSetters
{
    YLMoment *reference = [YLMoment now];
    reference.year      = 2011;
    reference.month     = 9;
    reference.day       = 12;
    reference.hour      = 6;
    reference.minute    = 7;
    reference.second    = 8;
    
    expect([reference year]).to.equal(2011);
    expect([reference month]).to.equal(9);
    expect([reference day]).to.equal(12);
    expect([reference hour]).to.equal(6);
    expect([reference minute]).to.equal(7);
    expect([reference second]).to.equal(8);
    
    reference       = [YLMoment momentWithDateAsString:@"20130531" format:@"yyyyMMdd"];
    reference.month = 3;
    
    expect([reference month]).to.equal(3);
}

@end
