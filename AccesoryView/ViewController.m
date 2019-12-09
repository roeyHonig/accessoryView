//
//  ViewController.m
//  AccesoryView
//
//  Created by Roey Honig on 09/12/2019.
//  Copyright © 2019 Roey Honig. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"hello";
    cell.imageView.image = [UIImage imageNamed:@"icons8-envelope_number_filled"];
    cell.imageView.adjustsImageSizeForAccessibilityContentSizeCategory = YES;
    [cell.contentView setBackgroundColor:[UIColor yellowColor]];
    
    UIView *unreadeIndicator = [[UIView alloc] initWithFrame:CGRectZero];
    [unreadeIndicator setBackgroundColor:[UIColor blueColor]];
    
    unreadeIndicator.translatesAutoresizingMaskIntoConstraints = false;
    [cell.contentView addSubview:unreadeIndicator];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:unreadeIndicator attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:unreadeIndicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    NSLayoutConstraint *ar = [NSLayoutConstraint constraintWithItem:unreadeIndicator attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:unreadeIndicator attribute:NSLayoutAttributeHeight multiplier:2.0 constant:0.0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:unreadeIndicator attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:0.8 constant:0.0];
    
    [cell.contentView addConstraints:@[trailingConstraint, centerConstraint, ar, heightConstraint]];
    [cell.contentView layoutIfNeeded];
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIImage *roey = [UIImage imageNamed:@"icons8-envelope_number_filled"];
    cell.accessoryView = [[UIImageView alloc] initWithImage:roey];
    ((UIImageView *)cell.accessoryView).adjustsImageSizeForAccessibilityContentSizeCategory = YES;
    return cell;
}



@end
