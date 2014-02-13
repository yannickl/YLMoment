//
//  YLMoment_UnitTestAdditions.h
//  YLMomentTests
//
//  Created by YannickL on 13/02/2014.
//  Copyright (c) 2014 YannickLoriot. All rights reserved.
//

#import "YLMoment.h"

/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentiOSBunbleName = @"YLMoment-iOS";
/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentOSXBunbleName = @"YLMoment-OSX";
/** The table name for the relative time strings. */
static NSString * const kYLMomentRelativeTimeStringTable = @"YLMomentRelativeTimeLocalizable";

@interface YLMoment ()
/** The internal date once data computed */
#pragma mark internal
@property (nonatomic, strong) NSDate *date;

#pragma mark langs
/** Bundle the current language */
@property (nonatomic, strong) NSBundle *langBundle;

#pragma mark proxy
/** Date detector used to convert strings to date */
@property (nonatomic, strong) NSDataDetector *dateDetector;

/** Init the proxy with the default values. */
- (id)initProxy;

/** Called when the moment is initiated. */
- (void)momentInitiated;

/** Returns the YLMoment lang bundle corresponding to a given locale identifier. */
- (NSBundle *)langBundleForLocaleWithIdentifier:(NSString *)localeIdentifier;

@end
