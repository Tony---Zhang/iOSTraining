//
//  DetailViewController.h
//  Training
//
//  Created by Shuai Zhang on 7/1/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanadaItem.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *detailPhoto;
@property (weak, nonatomic) IBOutlet UILabel *detailContent;

@property(retain, nonatomic) CanadaItem *item;

@end
