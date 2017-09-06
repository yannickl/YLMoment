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

#import "YLMoment+Manipulation.h"
#import "YLMoment+Components.h"
#import "YLMoment+Helpers.h"

@interface YLMoment (Private)

#pragma mark internal
@property (nonatomic, strong) NSDate *date;

@end

@implementation YLMoment (Manipulation)

#pragma mark Manipulating Moments

- (YLMoment *)addAmountOfTime:(NSInteger)amount forUnitKey:(NSString *)key {
  NSCalendarUnit unit = [[self class] calendarUnitForKey:key];

  return [self addAmountOfTime:amount forCalendarUnit:unit];
}

- (YLMoment *)addAmountOfTime:(NSInteger)amount forCalendarUnit:(NSCalendarUnit)unit {
  NSCalendar *currentCalendar  = self.calendar ?: [[[self class] proxy] calendar];
  NSDateComponents *components = [[NSDateComponents alloc] init];

  switch (unit) {
    case kCFCalendarUnitYear:
      components.year = amount;
      break;
    case kCFCalendarUnitMonth:
      components.month = amount;
      break;
    case kCFCalendarUnitWeekOfMonth:
      components.weekOfMonth = amount;
      break;
    case kCFCalendarUnitDay:
      components.day = amount;
      break;
    case kCFCalendarUnitHour:
      components.hour = amount;
      break;
    case kCFCalendarUnitMinute:
      components.minute = amount;
      break;
    case kCFCalendarUnitSecond:
      components.second = amount;
      /* falls through */
    default:
      break;
  }

  self.date = [currentCalendar dateByAddingComponents:components toDate:self.date options:0];

  return self;
}

- (YLMoment *)addDuration:(NSTimeInterval)duration {
  self.date = [self.date dateByAddingTimeInterval:duration];

  return self;
}

- (YLMoment *)subtractAmountOfTime:(NSInteger)amount forUnitKey:(NSString *)key {
  return [self addAmountOfTime:-amount forUnitKey:key];
}

- (YLMoment *)subtractAmountOfTime:(NSInteger)amount forCalendarUnit:(NSCalendarUnit)unit {
  return [self addAmountOfTime:-amount forCalendarUnit:unit];
}

- (YLMoment *)subtractDuration:(NSTimeInterval)duration {
  return [self addDuration:-duration];
}

- (YLMoment *)startOf:(NSString *)unitString {
  NSCalendarUnit unit = [[self class] calendarUnitForKey:unitString];

  return [self startOfCalendarUnit:unit];
}

- (YLMoment *)startOfCalendarUnit:(NSCalendarUnit)unit {
  switch (unit) {
    case kCFCalendarUnitYear:
      [self setMonth:1];
      /* falls through */
    case kCFCalendarUnitMonth:
      [self setDay:1];
      /* falls through */
    case kCFCalendarUnitWeekOfMonth:
    case kCFCalendarUnitDay:
      [self setHour:0];
      /* falls through */
    case kCFCalendarUnitHour:
      [self setMinute:0];
      /* falls through */
    case kCFCalendarUnitMinute:
      [self setSecond:0];
      /* falls through */
    default:
      break;
  }

  return self;
}

- (YLMoment *)endOf:(NSString *)unitString {
  NSCalendarUnit unit = [[self class] calendarUnitForKey:unitString];

  return [self endOfCalendarUnit:unit];
}

- (YLMoment *)endOfCalendarUnit:(NSCalendarUnit)unit {
  return [[[self startOfCalendarUnit:unit] addAmountOfTime:1 forCalendarUnit:unit] addAmountOfTime:-1 forCalendarUnit:(NSCalendarUnit)kCFCalendarUnitSecond];
}

@end
