//
//  NSDate+sinceNow.m
//

#import "NSDate+sinceNow.h"

#define FUTURE @"not yet"

#define SECOND_AGO @"one second ago"
#define SECONDS_AGO @"%.f seconds ago"

#define MINUTE_AGO @"a minute ago"
#define MINUTES_AGO @"%.f minutes ago"

#define HOUR_AGO @"an hour ago"
#define HOURS_AGO @"%.f hours ago"

#define DAY_AGO @"yesterday"
#define DAYS_AGO @"%.f days ago"

#define MONTH_AGO @"one month ago"
#define MONTHS_AGO @"%.f months ago"

#define YEAR_AGO @"one year ago"
#define YEARS_AGO @"%.f years ago"

@implementation NSDate (Extend)

const int SECOND = 1;
const int MINUTE = 60 * SECOND;
const int HOUR = 60 * MINUTE;
const int DAY = 24 * HOUR;
const int MONTH = 30 * DAY;

-(NSString*)sinceNow
{
    NSTimeInterval delta = [[NSDate date] timeIntervalSinceNow] - [self timeIntervalSinceNow];
    
    if(delta < 0)
        return FUTURE;
    if(delta < 1 * MINUTE)
        return delta == 1 ? SECOND_AGO :  [NSString stringWithFormat:SECONDS_AGO, delta];
    if(delta < 2 * MINUTE)
        return MINUTE_AGO;
    if(delta < 45 * MINUTE)
        return [NSString stringWithFormat:MINUTES_AGO, delta / MINUTE];
    if(delta < 90 * MINUTE)
        return HOUR_AGO;
    if(delta < 24 * HOUR)
        return [NSString stringWithFormat:HOURS_AGO, delta / HOUR];
    if(delta < 48 * HOUR)
        return DAY_AGO;
    if(delta < 30 * DAY)
        return [NSString stringWithFormat:DAYS_AGO, delta / DAY];
    if(delta < 12 * MONTH)
    {
        float months = delta / DAY / 30;
        return months <= 1 ? MONTH_AGO : [NSString stringWithFormat:MONTHS_AGO, months];
    }
    else
    {
        float years = delta / DAY / 365;
        return years <= 1 ? YEAR_AGO : [NSString stringWithFormat:YEARS_AGO];
    }
}

@end
