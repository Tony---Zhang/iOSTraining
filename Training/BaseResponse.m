//
//  BaseResponse.m
//  Training
//
//  Created by Shuai Zhang on 6/7/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "BaseResponse.h"

@implementation BaseResponse

- (BaseResponse *)getDataFormJSON: (id) jsonObject {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end