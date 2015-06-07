//
//  CanadaItem.h
//  Training
//
//  Created by Shuai Zhang on 6/7/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface CanadaItem : BaseResponse

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) NSString *imageUrl;

@end