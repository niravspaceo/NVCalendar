//
//  ViewController.h
//  CalendarDemo
//
//  Created by Nirav's Macmini on 17/01/14.
//  Copyright (c) 2014 Nirav's Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define Width_View 320
#define Height_View 480
#define Static_Y_Space 80
#define Width_calendarView 144
#define Height_calendarView 144
#define Minus_month_for_Previous_Action 8
#define Seconds_of_Minute 60
#define Minutes_of_Hour 60
#define Hours_of_Day 24
#define Origin_of_calendarView 78
#define Width_Allocated_for_CalendarViews 290
@interface ViewController : UIViewController
{
    BOOL isLeft;
    NSDate *dtForMonth;
    int originX,originY;
}
-(void)createCalendar;
-(IBAction)next;
-(IBAction)previous;
@end
