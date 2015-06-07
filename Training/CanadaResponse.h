//
//  CanadaResponse.h
//  Training
//
//  Created by Shuai Zhang on 6/7/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface CanadaResponse : BaseResponse

@property(nonatomic, retain) NSString *title;
@property(nonatomic, strong) NSArray *itemList;

@end
