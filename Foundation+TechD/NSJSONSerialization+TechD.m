//
//  NSJSONSerialization+TechD.m
//  Foundation+TechD
//
//  Created by Robin Hsu on 2015/3/20.
//  Copyright (c) 2015年 TechD. All rights reserved.
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


#import "NSJSONSerialization+TechD.h"

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@implementation NSJSONSerialization (TechD)

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
//  --------------------------------
+ ( BOOL ) saveJSONContainer:(NSDictionary *)container toFileAtPath:(NSString *)filepath error:(NSError * __autoreleasing *)error
{
    NSParameterAssert( nil != container );
    NSParameterAssert( nil != filepath );
    
    NSError                       * saveError;
    NSFileManager                 * manager;
    NSOutputStream                * outputStream;
    
    saveError                       = nil;
    outputStream                    = nil;
    manager                         = [NSFileManager defaultManager];

    //  pre-create subpath on here, because NSJSONSerialization's writeJSONObject: toStream: ..., save the JSON file without create subpath of the file path.
    if ( [manager fileExistsAtPath: [filepath stringByDeletingLastPathComponent]] == NO )
    {
        saveError                   = nil;
        if ( [manager createDirectoryAtPath: [filepath stringByDeletingLastPathComponent] withIntermediateDirectories: YES attributes: nil error: &saveError] == NO )
        {
            if ( nil != error )
            {
                *error              = saveError;
            }
            return NO;
        }
    }
    
    //  first, remove the exist file.
    saveError                       = nil;
    if ( [manager fileExistsAtPath: filepath] == YES )
    {
        if ( [manager removeItemAtPath: filepath error: &saveError] == NO )
        {
            NSLog( @"delete file error : %@", saveError );
        }
    }
    
    //  second, save container to file.
    outputStream                    = [NSOutputStream outputStreamToFileAtPath: filepath append: NO];
    NSParameterAssert( nil != outputStream );
    
    saveError                       = nil;
    [outputStream                   open];
    [NSJSONSerialization            writeJSONObject: container toStream: outputStream options: 0 error: &saveError];
    if ( nil != saveError )
    {
        if ( nil != error )
        {
            *error                  = saveError;
        }
        [outputStream               close];
        return NO;
    }
    
    //  finish.
    [outputStream                   close];
    if ( nil != error )
    {
        *error                      = NULL;
    }
    return YES;
}


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

