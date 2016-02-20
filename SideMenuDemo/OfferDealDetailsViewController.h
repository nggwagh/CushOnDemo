//
//  OfferDealDetailsViewController.h
//  SideMenuDemo
//
//  Created by Nikhil Wagh on 1/3/16.
//  Copyright © 2016 Nikhil Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface OfferDealDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *dealImageView;
@property (weak, nonatomic) IBOutlet UILabel *dealTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealTimingLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealContactNumberlabel;
@property (weak, nonatomic) IBOutlet UITextView *dealDetailsTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *dealDetailScrollView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *declineButton;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;

@property (weak, nonatomic) IBOutlet UILabel *dealAddressLabel;

@property (strong, nonatomic) NSMutableArray *dealInfoArray;

- (IBAction)declineButton_TouchUpInside:(UIButton *)sender;
- (IBAction)likeButton_TouchUpInside:(UIButton *)sender;
- (IBAction)buyButton_TouchUpInside:(UIButton *)sender;
-(IBAction)backButton_TouchUpInside:(id)sender;
-(IBAction)phoneButton_TouchUpInside:(id)sender;


@end
