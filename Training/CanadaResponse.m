//
//  CanadaResponse.m
//  Training
//
//  Created by Shuai Zhang on 6/7/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "CanadaResponse.h"
#import "CanadaItem.h"

NSString *const RESPONSE_KEY_TITLE = @"title";
NSString *const RESPONSE_KEY_LIST  = @"rows";

@implementation CanadaResponse

@synthesize title;
@synthesize itemList;

- (id)init
{
    if (self = [super init]) {
        title = [[NSString alloc] init];
        itemList = [[NSArray alloc] init];
    }
    return self;
}

-(BaseResponse *)getDataFormJSON:(id)jsonObject {
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *jsonDictionary = (NSDictionary *) jsonObject;
        self.title = (NSString *)[jsonDictionary objectForKey:RESPONSE_KEY_TITLE];
        NSArray *list = [jsonDictionary objectForKey:RESPONSE_KEY_LIST];
        NSMutableArray *itemObjectList = [[NSMutableArray alloc] initWithCapacity:[list count]];
        for (int i = 0; i < [list count]; i++) {
            id itemObject = [list objectAtIndex:i];
            CanadaItem *canadaItem = (CanadaItem *)[[CanadaItem alloc] getDataFormJSON:itemObject];
            if (canadaItem.title != nil) {
                [itemObjectList addObject:canadaItem];
            }
        }
        self.itemList = [itemObjectList copy];
        return self;
    }
    return nil;
}

@end
