//
//  BaseObj.m
//  anbao
//
//  Created by Yang Lin on 05/12/2016.
//  Copyright © 2016 Eemet Information Consulting Co Ltd. All rights reserved.
//

#import "BaseObj.h"

@implementation BaseObj


-(id) init{
    self = [super init];
    if(self){
        [self reset];
    }
    return self;
}

-(void) reset {
    
}

-(void) copyFromJson:(id) json{
    //eg: if([json valueForKey:@"id"])   self.id = [json valueForKey:@"id"];
}

-(id) toJson{
    //eg:  @"id" : _id? _id : @"",
    NSDictionary *data = @{
                           };
    return data;
}

-(NSString*) jsonString{
    NSDictionary *data = [self toJson];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
        return @"{}";
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }
}


-(NSArray*) arrayFromJsonArray:(id) json{
    if(json && [json isKindOfClass:[NSArray class]]){
        NSArray *a = json;
        NSMutableArray *arr = [@[] mutableCopy];
        for(int i=0; i<[a count]; i++){
            id t = [[[self class] alloc] init];
            [t copyFromJson:[a objectAtIndex:i]];
            [arr addObject:t];
        }
        return arr;
    }else{
        return @[];
    }
}

-(NSString*) timeValueStringFromTimeString:(NSString*)timeStr{
    NSArray *arr = [timeStr componentsSeparatedByString:@":"];
    if([arr count] == 2){
        return [NSString stringWithFormat:@"1%@%ld%@%ld",
                [[arr objectAtIndex:0] integerValue] <10? @"0":@"", (long)[[arr objectAtIndex:0] integerValue],
                [[arr objectAtIndex:1] integerValue] <10? @"0":@"", (long)[[arr objectAtIndex:1] integerValue]];
    }else{
        return @"0";
    }
}
-(NSString*) timeStringFromTimeValueString:(NSString*)valStr{
    if([valStr length] != 5 || [valStr integerValue] >12359) return @"";
    long t = [valStr integerValue] - 10000;
    return [NSString stringWithFormat:@"%@%ld:%@%ld", t/100 < 10? @"0":@"", (long)(t/100), t % 100<10? @"0":@"", (long)(t%100)];
}
-(NSString*) dateValueStringFromDateString:(NSString*)dateStr{
    NSString    *expression = @"^[12][0-9]{3}-[0-9]{2}-[0-9]{2}$";
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    BOOL match = [predicate evaluateWithObject:dateStr];
    if(match){
        return [dateStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }else{
        return @"0";
    }
}
-(NSString*) dateStringFromDateValueString:(NSString*)valStr{
    NSString    *expression = @"^[12][0-9]{7}$";
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    BOOL match = [predicate evaluateWithObject:valStr];
    if(match){
        return [NSString stringWithFormat:@"%@-%@-%@", [valStr substringWithRange:NSMakeRange(0, 4)],
                [valStr substringWithRange:NSMakeRange(4, 2)],[valStr substringWithRange:NSMakeRange(6, 2)]];
    }else{
        return @"0";
    }
}

@end
