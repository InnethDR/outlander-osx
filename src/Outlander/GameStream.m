//
//  GameStream.m
//  Outlander
//
//  Created by Joseph McBride on 1/25/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import "GameStream.h"
#import "GameServer.h"
#import "GameParser.h"
#import "GameConnection.h"
#import "TextTag.h"
#import "ReactiveCocoa.h"

@interface GameStream () {
    RACSignal *_connection;
    GameContext *_gameContext;
}

@end

@implementation GameStream

-(id) initWithContext:(GameContext *)context {
    self = [super init];
    if(self == nil) return nil;
    
    _gameContext = context;
    
    _gameServer = [[GameServer alloc] initWithContext:context];
    _gameParser = [[GameParser alloc] init];
    
    _globalVars = _gameParser.globalVars;
    _vitals = _gameParser.vitals;
    _room = _gameParser.room;
    _exp = _gameParser.exp;
    _thoughts = _gameParser.thoughts;
    _arrivals = _gameParser.arrivals;
    _deaths = _gameParser.deaths;
    _familiar = _gameParser.familiar;
    _log = _gameParser.log;
    _roundtime = _gameParser.roundtime;
    
    [_globalVars setCacheObject:@">" forKey:@"prompt"];
    [_globalVars setCacheObject:@"Empty" forKey:@"lefthand"];
    [_globalVars setCacheObject:@"Empty" forKey:@"righthand"];
    [_globalVars setCacheObject:@"None" forKey:@"spell"];
    
    _connected = [RACReplaySubject subject];
    _subject = [RACReplaySubject subject];
    
    [_gameServer.connected subscribeNext:^(id x) {
        [_connected sendNext:x];
    }];
    
    return self;
}

-(void) publish:(id)item {
    [_subject sendNext:item];
}

-(void) complete {
    [_gameServer disconnect];
    [_subject sendCompleted];
}

-(void) error:(NSError *)error {
    [_subject sendError:error];
}

-(void) sendCommand:(NSString *)command {
    [_gameServer sendCommand:command];
}

-(RACSignal *) connect:(GameConnection *)connection {
    
    RACSignal *signal = [_gameServer connect:connection.key
                                      toHost:connection.host
                                      onPort:connection.port];
    
    [signal subscribeCompleted:^{
        [_subject sendCompleted];
    }];
    
    [signal subscribeNext:^(NSString *result) {
        [_gameParser parse:result then:^(NSArray *result) {
            [_subject sendNext:result];
        }];
    }];
    
    return _subject;
}

@end
