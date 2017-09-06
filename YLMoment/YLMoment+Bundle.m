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

#import "YLMoment+Bundle.h"

/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentiOSBunbleName = @"YLMoment-iOS";
/** The name of the bundle for the iOS plateform. */
static NSString * const kYLMomentOSXBunbleName = @"YLMoment-OSX";

@implementation YLMoment (Bundle)

#pragma mark - Private Methods

- (NSBundle *)langBundleForLocaleWithIdentifier:(NSString *)localeIdentifier {
  static NSBundle *classBundle  = nil;
  static NSBundle *momentBundle = nil;
  static dispatch_once_t once;

  dispatch_once(&once, ^{
    classBundle = [NSBundle bundleForClass:[self class]];

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
    NSString *bundlePath = [classBundle pathForResource:kYLMomentiOSBunbleName ofType:@"bundle"];
#else
    NSString *bundlePath = [classBundle pathForResource:kYLMomentOSXBunbleName ofType:@"bundle"];
#endif

    momentBundle = [NSBundle bundleWithPath:bundlePath];
  });

  NSBundle *bundle = momentBundle ?: classBundle;

  NSString *lang     = [localeIdentifier substringToIndex:2];
  NSString *langPath = [bundle pathForResource:lang ofType:@"lproj"];

  if (langPath) {
    return [NSBundle bundleWithPath:langPath];
  }
  else {
    NSArray *preferredLocales = [NSLocale preferredLanguages];

    for (NSString *preferredLocale in preferredLocales) {
      langPath = [bundle pathForResource:preferredLocale ofType:@"lproj"];

      if (langPath) {
        return [NSBundle bundleWithPath:langPath];
      }
    }

    return nil;
  }
}

@end
