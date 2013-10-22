/*
 * NSMoment.m
 *
 * Copyright 2013 Yannick Loriot.
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

#import "NSMoment.h"

/************************************
 Constants
 ************************************/

static NSString * const NSMomentIsoFormat   = @"yyyy-MM-dd'T'HH:mm:ssZ";
static NSString * const formattingTokens    = @"(\\[[^\\[]*\\])|(\\\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|SS?S?|X|zz?|ZZ?|.)";

@interface NSMoment ()
@property (nonatomic, strong) NSDate          *date;
@property (nonatomic, strong) NSString        *dateAsString;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation NSMoment

- (id)init
{
    return [self initWithDate:[NSDate date]];
}

+ (id)now
{
    return [[self alloc] init];
}

#pragma mark -

- (id)initWithDate:(NSDate *)date
{
    if ((self = [super init]))
    {
        // Sets the default date and formatter
        _date                 = date;
        
        _formatter            = [[NSDateFormatter alloc] init];
        //_formatter.locale     = [[NSLocale alloc] initWithLocaleIdentifier:[NSLocale currentLocale]];
        _formatter.dateFormat = NSMomentIsoFormat;
    }
    return self;
}

+ (id)momentWithDate:(NSDate *)date
{
    return [[self alloc] init];
}

#pragma mark -

- (id)initWithDateAsString:(NSString *)dateAsString
{
    @throw [NSException exceptionWithName:@"Not Yet Implemented" reason:@"Under Development" userInfo:nil];
}

+ (id)momentWithDateAsString:(NSString *)dateAsString
{
    return [[self init] initWithString:dateAsString];
}

#pragma mark -

- (id)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat
{
    if ((self = [super init]))
    {
        _formatter            = [[NSDateFormatter alloc] init];
        _formatter.dateFormat = dateFormat;
        
        _date                 = [_formatter dateFromString:dateAsString];
    }
    return self;
}

+ (id)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat
{
    return [[self alloc] initWithDateAsString:dateAsString format:dateFormat];
}

#pragma mark - Public Methods

- (NSString *)format
{
    return [self format:NSMomentIsoFormat];
}

- (NSString *)format:(NSString *)dateFormat
{
    _formatter.dateFormat = dateFormat;
    
    return [_formatter stringFromDate:_date];
}

- (BOOL)isValid
{
    return (_date != nil);
}

#pragma mark - Private Methods

@end
