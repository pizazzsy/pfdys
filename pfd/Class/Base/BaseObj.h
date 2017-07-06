//
//  BaseObj.h
//  anbao
//
//  Created by Yang Lin on 05/12/2016.
//  Copyright © 2016 Eemet Information Consulting Co Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObj : NSObject

-(void) reset;
-(void) copyFromJson:(id) json;
-(id) toJson;

-(NSString*) jsonString;
-(NSArray*) arrayFromJsonArray:(id) json;

-(NSString*) timeValueStringFromTimeString:(NSString*)timeStr;
-(NSString*) timeStringFromTimeValueString:(NSString*)valStr;
-(NSString*) dateValueStringFromDateString:(NSString*)dateStr;
-(NSString*) dateStringFromDateValueString:(NSString*)valStr;

@end
