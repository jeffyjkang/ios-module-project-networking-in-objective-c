//
//  LSIWeatherForcast.m
//  DailyWeather
//
//  Created by Jeff Kang on 4/6/21.
//  Copyright © 2021 Lambda, Inc. All rights reserved.
//

#import "LSIWeatherForcast.h"
#import <UIKit/UIKit.h>

@implementation LSIWeatherForcast

- (instancetype)initWithTime:(NSDate *)aTime
                     summary:(NSString *)aSummary
                        icon:(NSData *)anIcon
           precipProbability:(double)aPrecipProbability
             precipIntensity:(double)aPrecipIntensity
                 temperature:(int)aTemperature
         apparentTemperature:(int)anApparentTemperature
                    humidity:(int)aHumidity
                    pressure:(double)aPressure
                   windSpeed:(int)aWindSpeed
                 windBearing:(NSString *)aWindBearing
                     uvIndex:(int)aUVIndex
{
    if (self = [super init]) {
        _time = aTime;
        _summary = aSummary.copy;
        _icon = anIcon;
        _precipProbability = aPrecipProbability;
        _precipIntensity = aPrecipIntensity;
        _temperature = aTemperature;
        _apparentTemperature = anApparentTemperature;
        _humidity = aHumidity;
        _pressure = aPressure;
        _windSpeed = aWindSpeed;
        _windBearing = aWindBearing.copy;
        _uvIndex = aUVIndex;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)aDictionary
{
    NSDictionary *properties = [aDictionary objectForKey: @"properties"];
    if (![properties isKindOfClass:NSDictionary.class]) return nil;
    
    NSNumber *timeInMilliseconds = [properties objectForKey:@"time"];
    if (![timeInMilliseconds isKindOfClass:NSNumber.class]) return nil;
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeInMilliseconds.longValue/1000.];
    
    NSString *summary = [properties objectForKey:@"summary"];
    if (![summary isKindOfClass:NSString.class]) return nil;
    
    NSString *iconString = [properties objectForKey:@"icon"];
    UIImage *iconImage = [UIImage imageNamed:iconString];
    NSData *iconData = UIImageJPEGRepresentation(iconImage, 1);
    
    NSNumber *precipProbability = [properties objectForKey:@"precipProbability"];
    if (![precipProbability isKindOfClass:NSNumber.class]) return nil;
    
    NSNumber *precipIntensity = [properties objectForKey:@"precipIntensity"];
    if (![precipIntensity isKindOfClass:NSNumber.class]) return nil;
    
    NSNumber *temperature = [properties objectForKey:@"temperature"];
    if (![temperature isKindOfClass:NSNumber.class]) return nil;
    
    NSNumber *apparentTemperature = [properties objectForKey:@"apparentTemperature"];
    if (![apparentTemperature isKindOfClass:NSNumber.class]) return nil;
    
    NSNumber *humidity = [properties objectForKey:@"humidity"];
    if (![humidity isKindOfClass:NSNumber.class]) return nil;
    
    NSNumber *pressure = [properties objectForKey:@"pressure"];
    if (![pressure isKindOfClass:NSNumber.class]) return nil;
    
    NSNumber *windSpeed = [properties objectForKey:@"windSpeed"];
    if (![windSpeed isKindOfClass:NSNumber.class]) return nil;
    
    NSString *windBearing = [properties objectForKey:@"windBearing"];
    if (![windBearing isKindOfClass:NSString.class]) return nil;
    
    NSNumber *uvIndex = [properties objectForKey:@"uvIndex"];
    if (![uvIndex isKindOfClass:NSNumber.class]) return nil;
    
    return [self initWithTime:time
                      summary:summary
                         icon:iconData
            precipProbability:precipProbability.doubleValue
              precipIntensity:precipIntensity.doubleValue
                  temperature:temperature.intValue
          apparentTemperature:apparentTemperature.intValue
                     humidity:humidity.intValue
                     pressure:pressure.doubleValue
                    windSpeed:windSpeed.intValue
                  windBearing:windBearing
                      uvIndex:uvIndex.intValue];
}

@end
