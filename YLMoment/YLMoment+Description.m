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

#import "YLMoment+Description.h"

@implementation YLMoment (Description)

#pragma mark - Properties

- (NSString *)description
{
  return [self format];
}

#pragma mark - Representing Moments as Strings

- (NSString *)format
{
  return [self format:YLMomentIso8601Format];
}

- (NSString *)format:(NSString *)dateFormat
{
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.locale           = self.locale ?: [[[self class] proxy] locale];
  formatter.timeZone         = self.timeZone ?: [[[self class] proxy] timeZone];

  if (!dateFormat)
  {
    formatter.dateStyle = ((NSUInteger)self.dateStyle != -1) ? self.dateStyle : [[[self class] proxy] dateStyle];
    formatter.timeStyle = ((NSUInteger)self.timeStyle != -1) ? self.timeStyle : [[[self class] proxy] timeStyle];
  }
  else
  {
    formatter.dateFormat = dateFormat;
  }

  return [formatter stringFromDate:self.date] ?: @"Invalid Date";
}

@end
