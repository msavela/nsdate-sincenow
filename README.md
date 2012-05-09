# NSDate-sinceNow

Extend NSDate to print human readable elapsed timestamp since current date

## Example usage

```objective-c
#import "NSDate+sinceNow.h"

// Subtract 15 minutes from current date
NSDate *date = [[NSDate date] dateByAddingTimeInterval:-60 * 15];
NSLog(@"%@", [date sinceNow]);
```

This would output:

```
15 minutes ago
```