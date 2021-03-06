//
//  TechDNSStringTest.m
//  Foundation+TechD
//
//  Created by Robin Hsu on 2015/5/9.
//  Copyright (c) 2015年 TechD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <regex.h>

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

- ( void ) test_c_Regular
{
    regex_t                         regular;
    int                             result;
    char                            errorMsg[BUFSIZ];
    
    char                          * regularExpression;
    char                          * testString;
    
    regmatch_t                      matches[1];
    
    
    regularExpression               = "[a-zA-Z]";
    testString                      = "aaaa ; bc; ";
    memset( &errorMsg, 0, sizeof( errorMsg ) );
    result                          = regcomp( &regular, regularExpression, REG_EXTENDED );
    if ( 0 != result )
    {
        regerror( result, &regular, errorMsg, sizeof( errorMsg ) );
        NSLog( @"%s", errorMsg );
        return;
    }
    
    result                          = regexec( &regular, testString, 1, matches, 0 );
    if ( REG_NOMATCH == result )
    {
        regerror( result, &regular, errorMsg, sizeof( errorMsg ) );
        NSLog( @"%s", errorMsg );
        regfree( &regular );
        return;
    }
    
    regfree( &regular );
    
    
}


//  ------------------------------------------------------------------------------------------------
- ( void ) testRegularExpression
{
    NSString                  * testString;
    NSString                  * regularExpress;
    
    testString                  = @"abc";
    //    regularExpress              = @"([^*|:\"<>?]|[ ]|\\w)+@[1-9][0-9]*+[xX]$";
    regularExpress              = @"[^*|:\"<>?]+@[1-9][0-9]*[xX]$";
    
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: @"[a-zA-Z]+"] );
    
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: @"[a-zA-Z]{2}"] );
    
    testString                  = @"abc:";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: @"[a-zA-Z]+"] );
    
    testString                  = @"ab c";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: @"([^*|:\"<>?]|[ ]|\\w)+"] );
    
    testString                  = @"@2x";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @" @2x";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @"?@2x";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @"ic_file_download_grey600_36dp";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @"ic_file_download_grey600_36dp@0X";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @"ic_file_download_grey600_36dp@9X";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
    testString                  = @"ic_file_download_grey600_36dp@88X";
    NSLog( @"regular expression parse result : %d", [testString compareByRegularExpression: regularExpress] );
    
}

////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExObjC1
//{
//    NSPredicate                   * predicate;
//    
//    predicate                       = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", @"([^*|:\"<>?]|[ ]|\\w)+@[1-9][0-9]*[xX]$"];
//    [predicate evaluateWithObject: @"1234567890123456789012345"];
//}
//
////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExObjC2
//{
//    NSPredicate                   * predicate;
//    
//    predicate                       = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", @"([^*|:\"<>?])+@[1-9][0-9]*[xX]$"];
//    [predicate evaluateWithObject: @"1234567890123456789012345"];
//}
//
////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExObjC3
//{
//    NSPredicate                   * predicate;
//    
//    predicate                       = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", @"([^*|:\"<>?])+@[1-9][0-9]*[xX]$"];
//    [predicate evaluateWithObject: @"123456789012345678901234567890"];
//}
//
////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExObjC4
//{
//    NSPredicate                   * predicate;
//    
//    predicate                       = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", @"([^*|:\"<>?])+@[1-9][0-9]*[xX]$"];
//    [predicate evaluateWithObject: @"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"];
//}
//
//
////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExC1
//{
//    NSString                      * parseString;
//    
//    parseString                     = @"1234567890123456789012345";
//    [parseString                    compareByRegularExpression: @"([^*|:\"<>?]|[ ]|\\w)+@[1-9][0-9]*[xX]$"];
//}
//
////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExC2
//{
//    NSString                      * parseString;
//    
//    parseString                     = @"1234567890123456789012345";
//    [parseString                    compareByRegularExpression: @"([^*|:\"<>?])+@[1-9][0-9]*[xX]$"];
//}
//
////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExC3
//{
//    NSString                      * parseString;
//    
//    parseString                     = @"123456789012345678901234567890";
//    [parseString                    compareByRegularExpression: @"([^*|:\"<>?])+@[1-9][0-9]*[xX]$"];
//}
//
////  ------------------------------------------------------------------------------------------------
//- ( void ) testRegExC4
//{
//    NSString                      * parseString;
//    
//    parseString                     = @"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890";
//    [parseString                    compareByRegularExpression: @"([^*|:\"<>?])+@[1-9][0-9]*[xX]$"];
//}
//
////  ------------------------------------------------------------------------------------------------

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

























