//
//  TechDNSPropertyListSerializationTest.m
//  Foundation+TechD
//
//  Created by Robin Hsu on 2015/4/27.
//  Copyright (c) 2015年 TechD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Foundation+TechD.h"

@interface TechDNSPropertyListSerializationTest : XCTestCase
{
    NSDictionary                  * dataContainer;
}

@end

@implementation TechDNSPropertyListSerializationTest

//  ------------------------------------------------------------------------------------------------
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSArray                       * names;
    
    names                           = @[ @"TTJ", @"ender", @"cap", @"hsu", @"Draw" ];
    dataContainer                   = @{ @"name": names, @"group": @"TechD", @"member": @(5) };
}

//  ------------------------------------------------------------------------------------------------
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    dataContainer                   = nil;
    [super tearDown];
}

//  ------------------------------------------------------------------------------------------------
- ( void ) testSaveDataToPropertyList
{
    XCTAssertNotNil( dataContainer, @"container should not be nil" );
    
    NSString                      * searchPath;
    NSString                      * filename;
    NSError                       * error;
    BOOL                            result;

    error                           = nil;
    result                          = NO;
    searchPath                      = [NSTemporaryDirectory() stringByStandardizingPath];
    filename                        = [searchPath stringByAppendingPathComponent: @"techd.plist"];
    XCTAssertNotNil( filename , @"filename should not be nil");
    
    result                          = [NSPropertyListSerialization savePropertyList: dataContainer toFileAtPath: filename error: &error];
    XCTAssertNil( error, @"error object should be nil" );
    XCTAssertTrue( result, @"method's result should be true." );
    
}

//  ------------------------------------------------------------------------------------------------
- ( void ) testLoadDataFromPropertyList
{
    [self                           testSaveDataToPropertyList];
    
    NSDictionary                  * container;
    NSString                      * searchPath;
    NSString                      * filename;
    NSError                       * error;
    BOOL                            result;
    
    error                           = nil;
    result                          = NO;
    searchPath                      = [NSTemporaryDirectory() stringByStandardizingPath];
    filename                        = [searchPath stringByAppendingPathComponent: @"techd.plist"];
    XCTAssertNotNil( filename , @"filename should not be nil");

    container                       = nil;
    container                       = [NSPropertyListSerialization loadPropertyList: filename encoding: NSUTF8StringEncoding error: &error];
    XCTAssertNil( error, @"error object should be nil" );
    XCTAssertNotNil( container, @"container object should not be nil" );
}

//  ------------------------------------------------------------------------------------------------


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
