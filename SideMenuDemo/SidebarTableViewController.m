//
//  SidebarTableViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"
#import "SideMenuTableViewCell.h"
#import "MainViewController.h"
@interface SidebarTableViewController ()

@end
//test master

@implementation SidebarTableViewController {
    NSArray *menuItems;
    NSArray *menuImageItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    menuItems = @[@"title", @"news", @"comments", @"map", @"calendar", @"wishlist", @"bookmark", @"tag"];
    
    /*
      menuItems = @[@"Deals Now",@"Liked Deals",@"Nearby Deals",@"My Deals History",@"Feedback",@"FAQ",@"Logout"];
    menuImageItems = @[@"drawer_icons_buddies",@"me_like",@"drawer_icons_location",@"drawer_icons_events",@"details_info",@"details_what",@"logout"];
    */
    
    menuItems = @[@"Home",@"Liked Deals",@"FAQ",@"Logout"];
    
    menuImageItems = @[@"home",@"liked",@"faq1",@"logout"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuItems.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:@"title"];
   // cell.textLabel.text=@"CushOn! Menus";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        SideMenuTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SideMenuReuseIdentifier"];
        
        if (cell==nil)
        {
            cell=[self.tableView dequeueReusableCellWithIdentifier:@"SideMenuReuseIdentifier"];
        }
        
        cell.imageView.image=[UIImage imageNamed:[menuImageItems objectAtIndex:indexPath.row]];
        cell.menuNameLabel.text=[NSString stringWithFormat:@"%@",[menuItems objectAtIndex:indexPath.row]];
    
    
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//        SWRevealViewController *main = (SWRevealViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
//        [self presentViewController:main animated:YES completion:nil];
        
        SWRevealViewController *revealViewController = self.revealViewController;
        if ( revealViewController )
        {
            [revealViewController revealToggleAnimated:YES];
        }
}


#pragma mark - Navigation

/*// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"showPhoto"])
    {
        UINavigationController *navController = segue.destinationViewController;
        PhotoViewController *photoController = [navController childViewControllers].firstObject;
        NSString *photoFilename = [NSString stringWithFormat:@"%@_photo", [menuItems objectAtIndex:indexPath.row]];
        photoController.photoFilename = photoFilename;
    }
}
*/

@end
