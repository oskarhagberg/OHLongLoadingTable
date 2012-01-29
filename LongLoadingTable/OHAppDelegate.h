//
//  OHAppDelegate.h
//  LongLoadingTable
//
//  Created by Oskar Hagberg on 2012-01-29.
//  Copyright (c) 2012 oskarhagberg.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OHLongLoadingTableViewController.h"

@interface OHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) OHLongLoadingTableViewController* tableViewController;

@end
