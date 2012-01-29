//
//  OHLongLoadingTableViewController.h
//  LongLoadingTable
//
//  Created by Oskar Hagberg on 2012-01-29.
//  Copyright (c) 2012 oskarhagberg.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OHLongLoadingTableViewHeader.h"

@interface OHLongLoadingTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet OHLongLoadingTableViewHeader *loadingHeaderView;

- (void)showLoadingHeaderAnimated:(BOOL)animated;
- (void)hideLoadingHeaderAnimated:(BOOL)animated;
- (IBAction)hide:(id)sender;

@end
