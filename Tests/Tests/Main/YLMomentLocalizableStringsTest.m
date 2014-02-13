//
//  YLMomentLocalizableStringsTest.m
//  YLMomentTests
//
//  Created by YannickL on 13/02/2014.
//  Copyright (c) 2014 YannickLoriot. All rights reserved.
//

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
