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
#import "YLMoment_UnitTestAdditions.h"

#import "YLMoment.h"

@interface YLMomentLocalizableStringsTest : XCTestCase
@property (nonatomic, strong)  NSDictionary *englishStringDictionary;

@end

@implementation YLMomentLocalizableStringsTest

- (void)setUp
{
    [super setUp];

    NSBundle *englishBundle     = [[YLMoment proxy] langBundleForLocaleWithIdentifier:@"en"];
    NSString *englisStringsPath = [englishBundle pathForResource:kYLMomentRelativeTimeStringTable ofType:@"strings"];
    _englishStringDictionary    = [NSDictionary dictionaryWithContentsOfFile:englisStringsPath];
}

- (void)tearDown
{
    _englishStringDictionary = nil;
    
    [super tearDown];
}

- (void)testTextTranslationExistsForEachSupportedLanguages
{
    for (NSString *localeIdentifier in [NSLocale availableLocaleIdentifiers])
    {
        NSBundle *currentBundle = [[YLMoment proxy] langBundleForLocaleWithIdentifier:localeIdentifier];
        if (currentBundle != nil)
        {
            NSString *currentStringPath           = [currentBundle pathForResource:kYLMomentRelativeTimeStringTable ofType:@"strings"];
            NSDictionary *currentStringDictionary = [NSDictionary dictionaryWithContentsOfFile:currentStringPath];
            
            for (NSString *stringKey in _englishStringDictionary)
            {
                XCTAssertNotNil([currentStringDictionary objectForKey:stringKey], @"Localized file %@: Missing '%@' translation", localeIdentifier, stringKey);
            }
        }
    }
}

@end
