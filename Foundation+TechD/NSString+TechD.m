//
//  NSString+TechD.m
//  Foundation+TechD
//
//  Created by Robin Hsu on 2015/3/18.
//  Copyright (c) 2015年 TechD. All rights reserved.
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


#import "NSString+TechD.h"

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@implementation NSString (TechD)

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
- ( BOOL ) isNumeric
{
    NSNumberFormatter             * numberFormatter;
    
    //numberFormatter                 = [[NSNumberFormatter alloc] init];
    numberFormatter                 = [NSNumberFormatter new];
    if ( nil == numberFormatter )
    {
        return NO;
    }
    
    if ( [numberFormatter numberFromString: self] == nil )
    {
        return NO;
    }
    return YES;
}
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

