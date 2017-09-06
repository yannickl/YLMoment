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

#import "YLMoment+RelativeTime.h"

/** The table name for the relative time strings. */
static NSString * const kYLMomentRelativeTimeStringTable = @"YLMomentRelativeTimeLocalizable";

@interface YLMoment (Private)

#pragma mark langs
@property (nonatomic, strong) NSBundle *langBundle;

@end

@implementation YLMoment (RelativeTime)

- (NSString *)fromNow {
  return [self fromNowWithSuffix:YES];
}

- (NSString *)fromNowWithSuffix:(BOOL)suffixed {
  return [self fromDate:[NSDate date] withSuffix:suffixed];
}

- (NSString *)fromDate:(NSDate *)date {
  return [self fromDate:date withSuffix:YES];
}

- (NSString *)fromDate:(NSDate *)date withSuffix:(BOOL)suffixed {
  // Get the lang bundle
  NSBundle *localBundle = self.langBundle ?: [[[self class] proxy] langBundle] ?: [NSBundle mainBundle];

  // Compute the time interval
  double referenceTime = [self.date timeIntervalSinceDate:date];
  double seconds       = round(fabs(referenceTime));
  double minutes       = round(seconds / 60.0f);
  double hours         = round(minutes / 60.0f);
  double days          = round(hours / 24.0f);
  double years         = round(days / 365.0f);

  // Build the formatted string
  NSString *formattedString = @"";
  int unit                  = 0;
  if (seconds < 45) {
    formattedString = [localBundle localizedStringForKey:@"s" value:@"a few seconds" table:kYLMomentRelativeTimeStringTable];
    unit            = seconds;
  }
  else if (minutes == 1) {
    formattedString = [localBundle localizedStringForKey:@"m" value:@"a minute" table:kYLMomentRelativeTimeStringTable];
  }
  else if (minutes < 45) {
    formattedString = [localBundle localizedStringForKey:@"mm" value:@"%d minutes" table:kYLMomentRelativeTimeStringTable];
    unit            = minutes;
  }
  else if (hours == 1) {
    formattedString = [localBundle localizedStringForKey:@"h" value:@"an hour" table:kYLMomentRelativeTimeStringTable];
  }
  else if (hours < 22) {
    formattedString = [localBundle localizedStringForKey:@"hh" value:@"%d hours" table:kYLMomentRelativeTimeStringTable];
    unit            = hours;
  }
  else if (days == 1) {
    formattedString = [localBundle localizedStringForKey:@"d" value:@"a day" table:kYLMomentRelativeTimeStringTable];
  }
  else if (days <= 25) {
    formattedString = [localBundle localizedStringForKey:@"dd" value:@"%d days" table:kYLMomentRelativeTimeStringTable];
    unit            = days;
  }
  else if (days <= 45) {
    formattedString = [localBundle localizedStringForKey:@"M" value:@"a month" table:kYLMomentRelativeTimeStringTable];
  }
  else if (days < 345) {
    formattedString = [localBundle localizedStringForKey:@"MM" value:@"%d months" table:kYLMomentRelativeTimeStringTable];
    unit            = floor(days / 30);
  }
  else if (years == 1) {
    formattedString = [localBundle localizedStringForKey:@"y" value:@"a year" table:kYLMomentRelativeTimeStringTable];
  }
  else {
    formattedString = [localBundle localizedStringForKey:@"yy" value:@"%d years" table:kYLMomentRelativeTimeStringTable];
    unit            = years;
  }

  formattedString = [NSString stringWithFormat:formattedString, unit];

  // If the string needs to be suffixed
  if (suffixed) {
    BOOL isFuture = (referenceTime > 0);

    NSString *suffixedString = nil;

    if (isFuture) {
      suffixedString = [localBundle localizedStringForKey:@"future" value:@"in %@" table:kYLMomentRelativeTimeStringTable];
    }
    else {
      suffixedString = [localBundle localizedStringForKey:@"past" value:@"%@ ago" table:kYLMomentRelativeTimeStringTable];
    }

    formattedString = [NSString stringWithFormat:suffixedString, formattedString];
  }

  return formattedString;
}

- (NSString *)fromMoment:(YLMoment *)moment {
  return [self fromMoment:moment withSuffix:YES];
}

- (NSString *)fromMoment:(YLMoment *)moment withSuffix:(BOOL)suffixed {
  return [self fromDate:[moment date] withSuffix:suffixed];
}

@end
