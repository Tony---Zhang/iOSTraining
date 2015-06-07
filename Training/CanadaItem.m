//
//  CanadaItem.m
//  Training
//
//  Created by Shuai Zhang on 6/7/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "CanadaItem.h"

NSString *const RESPONSE_KEY_ITEM_TITLE =                    @"title";
NSString *const RESPONSE_KEY_ITEM_DESCRIPTION =              @"description";
NSString *const RESPONSE_KEY_ITEM_IMAGE_HREF =               @"imageHref";

@implementation CanadaItem

@synthesize title;
@synthesize description;
@synthesize imageUrl;

- (BaseResponse *)getDataFormJSON:(id)jsonObject {
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *jsonDictionary = (NSDictionary *) jsonObject;
        
        NSLog(@"Dersialized JSON data: %@", jsonDictionary);
        id titleId = [jsonDictionary objectForKey:RESPONSE_KEY_ITEM_TITLE];
        if (titleId != [NSNull null]) {
            self.title = (NSString *)titleId;
        } else {
            self.title = nil;
        }
        id descriptionId = [jsonDictionary objectForKey:RESPONSE_KEY_ITEM_DESCRIPTION];
        if (descriptionId != [NSNull null]) {
            self.description = (NSString *)descriptionId;
        } else {
            self.description = @"";
        }
        id imageUrlId = [jsonDictionary objectForKey:RESPONSE_KEY_ITEM_IMAGE_HREF];
        if (imageUrlId != [NSNull null]) {
            self.imageUrl = (NSString *)imageUrlId;
        } else {
            self.imageUrl = nil;
        }
        return self;
    }
    return nil;
}

@end



