//
//  AppDelegate.m
//  Link
//
//  Created by Arunabh Das on 2015-10-16.
//  Copyright © 2015 Arunabh Das. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "InternalOneViewController.h"
#import "InternalTwoViewController.h"
#import "InternalThreeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // HomeViewController *homeViewController = [[HomeViewController alloc] init];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"home"];
    self.mainController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    self.window.rootViewController = self.mainController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) { //Check if our iOS version supports multitasking I.E iOS 4
        if ([[UIDevice currentDevice] isMultitaskingSupported]) { //Check if device supports mulitasking
            NSLog(@"multitasking supported");
            UIApplication *application = [UIApplication sharedApplication]; //Get the shared application instance
            
            __block UIBackgroundTaskIdentifier background_task; //Create a task object
            
            background_task = [application beginBackgroundTaskWithExpirationHandler: ^ {
                [application endBackgroundTask: background_task]; //Tell the system that we are done with the tasks
                background_task = UIBackgroundTaskInvalid; //Set the task to be invalid
                
                //System will be shutting down the app at any point in time now
                NSLog(@"System will shutdown the app at any time now");
                
            }];
            
            //Background tasks require you to use asyncrous tasks
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //Perform your tasks that your application requires
                
                NSLog(@"\n\nRunning in the background!\n\n");
                
                
                
                
                [application endBackgroundTask: background_task]; //End the task so the system knows that you are done with what you need to perform
                background_task = UIBackgroundTaskInvalid; //Invalidate the background_task
            });
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL) application: (UIApplication * ) application openURL: (NSURL * ) url sourceApplication: (NSString * ) sourceApplication annotation: (id) annotation {
    if([[url host] isEqualToString:@"linklink"]){
        
        if([[url path] isEqualToString:@"/main"]){
            [self.mainController setViewControllers:@[[[HomeViewController alloc] init]] animated:YES];
        }
        else if([[url path] isEqualToString:@"/internal1"]){
            [self.mainController pushViewController:[[InternalOneViewController alloc] init] animated:YES];
        }
        else if([[url path] isEqualToString:@"/internal2"]){
            [self.mainController pushViewController:[[InternalTwoViewController alloc] init] animated:YES];
        }
        else if([[url path] isEqualToString:@"/internal3"]){
            [self.mainController pushViewController:[[InternalThreeViewController alloc] init] animated:YES];
        }
        return YES;
    }
    else{
        return NO;
    }
}

@end
