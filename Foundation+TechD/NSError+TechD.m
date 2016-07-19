//
//  NSError+TechD.m
//  Foundation+TechD
//
//  Created by Robin Hsu on 2016/7/19.
//  Copyright © 2016年 TechD. All rights reserved.
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


#import "NSError+TechD.h"


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@implementation NSError (TechD)

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
//  --------------------------------
- ( void ) displayAllUserInfoErrors
{
    if ( ( [self userInfo] == nil ) || ( [[self userInfo] count] == 0 ) )
    {
        return;
    }
    
    NSArray                       * allKey;
    id                              valueObject;
    
    allKey                          = [[self userInfo] allKeys];
    if ( ( nil == allKey ) || ( [allKey count] == 0 ) )
    {
        return;
    }
    
    for ( id key in allKey )
    {
        if ( nil == key )
        {
            continue;
        }
        
        valueObject                 = [[self userInfo] objectForKey: key];
        if ( nil == valueObject )
        {
            continue;
        }
        
        //  value is data.
        if ( [valueObject isKindOfClass: [NSData class]] == YES )
        {
            NSString              * errorString;
            
            errorString             = [[NSString alloc] initWithData: valueObject encoding: NSUTF8StringEncoding];
            if ( nil == errorString )
            {
                continue;
            }
            NSLog( @"UserInfo of error: {%@ : %@}", key, errorString );
        }
        //  value is NSError object, too.
        else if ( [valueObject isKindOfClass: [NSError class]] == YES )
        {
            [valueObject            displayAllUserInfoErrors];
        }
        //  value is string or others
        else
        {
            NSLog( @"UserInfo of error: {%@ : %@}", key, valueObject );
        }
    }
}

//  ------------------------------------------------------------------------------------------------



@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

