## YLMoment

[![Supported Platforms](https://cocoapod-badges.herokuapp.com/p/YLMoment/badge.svg)](http://cocoadocs.org/docsets/YLMoment/) [![Version](https://cocoapod-badges.herokuapp.com/v/YLMoment/badge.svg)](http://cocoadocs.org/docsets/YLMoment/) [![Build Status](https://travis-ci.org/yannickl/YLMoment.png?branch=master)](https://travis-ci.org/yannickl/YLMoment) [![Coverage Status](https://coveralls.io/repos/yannickl/YLMoment/badge.svg?branch=master&service=github)](https://coveralls.io/github/yannickl/YLMoment?branch=master)

YLMoment is a library which provides an high abstraction level for parsing, validating, manipulating, and formatting the dates in Objective-C.

Its API is inspired by the well known [moment.js](http://momentjs.com/) library, however unlike its counterpart, its core is built upon the `Foundation Framework` components (`NSDate`, `NSCalendar`, etc.) to enable the interoperability with them.

This library is designed to facilitate the manipulation of times, dates, calendars, and durations in Objective-C by providing a single, easy, and unified approach to dealing with them.

YLMoment supports the `Albanian`, `Chinese`, `Dutch`, `English`, `French`, `German`, `Japanese`, `Portuguese`, `Spanish` and `Vietnamese` languages.

## Getting Started

If you want have a quick overview of the project take a look to this [blog post](http://yannickloriot.com/2013/11/handle-times-dates-calendars-and-durations-like-a-pro-in-objective-c-with-YLMoment/).

## Usage

### Formatting Dates
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

### Time Zones
```objective-c
// Uses my current time zone: here the CET time (GMT+1)
YLMoment *now = [YLMoment now];
NSLog(@"%@", [now format]); // 2014-01-18T18:51:10+0100

// Change the time zone of the moment
now.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
NSLog(@"%@", [now format]); // 2014-01-18T17:51:10+0000

// Convenient way to use get the UTC time
YLMoment *utc = [YLMoment utc];
NSLog(@"%@", [utc format]); // 2014-01-18T17:51:10+0000
```

### Languages
```objective-c
YLMoment *french = [[YLMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
[french setLocale:[NSLocale localeWithLocaleIdentifier:@"fr_FR"]];
NSLog(@"%@", [french fromNow]); // il y a quelques secondes

YLMoment *albanian = [[YLMoment now] addAmountOfTime:-3 forUnitKey:@"s"];
[albanian setLocale:[NSLocale localeWithLocaleIdentifier:@"sq_AL"]];
NSLog(@"%@", [albanian fromNow]); // disa sekonda me parë

YLMoment *spanish = [[YLMoment now] subtractAmountOfTime:3 forUnitKey:@"s"];
[spanish setLocale:[NSLocale localeWithLocaleIdentifier:@"es_ES"]];
NSLog(@"%@", [spanish fromNow]); // hace unos segundos

YLMoment *reference = [YLMoment momentWithArray:@[@2013]];
YLMoment *english   = [[YLMoment now] subtractAmountOfTime:3 forUnitKey:@"s"];
[english setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
NSLog(@"%@", [english fromMoment:reference]); // in 11 months
```

### Installation

The recommended approach to use _YLMoment_ in your project is using the [CocoaPods](http://cocoapods.org/) package manager, as it provides flexible dependency management and dead simple installation.

#### CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```
Go to the directory of your Xcode project, and Create and Edit your Podfile and add YLMoment:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '5.0'
# Or platform :osx, '10.8'
pod 'YLMoment', '~> 6.0.0'
```

Install into your project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file)

``` bash
$ open MyProject.xcworkspace
```

#### Manually

[Download](https://github.com/YannickL/YLMoment/archive/master.zip) the project and copy the `YLMoment` folder into your project and then simply `#import "YLMoment.h"` in the file(s) you would like to use it in.

## Contact

Yannick Loriot
 - [https://twitter.com/yannickloriot](https://twitter.com/yannickloriot)
 - [contact@yannickloriot.com](mailto:contact@yannickloriot.com)


## License (MIT)

Copyright (c) 2013-present - Yannick Loriot

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
