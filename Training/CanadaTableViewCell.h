//
//  CanadaTableViewCell.h
//  Training
//
//  Created by Shuai Zhang on 6/8/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CanadaItem;
@interface CanadaTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)configureWithCanadaItem:(CanadaItem *)item;

@end
