//
//  OHLongLoadingTableViewController.m
//  LongLoadingTable
//
//  Created by Oskar Hagberg on 2012-01-29.
//  Copyright (c) 2012 oskarhagberg.com. All rights reserved.
//

#import "OHLongLoadingTableViewController.h"

@implementation OHLongLoadingTableViewController
@synthesize tableView = _tableView;
@synthesize loadingHeaderView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = self.loadingHeaderView.frame;
    rect.origin.x = 0.0f;
    rect.origin.y = 0.0f - rect.size.height;
    self.loadingHeaderView.frame = rect;
    [self.tableView addSubview:self.loadingHeaderView];
    
    UITapGestureRecognizer* tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide:)] autorelease];;
    tap.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:tap];
    
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setLoadingHeaderView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    self.tableView.contentInset = UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_tableView release];
    [loadingHeaderView release];
    [super dealloc];
}

- (void)showLoadingHeaderAnimated:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:0.2f
                         animations:^{
                             self.tableView.contentInset = UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f);
                         } completion:nil];
    } else {
        self.tableView.contentInset = UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f);
    }
    
}

- (void)hideLoadingHeaderAnimated:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:0.2f
                         animations:^{
                             self.tableView.contentInset = UIEdgeInsetsMake(4.0f, 0.0f, 0.0f, 0.0f);
                         } completion:nil];
    } else {
        self.tableView.contentInset = UIEdgeInsetsMake(4.0f, 0.0f, 0.0f, 0.0f);
    }
}

- (IBAction)hide:(id)sender {
    if ([sender isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer* tap = (UITapGestureRecognizer*)sender;
        CGPoint p = [tap locationInView:self.tableView];
        if (p.y >= 0) {
            return;
        }
    }
    [self hideLoadingHeaderAnimated:YES];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Required Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
							 CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    NSString* s = indexPath.row % 2 == 0 ? @"show" : @"hide";
	cell.textLabel.text = [NSString stringWithFormat:@"Cell %d (%@)", indexPath.row, s];
    // Set up the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        [self showLoadingHeaderAnimated:YES];
    } else {
        [self hideLoadingHeaderAnimated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
