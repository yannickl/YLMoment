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

#import "YLMoment+Components.h"

@interface YLMoment (Private)

/** Returns the specified field value of the moment. */
- (NSUInteger)getCalendarUnit:(NSCalendarUnit)unit;

#pragma mark internal
@property (nonatomic, strong) NSDate *date;

@end

@implementation YLMoment (Components)

- (NSUInteger)getCalendarUnit:(NSCalendarUnit)unit {
  NSCalendar *currentCalendar  = self.calendar ?: [[[self class] proxy] calendar];
  NSDateComponents *components = [currentCalendar components:unit fromDate:self.date];

  switch (unit) {
    case kCFCalendarUnitSecond:
      return components.second;
    case kCFCalendarUnitMinute:
      return components.minute;
    case kCFCalendarUnitHour:
      return components.hour;
    case kCFCalendarUnitDay:
      return components.day;
    case kCFCalendarUnitMonth:
      return components.month;
    default:
      return components.year;
  }
}

- (void)setValue:(NSUInteger)value forCalendarUnit:(NSCalendarUnit)unit {
  NSCalendar *currentCalendar  = self.calendar ?: [[[self class] proxy] calendar];
  NSDateComponents *components = [currentCalendar components:(kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond) fromDate:self.date];

  switch (unit) {
    case kCFCalendarUnitSecond:
      components.second = value;
      break;
    case kCFCalendarUnitMinute:
      components.minute = value;
      break;
    case kCFCalendarUnitHour:
      components.hour = value;
      break;
    case kCFCalendarUnitDay:
      components.day = value;
      break;
    case kCFCalendarUnitMonth:
      components.month = value;
      break;
    case kCFCalendarUnitYear:
      components.year = value;
      /* falls through */
    default:
      break;
  }

  self.date = [currentCalendar dateFromComponents:components];
}

- (NSUInteger)second {
  return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitSecond];
}

- (void)setSecond:(NSUInteger)second {
  if (second < 60) {
    [self setValue:second forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitSecond];
  }
}

- (NSUInteger)minute {
  return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMinute];
}

- (void)setMinute:(NSUInteger)minute {
  if (minute < 60) {
    [self setValue:minute forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMinute];
  }
}

- (NSUInteger)hour {
  return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitHour];
}

- (void)setHour:(NSUInteger)hour {
  if (hour < 24) {
    [self setValue:hour forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitHour];
  }
}

- (NSUInteger)day {
  return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitDay];
}

- (void)setDay:(NSUInteger)day {
  if (day > 0 && day <= 31) {
    [self setValue:day forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitDay];
  }
}

- (NSUInteger)month {
  return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMonth];
}

- (void)setMonth:(NSUInteger)month {
  if (month > 0 && month <= 12) {
    [self setValue:month forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitMonth];
  }
}

- (NSUInteger)year {
  return [self getCalendarUnit:(NSCalendarUnit)kCFCalendarUnitYear];
}

- (void)setYear:(NSUInteger)year {
  [self setValue:year forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitYear];
}

@end
