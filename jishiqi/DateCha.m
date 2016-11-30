//
//  DateCha.m
//  jishiqi
//
//  Created by kuanter on 2016/11/30.
//  Copyright © 2016年 kuanter. All rights reserved.
//

#import "DateCha.h"

@implementation DateCha
+(NSString*)chaStringToInputStr:(NSString*)inputStr{
    
    
    NSDate*inputDate=[self dateToString:inputStr];//先转成0时区时间
    NSDate*localeDate=[self dateToDate:inputDate];//当前时区时间
    
    
    //当前时区时间
    NSDate *date = [NSDate date];
    NSDate*newDate=[self dateToDate:date];
    
    
    
    NSTimeInterval inputInterval=[localeDate timeIntervalSince1970]*1;
    NSTimeInterval currentInterval=[newDate timeIntervalSince1970]*1;
    
    NSString*outputStr=[self dateTointerval:currentInterval-inputInterval];
    return outputStr;
}
+(NSString*)dateTointerval:(NSInteger)interval{
    
    int d,h,m,s;
    
    d=interval/(60*60*24);
    
    h=interval%86400/3600;
    m=interval%3600/60;
    s=interval%60;
    NSString*dateStr=[NSString stringWithFormat:@"%d天%d时%d分%d秒",d,h,m,s];
    return dateStr;
}

//返回当前时区时间
+(NSDate*)dateToDate:(NSDate*)date{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}
//字符串变成 0时区 时间
+(NSDate*)dateToString:(NSString*)DateStr{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateStyle:NSDateFormatterFullStyle];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:DateStr];
    
    return inputDate;
}

@end
