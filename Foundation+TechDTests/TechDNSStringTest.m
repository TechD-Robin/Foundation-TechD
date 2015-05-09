//
//  TechDNSStringTest.m
//  Foundation+TechD
//
//  Created by Robin Hsu on 2015/5/9.
//  Copyright (c) 2015年 TechD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Foundation+TechD.h"

@interface TechDNSStringTest : XCTestCase

@end

@implementation TechDNSStringTest

//  ------------------------------------------------------------------------------------------------
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//  ------------------------------------------------------------------------------------------------
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//  ------------------------------------------------------------------------------------------------
- ( void ) testRegularExpression
{
    NSString                  * testString;
    NSString                  * regularExpress;
    
    testString                  = @"abc";
    regularExpress              = @"([^*|:\"<>?]|[ ]|\\w)+@[1-9][0-9]*+[xX]$";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: @"(\\w)+"] );
    
    testString                  = @"ab c";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: @"(\\w)+"] );
    
    testString                  = @"@2x";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @" @2x";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @"?@2x";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
}

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

























