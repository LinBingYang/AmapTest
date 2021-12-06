//
//  AppDelegate.m
//  AmapTest
//
//  Created by Admin on 2021/12/6.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <AMapFoundationKit/AMapServices.h>
#import <AMapLocationKit/AMapLocationKit.h>
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [AMapServices sharedServices].apiKey =@"3ea21a428f5daa1441634becd987603a";
    [AMapLocationManager updatePrivacyAgree:AMapPrivacyAgreeStatusDidAgree];
    [AMapLocationManager updatePrivacyShow:AMapPrivacyShowStatusDidShow privacyInfo:AMapPrivacyInfoStatusDidContain];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController=[ViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}





@end
