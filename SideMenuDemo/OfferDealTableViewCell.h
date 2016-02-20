//
//  OfferDealTableViewCell.h
//  SideMenuDemo
//
//  Created by Nikhil Wagh on 1/3/16.
//  Copyright © 2016 Nikhil Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferDealTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *DealTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *DealLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *DealNewPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *DealOldPrice;
@property (weak, nonatomic) IBOutlet UILabel *DealLikedCount;
@property (weak, nonatomic) IBOutlet UILabel *DealBoughtCount;
@property (weak, nonatomic) IBOutlet UIImageView *DealImageView;

@end
