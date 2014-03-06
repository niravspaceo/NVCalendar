#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define day_label_width 18
#define day_label_height 18

@interface NVCalendar : UIView<UIGestureRecognizerDelegate>
{
}
-(NVCalendar *)createCalOfDay:(int)currentDay Month:(int)currentMonth Year:(int)currentYear MonthName:(NSString *)name;
@end
