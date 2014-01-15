## Changelog

### Version 0.4.0 (Under development)

### Version 0.3.0 (2014-01-15)

- [ADD] Subtract methods: `subtractAmountOfTime:forUnitKey:`, `subtractAmountOfTime:forCalendarUnit:` and `subtractDuration:`
- [REFACTORING] Move the date detector to the proxy to improve the performance
- [ADD] `German` language

### Version 0.2.0 (2013-11-17)

- [ADD] `timeZone`, `timeStyle` and `dateStyle` configuration for the format
- [FIX] `fromNowWithSuffix:` call
- [ADD] `Dutch` language
- [CHANGE] Default date/time format to `NSDateFormatterLongStyle`

### Version 0.1.0 (2013-10-30)

- Initializers from `NSDate`, `NSArray`, `String`, `String and Format`
- Global configuration via proxy (`calendar` and `locale`)
- Formatting moments
- Check the moment validity via the `isValid` method
- Relative Dates (`from`, `fromNow`)
- Manipulating Dates (`addAmountOfTime`, `addDuration`, `startOf`, `endOf`)
- Getting/Setting the `seconds`, `minutes`, `hours`, `days`, `months`, `years`
- Support for `Albanian`/`English`/`French`/`Spanish`

