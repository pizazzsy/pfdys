//
//  UserObj.h
//  anbao
//
//  Created by Yang Lin on 03/12/2016.
//  Copyright © 2016 Eemet Information Consulting Co Ltd. All rights reserved.
//

#import "BaseObj.h"

@interface UserObj : BaseObj

@property (nonatomic,strong) NSString *Id; //用户id
@property (nonatomic,strong) NSString *username;//账号
@property (nonatomic,strong) NSString *phone;//手机号
@property (nonatomic,strong) NSString *name;//姓名
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *rank;
@property (nonatomic,strong) NSString *sex_flag;
@property (nonatomic,strong) NSString *pinyin;
@property (nonatomic,strong) NSString *native_place;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *driver_type;
@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *card_code;
@property (nonatomic,strong) NSString *card_end;
@property (nonatomic,strong) NSString *contract_end;

@property (nonatomic,strong) NSString *is_military;
@property (nonatomic,strong) NSString *avatar;
@property (nonatomic,strong) NSString *memo;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *post_name;


@end
