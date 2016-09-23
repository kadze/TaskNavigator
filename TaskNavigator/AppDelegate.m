//
//  AppDelegate.m
//  TaskNavigator
//
//  Created by Andrey on 5/9/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UIAppearance.h>
#import <MagicalRecord/MagicalRecord.h>

#import "AppDelegate.h"

#import "SAPTasksViewController.h"
#import "SAPColor.h"

#import "UIWindow+SAPExtensions.h"

@interface AppDelegate ()

- (void)customizeAppearance;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    [MagicalRecord setupCoreDataStack];
    
    SAPTasksViewController *controller = [SAPTasksViewController new];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self customizeAppearance];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
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
#pragma mark Private

- (void)customizeAppearance {
    [UINavigationBar appearance].barTintColor = [SAPColor navigationBarColor];
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"BackArrow"];
    [UINavigationBar appearance].titleTextAttributes = @{NSFontAttributeName:[UIFont fontWithName:@"OpenSans" size:16]};
}

@end
