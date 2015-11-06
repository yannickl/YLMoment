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

#import "YLMoment+Helpers.h"

@implementation YLMoment (Helpers)

+ (NSCalendarUnit)calendarUnitForKey:(NSString *)key {
  if ([key isEqualToString:@"y"] || [key isEqualToString:@"year"] || [key isEqualToString:@"years"]) {
    return (NSCalendarUnit)kCFCalendarUnitYear;
  }
  else if ([key isEqualToString:@"M"] || [key isEqualToString:@"month"] || [key isEqualToString:@"months"]) {
    return (NSCalendarUnit)kCFCalendarUnitMonth;
  }
  else if ([key isEqualToString:@"w"] | [key isEqualToString:@"week"] || [key isEqualToString:@"weeks"]) {
    return (NSCalendarUnit)kCFCalendarUnitWeekOfMonth;
  }
  else if ([key isEqualToString:@"d"] || [key isEqualToString:@"day"] || [key isEqualToString:@"days"]) {
    return (NSCalendarUnit)kCFCalendarUnitDay;
  }
  else if ([key isEqualToString:@"h"] || [key isEqualToString:@"hour"] || [key isEqualToString:@"hours"]) {
    return (NSCalendarUnit)kCFCalendarUnitHour;
  }
  else if ([key isEqualToString:@"m"] || [key isEqualToString:@"minute"] || [key isEqualToString:@"minutes"]) {
    return (NSCalendarUnit)kCFCalendarUnitMinute;
  }
  else if ([key isEqualToString:@"s"] || [key isEqualToString:@"second"] || [key isEqualToString:@"seconds"]) {
    return (NSCalendarUnit)kCFCalendarUnitSecond;
  }

  return -1;
}

@end
