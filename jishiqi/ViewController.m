//
//  ViewController.m
//  jishiqi
//
//  Created by kuanter on 2016/11/30.
//  Copyright © 2016年 kuanter. All rights reserved.
//

#import "ViewController.h"
#import "DateCha.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)timeChabutton:(id)sender {
   
    
  NSString*fff=  [DateCha chaStringToInputStr:@"2016-11-28 11:03:00"];
    NSLog(@"=========%@=====",fff);
    
}




- (IBAction)timeButton:(id)sender {
//    2016-11-30 09:38:37
    NSString* string = @"2016-11-28 11:03:00";
    NSDate*inputDate=[self dateToString:string];//先转成0时区时间
    NSDate*localeDate=[self dateToDate:inputDate];//当前时区时间
    
    
    //当前时区时间
    NSDate *date = [NSDate date];
    NSDate*newDate=[self dateToDate:date];
    
    
    
    NSTimeInterval late=[localeDate timeIntervalSince1970]*1;
    NSTimeInterval late2=[newDate timeIntervalSince1970]*1;
    
    
    NSLog(@"=========%@=====",[self dateTointerval:late2-late]);
}

-(NSString*)dateTointerval:(NSInteger)interval{
   
    int d,h,m,s;
    
    d=interval/(60*60*24);
    h=interval%86400/3600;
    m=interval%3600/60;
    s=interval%60;
    NSString*dateStr=[NSString stringWithFormat:@"%d天%d时%d分%d秒",d,h,m,s];
    return dateStr;
}

//返回当前时区时间
-(NSDate*)dateToDate:(NSDate*)date{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}
//字符串变成 0时区 时间
-(NSDate*)dateToString:(NSString*)DateStr{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateStyle:NSDateFormatterFullStyle];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:DateStr];
    
    return inputDate;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
