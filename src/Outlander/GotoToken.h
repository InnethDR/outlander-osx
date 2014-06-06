//
//  GotoToken.h
//  Outlander
//
//  Created by Joseph McBride on 6/6/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import "Token.h"

@interface GotoToken : NSObject <Token>

- (instancetype)initWith:(id<Token>)val;

@end