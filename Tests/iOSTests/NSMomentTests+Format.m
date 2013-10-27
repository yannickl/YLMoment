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

- (void)testFomatWith_yy
{
    NSMoment *reference = [NSMoment momentWithDateAsString:@"2009/04/05"];
    expect([reference format:@"yy"]).to.equal(@"09");
}

@end
