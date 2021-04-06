//
//  LSIWeatherForcast.h
//  DailyWeather
//
//  Created by Jeff Kang on 4/6/21.
//  Copyright © 2021 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIWeatherForcast : NSObject

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
                     uvIndex:(int)aUVIndex NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initWithDictionary:(NSDictionary *)aDictionary;

@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly, copy) NSString *summary;
@property (nonatomic, readonly) NSData *icon;
@property (nonatomic, readonly) double precipProbability;
@property (nonatomic, readonly) double precipIntensity;
@property (nonatomic, readonly) int temperature;
@property (nonatomic, readonly) int apparentTemperature;
@property (nonatomic, readonly) int humidity;
@property (nonatomic, readonly) double pressure;
@property (nonatomic, readonly) int windSpeed;
@property (nonatomic, readonly, copy) NSString *windBearing;
@property (nonatomic, readonly) int uvIndex;

@end

NS_ASSUME_NONNULL_END
