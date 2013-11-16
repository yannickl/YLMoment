## YLMoment

[![Build Status](https://travis-ci.org/YannickL/YLMoment.png?branch=master)](https://travis-ci.org/YannickL/YLMoment)

YLMoment is a library which provides an high abstraction level for parsing, validating, manipulating, and formatting the dates in Objective-C.

Its API is inspired by the well known [moment.js](http://momentjs.com/) library, however unlike its father, its core is built upon the `Foundation Framework` components (`NSDate`, `NSDateFormatter`,etc.) for a full interoperability with iOS.

## How To Get Started

- [Download YLMoment](https://github.com/YannickL/YLMoment/archive/master.zip) and give it a try
- Read the [blog posts](http://yannickloriot.com/2013/11/handle-times-dates-calendars-and-durations-like-a-pro-in-objective-c-with-YLMoment/)

## Installation

### Manually

Copy the YLMoment folder into your project and then simply import the "YLMoment" in the file(s) you would like to use it in.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like YLMoment in your projects.

#### Podfile

```ruby
platform :ios, ‘5.0’
pod "YLMoment", "~> 0.1.0"
```

## Usage

### Formatting dates
```objective-c
YLMoment *moment = [YLMoment now];

NSLog(@"%@", [moment format:@"MMMM dd yyyy, h:mm:ss a"]); // October 27 2013, 10:49:48 AM
NSLog(@"%@", [moment format:@"MMM dd yy"]);               // Oct 27 13
NSLog(@"%@", [moment format:@"yyyy 'escaped' yyyy"]);     // 2013 escaped 2013
NSLog(@"%@", [moment format]);                            // 2013-10-27T10:49:48+0100
```

### Relative Times
```objective-c
YLMoment *moment1 = [YLMoment momentWithDateAsString:@"20111031"];
NSLog(@"%@", [moment1 fromNow]); // 2 years ago

YLMoment *moment2 = [YLMoment momentWithDateAsString:@"2012/06/20" format:@"yyyy/MM/dd"];
NSLog(@"%@", [moment2 fromNow]); // a year ago

NSLog(@"%@", [[[YLMoment now] startOf:@"day"] fromNow]);  // 19 hours ago
NSLog(@"%@", [[[YLMoment now] endOf:@"day"] fromNow]);    // in 5 hours
NSLog(@"%@", [[[YLMoment now] startOf:@"hour"] fromNow]); // 11 minutes ago
```

### Languages
```objective-c
YLMoment *french = [[YLMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
[french setLocale:[NSLocale localeWithLocaleIdentifier:@"fr_FR"]];
NSLog(@"%@", [french fromNow]); // il y a quelques secondes
    
YLMoment *albanian = [[YLMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
[albanian setLocale:[NSLocale localeWithLocaleIdentifier:@"sq_AL"]];
NSLog(@"%@", [albanian fromNow]); // disa sekonda me parë
    
YLMoment *spanish = [[YLMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
[spanish setLocale:[NSLocale localeWithLocaleIdentifier:@"es_ES"]];
NSLog(@"%@", [spanish fromNow]); // hace unos segundos
    
YLMoment *reference = [YLMoment momentWithArray:@[@2013]];
YLMoment *english   = [[YLMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
[english setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
NSLog(@"%@", [english fromMoment:reference]); // in 11 months
```

## License (MIT)

Copyright (c) 2013 - Yannick Loriot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
