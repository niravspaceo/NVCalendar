#import "ViewController.h"
#import "NVCalendar.h"
@implementation ViewController

- (void)viewDidLoad
{
    dtForMonth = [NSDate date];
    [self createCalendar];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createCalendar
{
    if ([self.view viewWithTag:1001])
    {
        [[self.view viewWithTag:1001] removeFromSuperview];
    }
    UIView *viewTmp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    viewTmp.tag=1001;
    [self.view addSubview:viewTmp];
    isLeft = YES;
    int X = 0;
    //right now i have create 2*2 matrix of calendar to display on view, in next versions i wll make it dynamic.
    for(int i = 0 ;i < 4;i++)
    {
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:dtForMonth];
        NSInteger month = [components month];
        NSInteger year = [components year];
        NSInteger day = [components day];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSRange totaldaysForMonth = [gregorian rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:dtForMonth];//total days of particular month
        dtForMonth = [dtForMonth dateByAddingTimeInterval:Seconds_of_Minute*Minutes_of_Hour*Hours_of_Day*totaldaysForMonth.length];
        
        NSDateFormatter *dt = [[NSDateFormatter alloc] init];
        NSString *strMonthName = [[dt monthSymbols] objectAtIndex:month-1];//January,Febryary,March etc...
        strMonthName = [strMonthName stringByAppendingString:[NSString  stringWithFormat:@"- %d",year]];
        
        X = isLeft ? 10 : 164;
       
        if(i % 2 == 0)
        {
            originY = (i*Origin_of_calendarView)+Static_Y_Space;
        }
        
        NVCalendar  *vwCal = [[NVCalendar alloc] initWithFrame:CGRectMake(X, originY, Width_calendarView,Height_calendarView)];
        X++;
        vwCal.tag = i+100;
        vwCal.layer.masksToBounds = NO;
        vwCal.layer.shadowColor = [UIColor blackColor].CGColor;
        vwCal.layer.shadowOffset = CGSizeMake(10, 10);
        vwCal.layer.shadowOpacity = 0.4;
        vwCal.backgroundColor = [UIColor whiteColor];
        vwCal.layer.cornerRadius = 5.0;
        vwCal.layer.borderColor = [UIColor blackColor].CGColor;
        vwCal.layer.borderWidth = 2.0;
        
        vwCal = [vwCal createCalOfDay:day Month:month Year:year MonthName:strMonthName];
        [viewTmp addSubview:vwCal];
        isLeft = !isLeft;
    }
}
-(IBAction)next
{
    [self createCalendar];
}
-(IBAction)previous
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:-Minus_month_for_Previous_Action];
    dtForMonth = [gregorian dateByAddingComponents:components toDate:dtForMonth options:0];
    [self createCalendar];
}
@end
