//
//  SpelltimeNotifier.h
//  Outlander
//
//  Created by Joseph McBride on 5/17/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import "ReactiveCocoa.h"

@interface SpelltimeNotifier : NSObject

@property (nonatomic, strong) RACReplaySubject *notification;
- (void)set:(NSString *)value;

@end
