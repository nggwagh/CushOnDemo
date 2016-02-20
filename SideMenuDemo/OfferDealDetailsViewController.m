//
//  OfferDealDetailsViewController.m
//  SideMenuDemo
//
//  Created by Nikhil Wagh on 1/3/16.
//  Copyright © 2016 Nikhil Wagh. All rights reserved.
//

#import "OfferDealDetailsViewController.h"

@interface OfferDealDetailsViewController ()

@end

@implementation OfferDealDetailsViewController
@synthesize dealInfoArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buyButton.layer.cornerRadius = 5;
    self.buyButton.layer.borderColor=[UIColor clearColor].CGColor;
    self.buyButton.layer.borderWidth=2.0f;
    
    self.likeButton.layer.cornerRadius = 5;
    self.likeButton.layer.borderColor=[UIColor clearColor].CGColor;
    self.likeButton.layer.borderWidth=2.0f;
    
    self.declineButton.layer.cornerRadius = 5;
    self.declineButton.layer.borderColor=[UIColor clearColor].CGColor;
    self.declineButton.layer.borderWidth=2.0f;
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.dealTitleLabel setText:[NSString stringWithFormat:@" %@",[[self.dealInfoArray objectAtIndex:0] valueForKey:@"DealTitle"]]];
    [self.dealImageView setImage:[UIImage imageNamed:[[self.dealInfoArray objectAtIndex:0] valueForKey:@"DealImageView"]]];
    [self.dealContactNumberlabel setText:[[self.dealInfoArray objectAtIndex:0] valueForKey:@"DealPhoneNumber"]];
    [self.dealTimingLabel setText:[[self.dealInfoArray objectAtIndex:0] valueForKey:@"DealTiming"]];
    [self.dealDetailsTextView setText:[[self.dealInfoArray objectAtIndex:0] valueForKey:@"DealDetailInfo"]];
    [self.dealAddressLabel setText:[[self.dealInfoArray objectAtIndex:0] valueForKey:@"DealLocation"]];

    self.dealDetailsTextView.scrollEnabled = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    self.dealDetailsTextView.scrollEnabled = YES;
}

-(void)viewDidLayoutSubviews
{
    [self.dealDetailScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 800)];
}

-(IBAction)backButton_TouchUpInside:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)declineButton_TouchUpInside:(UIButton *)sender
{
    UIAlertView *alertMe=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your deal has been Decline successfully." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertMe show];
}

- (IBAction)likeButton_TouchUpInside:(UIButton *)sender
{
    UIAlertView *alertMe=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"You have Liked the deal. You will get similar deals in future." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertMe show];
}

- (IBAction)buyButton_TouchUpInside:(UIButton *)sender
{
    UIAlertView *alertMe=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"You have brought the deal successfully." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertMe show];
}

-(IBAction)phoneButton_TouchUpInside:(id)sender
{
    UIAlertView *alertMe=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"This service is temproparly unavailable." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertMe show];
}


@end
