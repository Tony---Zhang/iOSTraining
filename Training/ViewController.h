//
//  ViewController.h
//  Training
//
//  Created by Shuai Zhang on 6/7/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanadaResponse.h"
#import "CanadaTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;

@property (nonatomic, retain) CanadaResponse *response;

- (id)parseJSONDataFromResource:(NSString *)fileName withType:(NSString *) type;

@end

