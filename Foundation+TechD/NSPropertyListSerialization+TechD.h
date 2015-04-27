//
//  NSPropertyListSerialization+TechD.h
//  Foundation+TechD
//
//  Created by Robin Hsu on 2015/4/27.
//  Copyright (c) 2015年 TechD. All rights reserved.
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


#import <Foundation/Foundation.h>

@interface NSPropertyListSerialization (TechD)

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( BOOL ) savePropertyList:(NSDictionary *)container toFileAtPath:(NSString *)filepath error:(NSError * __autoreleasing *)error;

//  ------------------------------------------------------------------------------------------------
+ ( NSMutableDictionary * ) loadPropertyList:(NSString *)filepath encoding:(NSStringEncoding)encode error:(NSError * __autoreleasing *)error;


//  ------------------------------------------------------------------------------------------------


@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
