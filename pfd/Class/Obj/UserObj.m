//
//  UserObj.m
//  anbao
//
//  Created by Yang Lin on 03/12/2016.
//  Copyright © 2016 Eemet Information Consulting Co Ltd. All rights reserved.
//

#import "UserObj.h"

@implementation UserObj


-(void) reset {
    _Id = @"0";
    _username = @"";
    _phone = @"";
    _name = @"";
    _type = @"";
    _rank = @"";
    _sex_flag = @"";
    _pinyin = @"";
    _native_place = @"";
    _address = @"";
    _driver_type = @"";
    _pid = @"";
    _card_code = @"";
    _card_end = @"";
    _contract_end = @"";

    _is_military = @"0";
    _avatar = @"";
    _memo = @"";
    _status = @"0";
    _post_name = @"";
}

-(void) copyFromJson:(id) json{
    if([json valueForKey:@"id"]) _Id = [json valueForKey:@"id"];
    if([json valueForKey:@"username"]) _username = [json valueForKey:@"username"];
    if([json valueForKey:@"phone"]) _phone = [json valueForKey:@"phone"];
    if([json valueForKey:@"name"]) _name = [json valueForKey:@"name"];
    if([json valueForKey:@"type"]) _type = [json valueForKey:@"type"];
    if([json valueForKey:@"rank"]) _rank = [json valueForKey:@"rank"];
    if([json valueForKey:@"sex_flag"]) _sex_flag = [json valueForKey:@"sex_flag"];
    if([json valueForKey:@"pinyin"]) _pinyin = [json valueForKey:@"pinyin"];
    if([json valueForKey:@"native_place"]) _native_place = [json valueForKey:@"native_place"];
    if([json valueForKey:@"address"]) _address = [json valueForKey:@"address"];
    if([json valueForKey:@"driver_type"]) _driver_type = [json valueForKey:@"driver_type"];
    if([json valueForKey:@"pid"]) _pid = [json valueForKey:@"pid"];
    if([json valueForKey:@"card_code"]) _card_code = [json valueForKey:@"card_code"];
    if([json valueForKey:@"card_end"]) _card_end = [json valueForKey:@"card_end"];
    if([json valueForKey:@"contract_end"]) _contract_end = [json valueForKey:@"contract_end"];
    if([json valueForKey:@"is_military"]) _is_military = [json valueForKey:@"is_military"];
    if([json valueForKey:@"avatar"]) _avatar = [json valueForKey:@"avatar"];
    if([json valueForKey:@"memo"]) _memo = [json valueForKey:@"memo"];
    if([json valueForKey:@"status"]) _status = [json valueForKey:@"status"];
    if([json valueForKey:@"post_name"]) _post_name = [json valueForKey:@"post_name"];
}


-(id) toJson{
    NSDictionary *data = @{
                           @"id" : _Id,
                           @"username" : _username,
                           @"phone" : _phone,
                           @"name" : _name,
                           @"type" : _type,
                           @"rank" : _rank,
                           @"sex_flag" : _sex_flag,
                           @"pinyin" : _pinyin,
                           @"native_place" : _native_place,
                           @"address" : _address,
                           @"driver_type" : _driver_type,
                           @"pid" : _pid,
                           @"card_code" : _card_code,
                           @"card_end" : _card_end,
                           @"contract_end" : _contract_end,
                           
                           @"is_military" : _is_military,
                           @"avatar" : _avatar,
                           @"memo" : _memo,
                           @"status" : _status,
                           @"post_name" : _post_name
                           };
    return data;
}


+(NSArray*) arrayFromJsonArray:(id) json{
    if([json isKindOfClass:[NSArray class]]){
        NSArray *a = json;
        NSMutableArray *arr = [@[] mutableCopy];
        for(int i=0; i<[a count]; i++){
            UserObj *t = [[UserObj alloc] init];
            [t copyFromJson:[a objectAtIndex:i]];
            [arr addObject:t];
        }
        return arr;
    }else{
        return @[];
    }
}

@end
