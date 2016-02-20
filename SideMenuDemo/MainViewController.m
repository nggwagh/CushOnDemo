//
//  MainViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "OfferDealTableViewCell.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize refreshControl;


///test for development baranch

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController)
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.DealTableView addSubview:refreshControl];
    [self.refreshControl addTarget:self
                            action:@selector(callPullToRefresh)
                  forControlEvents:UIControlEventValueChanged];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (dealArray.count>0)
    {
        [dealArray removeAllObjects];
    }
    
    dealArray=[[NSMutableArray alloc]init];
    
    [self performSelector:@selector(feelIntoArray) withObject:nil afterDelay:1.0];
    
}


-(void)callPullToRefresh
{
    if (dealArray.count>0)
    {
        [dealArray removeAllObjects];
    }
    
    dealArray=[[NSMutableArray alloc]init];
    [self feelIntoArray];
}

- (void)reloadData
{
    [self.DealTableView reloadData];
    [self.DealTableView setContentOffset:CGPointMake(0, 0)];
    
    // End the refreshing
    if (self.refreshControl)
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;
        
        [self.refreshControl endRefreshing];
    }
}

-(void)feelIntoArray
{
    
    NSMutableDictionary *tempDict8=[[NSMutableDictionary alloc]init];
    
    [tempDict8 setValue:@"Cielo Restaurant" forKey:@"DealTitle"];
    [tempDict8 setValue:@"Ikeja, Lagos" forKey:@"DealLocation"];
    [tempDict8 setValue:@"33% off" forKey:@"DealNewPrice"];
    [tempDict8 setValue:@"$2999" forKey:@"DealOldPrice"];
    [tempDict8 setValue:@"10" forKey:@"DealLikedCount"];
    [tempDict8 setValue:@"8" forKey:@"DealBoughtCount"];
    [tempDict8 setValue:@"food_2.jpg" forKey:@"DealImageView"];
    [tempDict8 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict8 setValue:@"8 AM - 12 PM" forKey:@"DealTiming"];
    [tempDict8 setValue:@"3 Course Meal | Cielo Restaurant" forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict8];
    
    
    NSMutableDictionary *tempDict9=[[NSMutableDictionary alloc]init];
    
    [tempDict9 setValue:@"burgers' N ' shakes" forKey:@"DealTitle"];
    [tempDict9 setValue:@"Akerele, Surulere, Lagos" forKey:@"DealLocation"];
    [tempDict9 setValue:@"40% off" forKey:@"DealNewPrice"];
    [tempDict9 setValue:@"$1200" forKey:@"DealOldPrice"];
    [tempDict9 setValue:@"66" forKey:@"DealLikedCount"];
    [tempDict9 setValue:@"12" forKey:@"DealBoughtCount"];
    [tempDict9 setValue:@"food_1.jpg" forKey:@"DealImageView"];
    [tempDict9 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict9 setValue:@"9 AM - 10 PM" forKey:@"DealTiming"];
    [tempDict9 setValue:@"Hot Dog with Fries & Smoothie" forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict9];
    
    NSMutableDictionary *tempDict10=[[NSMutableDictionary alloc]init];
    
    [tempDict10 setValue:@"Cherryplus Integrated Services Nigeria Limited" forKey:@"DealTitle"];
    [tempDict10 setValue:@"Victoria Island, Lagos" forKey:@"DealLocation"];
    [tempDict10 setValue:@"48% off" forKey:@"DealNewPrice"];
    [tempDict10 setValue:@"$12999" forKey:@"DealOldPrice"];
    [tempDict10 setValue:@"500" forKey:@"DealLikedCount"];
    [tempDict10 setValue:@"343" forKey:@"DealBoughtCount"];
    [tempDict10 setValue:@"Travels_1.jpg" forKey:@"DealImageView"];
    [tempDict10 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict10 setValue:@"limited time" forKey:@"DealTiming"];
    [tempDict10 setValue:@"Night Stay for 2 | beni Gold Hotel" forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict10];
    
    NSMutableDictionary *tempDict13=[[NSMutableDictionary alloc]init];
    
    [tempDict13 setValue:@"Accessories 4 U" forKey:@"DealTitle"];
    [tempDict13 setValue:@"21A Kofo Abayomi Street, , Victoria Island, Lagos State" forKey:@"DealLocation"];
    [tempDict13 setValue:@"20% off" forKey:@"DealNewPrice"];
    [tempDict13 setValue:@"$100" forKey:@"DealOldPrice"];
    [tempDict13 setValue:@"100" forKey:@"DealLikedCount"];
    [tempDict13 setValue:@"200" forKey:@"DealBoughtCount"];
    [tempDict13 setValue:@"shop_1.jpg" forKey:@"DealImageView"];
    [tempDict13 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict13 setValue:@"limited time" forKey:@"DealTiming"];
    [tempDict13 setValue:@"Accessories 4 U is an online store with an office (you can shop at) located in Victoria Island, Lagos. They stock all types of accessories from necklaces, bangles, rings, ear-rings, anklets, dog-tags, bracelets for him, her, kids, and friends and family back home. The prices are also friendly meaning everyone gets what they like too." forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict13];
    
    
    NSMutableDictionary *tempDict14=[[NSMutableDictionary alloc]init];
    
    [tempDict14 setValue:@"Clue Mag | Let's give you all the clues" forKey:@"DealTitle"];
    [tempDict14 setValue:@"Bosso,Minna,Nigeria." forKey:@"DealLocation"];
    [tempDict14 setValue:@"20% off" forKey:@"DealNewPrice"];
    [tempDict14 setValue:@"$1000" forKey:@"DealOldPrice"];
    [tempDict14 setValue:@"32" forKey:@"DealLikedCount"];
    [tempDict14 setValue:@"767" forKey:@"DealBoughtCount"];
    [tempDict14 setValue:@"boutique_2.jpg" forKey:@"DealImageView"];
    [tempDict14 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict14 setValue:@"10AM - 11PM" forKey:@"DealTiming"];
    [tempDict14 setValue:@"Let's give you all the clues" forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict14];
    
    
    NSMutableDictionary *tempDict12=[[NSMutableDictionary alloc]init];
    
    [tempDict12 setValue:@"Vchambell Beauty Spa & Salon" forKey:@"DealTitle"];
    [tempDict12 setValue:@"Apapa, Lagos" forKey:@"DealLocation"];
    [tempDict12 setValue:@"50% off" forKey:@"DealNewPrice"];
    [tempDict12 setValue:@"$3000" forKey:@"DealOldPrice"];
    [tempDict12 setValue:@"109" forKey:@"DealLikedCount"];
    [tempDict12 setValue:@"122" forKey:@"DealBoughtCount"];
    [tempDict12 setValue:@"spa_2.jpg" forKey:@"DealImageView"];
    [tempDict12 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict12 setValue:@"limited time" forKey:@"DealTiming"];
    [tempDict12 setValue:@"Luxurious Spa Pampering Package" forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict12];
    
    
    
    NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]init];
    
    
    NSMutableDictionary *tempDict7=[[NSMutableDictionary alloc]init];
    
    [tempDict7 setValue:@"30% off on branded cloths Adeniran Ogunsanya Shopping Mall" forKey:@"DealTitle"];
    [tempDict7 setValue:@"Adeniran Ogunsanya Shopping Mall" forKey:@"DealLocation"];
    [tempDict7 setValue:@"30% off" forKey:@"DealNewPrice"];
    [tempDict7 setValue:@"$2000" forKey:@"DealOldPrice"];
    [tempDict7 setValue:@"10" forKey:@"DealLikedCount"];
    [tempDict7 setValue:@"80" forKey:@"DealBoughtCount"];
    [tempDict7 setValue:@"Adeniran.jpg" forKey:@"DealImageView"];
    [tempDict7 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict7 setValue:@"9 AM - 10 PM" forKey:@"DealTiming"];
    [tempDict7 setValue:@"Presently the largest Shopping Mall in Lagos, it is a huge focal point displaying the very best of merchandise Lagos has to offer," forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict7];
    
    //    NSMutableDictionary *tempDict2=[[NSMutableDictionary alloc]init];
    //
    //    [tempDict2 setValue:@"Enjoy free lunch and dinner at Radisson Blu Anchorage Hotel Lagos" forKey:@"DealTitle"];
    //    [tempDict2 setValue:@"1A Ozumba Mbadiwe Avenue, Victoria Island, Lagos, Nigeria" forKey:@"DealLocation"];
    //    [tempDict2 setValue:@"$17000" forKey:@"DealNewPrice"];
    //    [tempDict2 setValue:@"$18000" forKey:@"DealOldPrice"];
    //    [tempDict2 setValue:@"57" forKey:@"DealLikedCount"];
    //    [tempDict2 setValue:@"2" forKey:@"DealBoughtCount"];
    //    [tempDict2 setValue:@"3.jpg" forKey:@"DealImageView"];
    //    [tempDict2 setValue:@"(+234) (1) 448 5566" forKey:@"DealPhoneNumber"];
    //    [tempDict2 setValue:@"10-15 Jan" forKey:@"DealTiming"];
    //
    //    [tempDict2 setValue:@"Radisson Blu Anchorage Hotel Lagos offers 5-star accommodation in Lagos. It is ideally positioned for guests wishing to visit local attractions" forKey:@"DealDetailInfo"];
    //
    //    [dealArray addObject:tempDict2];
    
    NSMutableDictionary *tempDict4=[[NSMutableDictionary alloc]init];
    
    [tempDict4 setValue:@"25% off on all electronics at Polo Park Mall, Enugu" forKey:@"DealTitle"];
    [tempDict4 setValue:@"Polo Park Mall Polo Park Ground, Old GRA, Abakaliki Road,Enugu North, Enugu." forKey:@"DealLocation"];
    [tempDict4 setValue:@"25% off" forKey:@"DealNewPrice"];
    [tempDict4 setValue:@"$200" forKey:@"DealOldPrice"];
    [tempDict4 setValue:@"100" forKey:@"DealLikedCount"];
    [tempDict4 setValue:@"20" forKey:@"DealBoughtCount"];
    [tempDict4 setValue:@"mall_1.jpg" forKey:@"DealImageView"];
    [tempDict4 setValue:@"+234 (0) 8087185627" forKey:@"DealPhoneNumber"];
    [tempDict4 setValue:@"9 AM - 9 PM" forKey:@"DealTiming"];
    
    [tempDict4 setValue:@"Polo Park Mall is a modern shopping and entertainment mall designed to incorporates informal meeting places, banks, restaurants and other amenities." forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict4];
    
    [tempDict setValue:@"3 days at rate of at Four Points by Sheraton Lagos" forKey:@"DealTitle"];
    [tempDict setValue:@"Plot 9/10, Block 2, Oniru Chieftaincy Estate, Lagos, Nigeria" forKey:@"DealLocation"];
    [tempDict setValue:@"$16112" forKey:@"DealNewPrice"];
    [tempDict setValue:@"$18000" forKey:@"DealOldPrice"];
    [tempDict setValue:@"28" forKey:@"DealLikedCount"];
    [tempDict setValue:@"11" forKey:@"DealBoughtCount"];
    [tempDict setValue:@"1.jpg" forKey:@"DealImageView"];
    [tempDict setValue:@"(+234) (1) 448 9444" forKey:@"DealPhoneNumber"];
    [tempDict setValue:@"10-30 Jan" forKey:@"DealTiming"];
    [tempDict setValue:@"description:Providing a sauna and a swimming pool, Four Points by Sheraton Lagos is a deluxe place to stay in Lagos. It provides a fitness centre, as well as a coffee bar, 24-hour room service and an express check-in and check-out feature." forKey:@"DealDetailInfo"];
    
    [dealArray addObject:tempDict];
    
    //    NSMutableDictionary *tempDict5=[[NSMutableDictionary alloc]init];
    //
    //    [tempDict5 setValue:@"New year offers at The Palms Shopping Mall, Lekki" forKey:@"DealTitle"];
    //    [tempDict5 setValue:@"The Palms Shopping Centre BIS Way, Lekki – Lagos" forKey:@"DealLocation"];
    //    [tempDict5 setValue:@"$699" forKey:@"DealNewPrice"];
    //    [tempDict5 setValue:@"$1000" forKey:@"DealOldPrice"];
    //    [tempDict5 setValue:@"110" forKey:@"DealLikedCount"];
    //    [tempDict5 setValue:@"80" forKey:@"DealBoughtCount"];
    //    [tempDict5 setValue:@"6.jpg" forKey:@"DealImageView"];
    //    [tempDict5 setValue:@"234 1 2714491-3" forKey:@"DealPhoneNumber"];
    //    [tempDict5 setValue:@"10 AM - 10 PM" forKey:@"DealTiming"];
    //
    //    [tempDict5 setValue:@"The Palms Shopping Mall is a shopping and entertainment mall, first and largest centre of its kind in Nigeria that is on par with similar shopping centres anywhere in the world, providing an international standard shopping and cinema experience to Lagos." forKey:@"DealDetailInfo"];
    //    [dealArray addObject:tempDict5];
    
    NSMutableDictionary *tempDict6=[[NSMutableDictionary alloc]init];
    
    [tempDict6 setValue:@"60% off on limited edition of books at Ceddi Plaza, Abuja" forKey:@"DealTitle"];
    [tempDict6 setValue:@"Plot 264, Tafawa Balewa Way,Central District Area, Abuja" forKey:@"DealLocation"];
    [tempDict6 setValue:@"60% off" forKey:@"DealNewPrice"];
    [tempDict6 setValue:@"$2000" forKey:@"DealOldPrice"];
    [tempDict6 setValue:@"100" forKey:@"DealLikedCount"];
    [tempDict6 setValue:@"98" forKey:@"DealBoughtCount"];
    [tempDict6 setValue:@"7.jpg" forKey:@"DealImageView"];
    [tempDict6 setValue:@"+234 (0)9 461 9150" forKey:@"DealPhoneNumber"];
    [tempDict6 setValue:@"9 AM - 10 PM" forKey:@"DealTiming"];
    [tempDict6 setValue:@"Ceddi Plaza is an ultra-modern shopping mall with 55 specialty shops, offices and service providers consisting of movie theaters, a bookstore, champagne lounge etc. Opened officially in November 2005, Ceddi Plaza is celebrated as the premier centre for shopping and entertainment in the city of Abuja." forKey:@"DealDetailInfo"];
    [dealArray addObject:tempDict6];
    
    
    
    //    NSMutableDictionary *tempDict1=[[NSMutableDictionary alloc]init];
    //
    //    [tempDict1 setValue:@"Suprise deals at Southern Sun Ikoyi Hotel" forKey:@"DealTitle"];
    //    [tempDict1 setValue:@"47 Alfred Rewane Road, Lagos, Nigeria" forKey:@"DealLocation"];
    //    [tempDict1 setValue:@"$26620" forKey:@"DealNewPrice"];
    //    [tempDict1 setValue:@"$30000" forKey:@"DealOldPrice"];
    //    [tempDict1 setValue:@"45" forKey:@"DealLikedCount"];
    //    [tempDict1 setValue:@"3" forKey:@"DealBoughtCount"];
    //    [tempDict1 setValue:@"2.jpg" forKey:@"DealImageView"];
    //    [tempDict1 setValue:@"+27 11 461 9744" forKey:@"DealPhoneNumber"];
    //    [tempDict1 setValue:@"10-15 Jan" forKey:@"DealTiming"];
    //
    //    [tempDict1 setValue:@"Southern Sun Ikoyi Hotel offers 4-star accommodation in Lagos. The multiple amenities this modern hotel has to offer include a sauna, meeting rooms and an outdoor pool." forKey:@"DealDetailInfo"];
    //
    //    [dealArray addObject:tempDict1];
    //
    //
    //
    //    NSMutableDictionary *tempDict3=[[NSMutableDictionary alloc]init];
    //
    //    [tempDict3 setValue:@"days 4 night at Ibis Lagos Airport for 30% off" forKey:@"DealTitle"];
    //    [tempDict3 setValue:@"Murtala Mohamed Intl Airport Road Ajao Estate, Lagos, Nigeria" forKey:@"DealLocation"];
    //    [tempDict3 setValue:@"$14000" forKey:@"DealNewPrice"];
    //    [tempDict3 setValue:@"$14500" forKey:@"DealOldPrice"];
    //    [tempDict3 setValue:@"10" forKey:@"DealLikedCount"];
    //    [tempDict3 setValue:@"2" forKey:@"DealBoughtCount"];
    //    [tempDict3 setValue:@"4.jpg" forKey:@"DealImageView"];
    //    [tempDict3 setValue:@"(+234) (1) 448 5566" forKey:@"DealPhoneNumber"];
    //    [tempDict3 setValue:@"10-15 Jan" forKey:@"DealTiming"];
    //
    //    [tempDict3 setValue:@"Ibis Lagos Airport offers 3-star accommodation in Lagos. It also features room service, a wake-up service and conference rooms." forKey:@"DealDetailInfo"];
    //    [dealArray addObject:tempDict3];
    
    
    
    
    
    
    /*
     [tempDict setValue:@"Breakfast, Buffet Lunch & Dinner" forKey:@"DealTitle"];
     [tempDict setValue:@"Fortune Inn Exotica, Hinjewadi, Pune" forKey:@"DealLocation"];
     [tempDict setValue:@"$100" forKey:@"DealNewPrice"];
     [tempDict setValue:@"$150" forKey:@"DealOldPrice"];
     [tempDict setValue:@"55" forKey:@"DealLikedCount"];
     [tempDict setValue:@"10" forKey:@"DealBoughtCount"];
     [tempDict setValue:@"Chinese_food1" forKey:@"DealImageView"];
     [tempDict setValue:@"020-121-3232" forKey:@"DealPhoneNumber"];
     [tempDict setValue:@"6 AM - 12 PM" forKey:@"DealTiming"];
     [tempDict setValue:@"What You Get\nOffer 1 for 1 Person:\n 1 Brewed Drink\n1 Portion of French Fries\n\nOffer 2 for up to 2 Persons (Table Time: 90min):\n 4 Brewed Drinks\nChoice of 1 Veg / Non-Veg Starter\n\nOffer 3 for 1 Person (Table Time: 90min):\nUNLIMITED Domestic Drinks OR Brewed Drinks\n1 Veg / Non-Veg Starter" forKey:@"DealDetailInfo"];
     
     [dealArray addObject:tempDict];
     
     NSMutableDictionary *tempDict1=[[NSMutableDictionary alloc]init];
     
     [tempDict1 setValue:@"Buffet Lunch / Dinner with UNLIMITED Choice of Drinks" forKey:@"DealTitle"];
     [tempDict1 setValue:@"Royal Orchid Central, Kalyani Nagar" forKey:@"DealLocation"];
     [tempDict1 setValue:@"$99" forKey:@"DealNewPrice"];
     [tempDict1 setValue:@"$200" forKey:@"DealOldPrice"];
     [tempDict1 setValue:@"45" forKey:@"DealLikedCount"];
     [tempDict1 setValue:@"3" forKey:@"DealBoughtCount"];
     [tempDict1 setValue:@"Chinese_food2" forKey:@"DealImageView"];
     [tempDict1 setValue:@"455-121-3252" forKey:@"DealPhoneNumber"];
     [tempDict1 setValue:@"1 AM - 10 PM" forKey:@"DealTiming"];
     
     [tempDict1 setValue:@"What You Get\nOffer 1:\nBreakfast Buffet\nOffer 2:\nBreakfast Buffet\nOffer 3:\nBuffet lunch\n2 Mugs of Best Brews Drink / UNLIMITED Soft Drinks\nOffer 4:\nBuffet Dinner\n2 Mugs of Best Brews Drink / UNLIMITED Soft Drinks\nOffer 5:\nBuffet Dinner\n1 Veg and 1 Non-Veg Appetizers\n3 Mugs of Best Brews / 3 Domestic Drinks (Small) / UNLIMITED Aerated Drinks\nOffer 6:\nBest Brews Sunday Brunch\nUNLIMITED Best Brews Drink / Aerated Drinks" forKey:@"DealDetailInfo"];
     
     [dealArray addObject:tempDict1];
     
     NSMutableDictionary *tempDict2=[[NSMutableDictionary alloc]init];
     
     [tempDict2 setValue:@"Full Body Slimming Massage & More" forKey:@"DealTitle"];
     [tempDict2 setValue:@"The Greek Studio, Kalyani Nagar" forKey:@"DealLocation"];
     [tempDict2 setValue:@"$55" forKey:@"DealNewPrice"];
     [tempDict2 setValue:@"$89" forKey:@"DealOldPrice"];
     [tempDict2 setValue:@"150" forKey:@"DealLikedCount"];
     [tempDict2 setValue:@"10" forKey:@"DealBoughtCount"];
     [tempDict2 setValue:@"Chinese_Spa" forKey:@"DealImageView"];
     [tempDict2 setValue:@"866-101-3252" forKey:@"DealPhoneNumber"];
     [tempDict2 setValue:@"10 AM - 10 PM" forKey:@"DealTiming"];
     
     [tempDict2 setValue:@"Highlights\nLocated at South Ex Part 1\nValid for ONLY men\nInclusive of all taxes and service charges\nWhat You Get\nOffer 1 for 1 Person: 1 Full Body Massage (45min) + Welcome Drink + Steam + Shower (10min)\nOffer 2 for 1 Person: 1 Full Body Massage (45min) + Welcome Drink + Head Massage (10min) + Steam + Shower\nOffer 3 for 2 Persons: 1 Full Body Massage (45min) + Welcome Drink + Head Massage (10min) + Foot Reflexology (10min) + Steam + Shower" forKey:@"DealDetailInfo"];
     
     [dealArray addObject:tempDict2];
     
     
     NSMutableDictionary *tempDict3=[[NSMutableDictionary alloc]init];
     
     [tempDict3 setValue:@"Bangkok & Pattaya at Airy Resort" forKey:@"DealTitle"];
     [tempDict3 setValue:@"Bangkok & Pattaya" forKey:@"DealLocation"];
     [tempDict3 setValue:@"$599" forKey:@"DealNewPrice"];
     [tempDict3 setValue:@"$800" forKey:@"DealOldPrice"];
     [tempDict3 setValue:@"35" forKey:@"DealLikedCount"];
     [tempDict3 setValue:@"66" forKey:@"DealBoughtCount"];
     [tempDict3 setValue:@"trip" forKey:@"DealImageView"];
     [tempDict3 setValue:@"675-101-6565" forKey:@"DealPhoneNumber"];
     [tempDict3 setValue:@"10 AM - 12 AM" forKey:@"DealTiming"];
     
     [tempDict3 setValue:@"The Deal\nPack your bags, board the flight and feel the difference as soon as you step on Goan soil! The familiar hum of the coastal area and the smells of the ocean will surely put your mind at ease!\nHotel\nRococco Ashvem resort is a secluded idyll on the unspoilt North coast of Goa. Rococco has 26 new double beach lodges equipped with western facilities, super deluxe suites and deluxe lodges have panoramic views, located directly on the beach. The resort includes an international style restaurant, and sunset lounge bar. It hosts a range of events and parties throughout the season for uber cool clientele. Excellent service is guaranteed with the owners being an ex-pat from the UK and a Goaphile from Kolkata. " forKey:@"DealDetailInfo"];
     [dealArray addObject:tempDict3];
     
     NSMutableDictionary *tempDict4=[[NSMutableDictionary alloc]init];
     
     [tempDict4 setValue:@"Starters & Drinks" forKey:@"DealTitle"];
     [tempDict4 setValue:@"Hotel Aurora Towers, MG Road" forKey:@"DealLocation"];
     [tempDict4 setValue:@"$49" forKey:@"DealNewPrice"];
     [tempDict4 setValue:@"$200" forKey:@"DealOldPrice"];
     [tempDict4 setValue:@"200" forKey:@"DealLikedCount"];
     [tempDict4 setValue:@"100" forKey:@"DealBoughtCount"];
     [tempDict4 setValue:@"Starter" forKey:@"DealImageView"];
     [tempDict4 setValue:@"565-543-9090" forKey:@"DealPhoneNumber"];
     [tempDict4 setValue:@"10 AM - 10 PM" forKey:@"DealTiming"];
     
     [tempDict4 setValue:@"What You Get\nOffer 1 for 1 Person:\n 1 Brewed Drink\n1 Portion of French Fries\n\nOffer 2 for up to 2 Persons (Table Time: 90min):\n 4 Brewed Drinks\nChoice of 1 Veg / Non-Veg Starter\n\nOffer 3 for 1 Person (Table Time: 90min):\nUNLIMITED Domestic Drinks OR Brewed Drinks\n1 Veg / Non-Veg Starter" forKey:@"DealDetailInfo"];
     [dealArray addObject:tempDict4];
     
     NSMutableDictionary *tempDict5=[[NSMutableDictionary alloc]init];
     
     [tempDict5 setValue:@"Bruno Manetti Ankle Boots for Men" forKey:@"DealTitle"];
     [tempDict5 setValue:@"Hotel Aurora Towers, MG Road" forKey:@"DealLocation"];
     [tempDict5 setValue:@"$699" forKey:@"DealNewPrice"];
     [tempDict5 setValue:@"$1000" forKey:@"DealOldPrice"];
     [tempDict5 setValue:@"16" forKey:@"DealLikedCount"];
     [tempDict5 setValue:@"100" forKey:@"DealBoughtCount"];
     [tempDict5 setValue:@"shoes" forKey:@"DealImageView"];
     [tempDict5 setValue:@"343-454-5453" forKey:@"DealPhoneNumber"];
     [tempDict5 setValue:@"10 AM - 10 PM" forKey:@"DealTiming"];
     
     [tempDict5 setValue:@"What You Get\nOffer 1 for 1 Person:\n 1 Brewed Drink\n1 Portion of French Fries\n\nOffer 2 for up to 2 Persons (Table Time: 90min):\n 4 Brewed Drinks\nChoice of 1 Veg / Non-Veg Starter\n\nOffer 3 for 1 Person (Table Time: 90min):\nUNLIMITED Domestic Drinks OR Brewed Drinks\n1 Veg / Non-Veg Starter" forKey:@"DealDetailInfo"];
     [dealArray addObject:tempDict5];
     
     NSMutableDictionary *tempDict6=[[NSMutableDictionary alloc]init];
     
     [tempDict6 setValue:@"Hong kong trip" forKey:@"DealTitle"];
     [tempDict6 setValue:@"Cstay in Pattaya & Bankok at Beverly Plaza" forKey:@"DealLocation"];
     [tempDict6 setValue:@"$1500" forKey:@"DealNewPrice"];
     [tempDict6 setValue:@"$2000" forKey:@"DealOldPrice"];
     [tempDict6 setValue:@"1000" forKey:@"DealLikedCount"];
     [tempDict6 setValue:@"98" forKey:@"DealBoughtCount"];
     [tempDict6 setValue:@"hk" forKey:@"DealImageView"];
     [tempDict6 setValue:@"090-989-4545" forKey:@"DealPhoneNumber"];
     [tempDict6 setValue:@"5 PM - 12 PM" forKey:@"DealTiming"];
     [tempDict6 setValue:@"The Deal\nPack your bags, board the flight and feel the difference as soon as you step on Goan soil! The familiar hum of the coastal area and the smells of the ocean will surely put your mind at ease!\nHotel\nRococco Ashvem resort is a secluded idyll on the unspoilt North coast of Goa. Rococco has 26 new double beach lodges equipped with western facilities, super deluxe suites and deluxe lodges have panoramic views, located directly on the beach. The resort includes an international style restaurant, and sunset lounge bar. It hosts a range of events and parties throughout the season for uber cool clientele. Excellent service is guaranteed with the owners being an ex-pat from the UK and a Goaphile from Kolkata. " forKey:@"DealDetailInfo"];
     [dealArray addObject:tempDict6];
     */
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    // As this block of code is run in a background thread, we need to ensure the GUI
    // update is executed in the main thread
    
    //  [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0.5];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.0f;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return dealArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OfferDealTableViewCell *cell=[self.DealTableView dequeueReusableCellWithIdentifier:@"OfferDealReuseIdentifier"];
    
    if (cell==nil)
    {
        cell=[self.DealTableView dequeueReusableCellWithIdentifier:@"OfferDealReuseIdentifier"];
    }
    
    cell.DealImageView.image=[UIImage imageNamed:[[dealArray objectAtIndex:indexPath.row] valueForKey:@"DealImageView"]];
    cell.DealTitleLabel.text=[[dealArray objectAtIndex:indexPath.row] valueForKey:@"DealTitle"];
    cell.DealLocationLabel.text=[[dealArray objectAtIndex:indexPath.row] valueForKey:@"DealLocation"];
    cell.DealNewPriceLabel.text=[[dealArray objectAtIndex:indexPath.row] valueForKey:@"DealNewPrice"];
    cell.DealLikedCount.text=[[dealArray objectAtIndex:indexPath.row] valueForKey:@"DealLikedCount"];
    cell.DealBoughtCount.text=[[dealArray objectAtIndex:indexPath.row] valueForKey:@"DealBoughtCount"];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString: [[dealArray objectAtIndex:indexPath.row] valueForKey:@"DealOldPrice"]  ];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName
                            value:[NSNumber numberWithInt:2]
                            range:(NSRange){0,[attributeString length]}];
    
    cell.DealOldPrice.attributedText = attributeString;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    OfferDealDetailsViewController *objOfferDealDetailsVC=[storyboard instantiateViewControllerWithIdentifier:@"OfferDealDetailsView"];
    objOfferDealDetailsVC.dealInfoArray=[[NSMutableArray alloc]initWithObjects:[dealArray objectAtIndex:indexPath.row],nil];
    [self.navigationController pushViewController:objOfferDealDetailsVC animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
