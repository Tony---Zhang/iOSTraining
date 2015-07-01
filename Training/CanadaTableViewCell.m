//
//  CanadaTableViewCell.m
//  Training
//
//  Created by Shuai Zhang on 6/8/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "CanadaTableViewCell.h"
#import "CanadaItem.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation CanadaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithCanadaItem:(CanadaItem *)item {
    self.titleLabel.text = item.title;
    [self.photoImage sd_setImageWithURL:[NSURL URLWithString:item.imageUrl]
                       placeholderImage:[UIImage imageNamed:@"ic_abc_menu_favourite_saved.png"]];
    self.descriptionLabel.text = item.description;
    [self.descriptionLabel sizeToFit];
}

@end
