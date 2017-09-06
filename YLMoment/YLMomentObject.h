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

#import <Foundation/Foundation.h>

static NSString * const YLMomentIso8601Format = @"yyyy-MM-dd'T'HH:mm:ssZ";

/**
 * YLMoment is a library which provides an high abstraction level for parsing,
 * validating, manipulating, and formatting the dates in Objective-C.
 *
 * Its API is inspired by the well known moment.js library, however unlike its
 * counterpart, its core is built upon the Foundation Framework components 
 * (NSDate, NSCalendar, etc.) to enable the interoperability with them.
 *
 * This library is designed to facilitate the manipulation of times, dates, 
 * calendars, and durations in Objective-C by providing a single, easy, and 
 * unified approach to dealing with them.
 */
@interface YLMoment : NSObject

#pragma mark Creating and Initializing Moment Objects
/** @name Creating and Initializing Moment Objects */

/**
 * @abstract Creates and returns a moment which is set to the current date.
 * @since 0.1.0
 */
+ (instancetype)now;

/**
 * @abstract Creates and returns a moment with the current datetime using 
 * the Universal Coordinated Time (UTC).
 * @since 0.4.0
 */
+ (instancetype)utc;

/**
 * @abstract Initializes a moment using a given date.
 * @param date a date.
 * @since 0.1.0
 */
- (instancetype)initWithDate:(NSDate *)date;

/**
 * @abstract Creates and returns a moment using a given date.
 * @param date a date.
 * @see initWithDate:
 * @since 0.1.0
 */
+ (instancetype)momentWithDate:(NSDate *)date;

/**
 * @abstract Initializes a moment with an array of numbers that mirror the 
 * following components ['year', 'month', 'day', 'hour', 'minute', 'second'].
 * @param dateAsArray An array which represent the date components.
 * @discussion The moment will create a date in the current timezone.
 * @since 0.1.0
 */
- (instancetype)initWithArray:(NSArray *)dateAsArray;

/**
 * @abstract Creates and returns a moment with an array of numbers that mirror
 * the following components ['year', 'month', 'day', 'hour', 'minute', 'second'].
 * @param dateAsArray An array which represent the date components.
 * @discussion The moment will create a date in the current timezone.
 * @see initWithArray:
 * @since 0.1.0
 */
+ (instancetype)momentWithArray:(NSArray *)dateAsArray;

/**
 * @abstract Initializes a moment using the date representation of a given
 * string interpreted.
 * @param dateAsString The date string to parse.
 * @discussion The initializer uses the `NSDataDetector` to interpret the date
 * format.
 * @since 0.1.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString;

/**
 * @abstract Creates and returns a moment using the date representation of a 
 * given string.
 * @param dateAsString The date string to parse.
 * @discussion The initializer uses the `NSDataDetector` to interpret the date
 * format.
 * @see initWithDateAsString:
 * @since 0.1.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted and using a given date format.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @since 0.1.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

/**
 * @abstract Creates and returns a moment using the date representation of a 
 * given string interpreted and using a given date format.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @see initWithDateAsString:format:
 * @since 0.1.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted, a given date format, and a given locale identifier.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param localeIdentifier The identifier for the new locale for the receiver.
 * @since 0.1.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;

/**
 * @abstract Creates and returns a moment using the date representation of a
 * given string interpreted, a given date format, and a given locale identifier.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param localeIdentifier The identifier for the new locale for the receiver.
 * @see initWithDateAsString:format:localeIdentifier:
 * @since 0.1.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat localeIdentifier:(NSString *)localeIdentifier;

/**
 * @abstract Initialize a moment using the date representation of a given string
 * interpreted, a given date format, a given locale, and a time zone.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param locale The locale object.
 * @param timeZone The time zone object.
 * @discussion The given `locale` and `timeZone` are set by default to the new
 * moment. If you want you the global (proxy) value instead, set them to nil.
 * @since 0.4.0
 */
- (instancetype)initWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone;

/**
 * @abstract Creates and returns a moment using the date representation of a
 * given string interpreted, a given date format, a given locale, and a time
 * zone.
 * @param dateAsString The date string to parse.
 * @param dateFormat The date format string used by the receiver.
 * @param locale The locale object.
 * @param timeZone The time zone object.
 * @discussion The given `locale` and `timeZone` are set by default to the new
 * moment. If you want you the global (proxy) value instead, set them to nil.
 * @see initWithDateAsString:format:locale:timeZone:
 * @since 0.4.0
 */
+ (instancetype)momentWithDateAsString:(NSString *)dateAsString format:(NSString *)dateFormat locale:(NSLocale *)locale timeZone:(NSTimeZone *)timeZone;

#pragma mark - Configuring Moments
/** @name Configuring Moments */

/**
 * @abstract The calendar that will be used for the date calculations.
 * @discussion The default value is set to the current calendar.
 * @since 0.1.0
 */
@property (atomic, strong) NSCalendar *calendar;

/**
 * @abstract The local that will be used to display the dates.
 * @discussion The default value is set to the current locale.
 * @since 0.1.0
 */
@property (atomic, strong) NSLocale *locale;

/**
 * @abstract The time zone that will be used to display the dates.
 * @discussion The default value of the time zone is set to the default time 
 * zone of the user.
 * @since 0.2.0
 */
@property (atomic, strong) NSTimeZone *timeZone;

/**
 * @abstract The date style of the receiver.
 * @discussion By default the date style is set to `NSDateFormatterLongStyle`.
 * @since 0.2.0
 */
@property (atomic, assign) NSDateFormatterStyle dateStyle;

/**
 * @abstract The time style of the receiver.
 * @discussion By default the date style is set to `NSDateFormatterLongStyle`.
 * @since 0.2.0
 */
@property (atomic, assign) NSDateFormatterStyle timeStyle;

#pragma mark - Validating Moments
/** @name Validating Moments */

/**
 * @abstract Returns true whether the current moment is valid.
 * @return `true` whether the current moment is valid.
 * @since 0.1.0
 */
- (BOOL)isValid;

#pragma mark - Converting Moments
/** @name Working with Moments */

/**
 * Returns the `NSDate` corresponding to the current moment.
 * @return the `NSDate` corresponding to the current moment.
 * @since 0.1.0
 */
- (NSDate *)date;

#pragma mark - Comparing Moments
/** @name Comparing Moments */

/**
 * @abstract Returns a Boolean value that indicates whether a given object
 * is an `YLMoment` object and exactly equal the receiver.
 * @param anotherMoment The moment to compare with the receiver.
 * @return YES if the anotherMoment is an `YLMoment` object and is exactly
 * equal to the receiver, otherwise NO.
 * @since 0.1.0
 */
- (BOOL)isEqualToMoment:(YLMoment *)anotherMoment;

/**
 * @abstract Returns a Boolean value that indicates whether a given object
 * is an `YLMoment` object and exactly equal the receiver.
 * @param anotherMoment The moment to compare with the receiver.
 * @return YES if the anotherMoment is an `YLMoment` object and is exactly
 * equal to the receiver, otherwise NO.
 * @since 0.9.0
 */
- (BOOL)isSameMoment:(YLMoment *)anotherMoment;

/**
 * @abstract Returns a Boolean value that indicates whether a given object
 * is an `YLMoment` object and exactly equal the receiver for the given
 * calendar unit equal or larger.
 * @param anotherMoment The moment to compare with the receiver.
 * @param calendarUnit The calendar unit to compare against
 * @return YES if the anotherMoment is an `YLMoment` object and is exactly
 * equal to the receiver for the given calendar unit equal or larger,
 * otherwise NO.
 * @since 0.9.0
 */
- (BOOL)isSameMoment:(YLMoment *)anotherMoment forUnit:(NSCalendarUnit) calendarUnit;

/**
 * @abstract Returns a Boolean value that indicates whether a given object 
 * is an `YLMoment` and is of a later date than the receiver's.
 * @param anotherMoment The moment to be compared with the receiver.
 * @return YES if the anotherMoment is an `YLMoment` object and of a later 
 * date than the receiver, otherwise NO.
 * @since 0.8.0
 */
- (BOOL)isBeforeMoment:(YLMoment *)anotherMoment;

/**
 * @abstract Returns a Boolean value that indicates whether a given object
 * is an `YLMoment` and is of an earlier date than the receiver's.
 * @param anotherMoment The moment to be compared with the receiver.
 * @return YES if the anotherMoment is an `YLMoment` object and of an earlier
 * date than the receiver, otherwise NO.
 * @since 0.8.0
 */
- (BOOL)isAfterMoment:(YLMoment *)anotherMoment;

/**
 * @abstract Returns `BOOL` when comparing if a given moment's date is between two other moments.
 * @param startMoment The starting reference moment being compared against.
 * @param endMoment The ending reference moment being compared against.
 * @return YES if the anotherMoment is an `YLMoment` object and of an later
 * @since 0.8.0
 */
- (BOOL)isBetweenMoments:(YLMoment *)startMoment andEndMoment:(YLMoment *)endMoment;

#pragma mark - Proxy Method
/** @name Proxy Method */

/**
 * @abstract Returns the proxy for the receiver.
 * @return The appearance proxy for the receiver.
 * @discussion The proxy is useful to configuring the `YLMoment` in a global way.
 * @since 0.1.0
 */
+ (instancetype)proxy;

@end
