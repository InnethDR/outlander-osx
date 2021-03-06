//
//  NSColor+Categories.h
//  Outlander
//
//  Created by Joseph McBride on 1/26/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (Categories)

+ (NSColor *)colorWithHexString:(NSString *)str;
+ (NSColor *)colorWithHex:(UInt32)col;

@end
