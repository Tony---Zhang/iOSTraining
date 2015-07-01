//
//  ViewController.m
//  Training
//
//  Created by Shuai Zhang on 6/7/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "ViewController.h"
#import "CanadaItem.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IS_IOS8_OR_ABOVE                            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))

static NSString *CellIdentifier = @"CanadaTableViewCell";

@interface ViewController ()

@end

@implementation ViewController

@synthesize response;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    [self.navigationBar setTitle:self.response.title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Count: %lu", [self.response.itemList count]);
    return [self.response.itemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CanadaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CanadaTableViewCell *cell = (CanadaTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Description: %@", cell.descriptionLabel.text);
    CGFloat defaultHeight = cell.contentView.frame.size.height; 
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    height = height > defaultHeight ? height : defaultHeight;
    NSLog(@"height :%f index:%ld", height, indexPath.row);
    return height;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - CanadaTableViewCell
- (CanadaTableViewCell *)canadaTableViewCell {
    return [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CanadaTableViewCell class])];
}


#pragma mark - Configure cell data
- (void)configureCell:(CanadaTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CanadaItem *canadaItem = (CanadaItem *)self.response.itemList[indexPath.row];
    cell.titleLabel.text = canadaItem.title;
    [cell.photoImage sd_setImageWithURL:[NSURL URLWithString:canadaItem.imageUrl]
                      placeholderImage:[UIImage imageNamed:@"ic_abc_menu_favourite_saved.png"]];
    cell.descriptionLabel.text = canadaItem.description;
    [cell.descriptionLabel sizeToFit];
}

#pragma mark - Data loader

- (void)loadData {
    id jsonObject = [self parseJSONDataFromResource:@"facts" withType:@"json"];
    self.response = (CanadaResponse *)[[CanadaResponse alloc] getDataFormJSON:jsonObject];
}

- (id)parseJSONDataFromResource:(NSString *)fileName withType:(NSString *) type {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    id jsonObject = nil;
    if (filePath) {
        NSError *error;
        NSData *myData = [NSData dataWithContentsOfFile:filePath];
        jsonObject = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:&error];
    }
    return jsonObject;
}

@end
