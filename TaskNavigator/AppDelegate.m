//
//  AppDelegate.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UIAppearance.h>
#import <MagicalRecord/MagicalRecord.h>
#import <UserNotifications/UserNotifications.h>

#import "AppDelegate.h"

#import "SAPTasksViewController.h"
#import "SAPTasks.h"
#import "SAPTask.h"

#import "UIColor+TaskNavigator.h"

#import "UIWindow+SAPExtensions.h"

@interface AppDelegate () <UNUserNotificationCenterDelegate>

- (void)customizeAppearance;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    [MagicalRecord setupCoreDataStack];
    
    SAPTasksViewController *controller = [SAPTasksViewController new];
    controller.items = [[SAPTasks alloc] initWithFetchedResultsControllerForContext:[NSManagedObjectContext MR_defaultContext] entity:SAPTask.entity];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self customizeAppearance];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    //User notifications setup
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {}];
    
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    center.delegate = self;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

#pragma mark -
#pragma mark UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    completionHandler(UNAuthorizationOptionAlert | UNAuthorizationOptionSound);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler
{
    completionHandler();
}

#pragma mark -
#pragma mark Private

- (void)customizeAppearance {
    [UINavigationBar appearance].barTintColor = [UIColor blueThemeColor];
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"BackArrow"];
    [UINavigationBar appearance].titleTextAttributes = @{NSFontAttributeName:[UIFont fontWithName:@"OpenSans" size:16]};
}

@end
