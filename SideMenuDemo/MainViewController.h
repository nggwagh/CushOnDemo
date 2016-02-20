//
//  MainViewController.h
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OfferDealDetailsViewController.h"
#import "MBProgressHUD.h"


@interface MainViewController : UIViewController
{
    NSMutableArray *dealArray;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UITableView *DealTableView;


@property (strong, nonatomic)UIRefreshControl *refreshControl;

@end
