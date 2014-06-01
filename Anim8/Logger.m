//
//  Logger.m
//  Anim8
//
//  Created by Nicolas Ameghino on 6/1/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "Logger.h"

@implementation Logger

static NSRegularExpression *methodRegexp;

+(NSRegularExpression*) methodRegexp {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSError *error = nil;
        methodRegexp = [NSRegularExpression regularExpressionWithPattern:@" ([+-][^+]*) "
                                                                 options:NSRegularExpressionCaseInsensitive
                                                                   error:&error];
        NSAssert(!error, [error localizedDescription]);
    });
    return methodRegexp;
}

+(void) logViewController:(UIViewController *) viewController {
    NSArray *stack = [NSThread callStackSymbols];
    NSAssert([stack count] > 2, @"cannot fetch second frame from top");
    NSString *stackFrame = stack[1];
    
    NSTextCheckingResult *methodRange = [[Logger methodRegexp] firstMatchInString:stackFrame options:0 range:NSMakeRange(0, [stackFrame length])];
    
    NSString *method = [stackFrame substringWithRange:[methodRange rangeAtIndex:1]];
    
    NSLog(@"*** START OF SEGMENT ***");
    NSLog(@"%@", method);
    NSLog(@"%@", [viewController.view debugDescription]);
    NSLog(@"%@", viewController.view.subviews);
    NSLog(@"%@", [viewController.view constraints]);
    NSLog(@"*** END OF SEGMENT ***");
}

@end
