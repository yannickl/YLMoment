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
