//
//  DetailViewController.m
//  Training
//
//  Created by Shuai Zhang on 7/1/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize item;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Detail: %@, %@", item.title, item.description);
    [self.navigationItem setTitle:item.title];
    [self.detailPhoto sd_setImageWithURL:[NSURL URLWithString:item.imageUrl]
                       placeholderImage:[UIImage imageNamed:@"ic_abc_menu_favourite_saved.png"]];
    self.detailContent.text = item.description;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
