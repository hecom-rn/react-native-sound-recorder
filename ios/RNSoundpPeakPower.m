//
//  RNSoundpPeakPower.m
//  RNSoundRecorder
//
//  Created by LJJ on 2020/11/24.
//

#define EVENT_NAME @"RNSoundRecorder_PeakPower"
#import "RNSoundpPeakPower.h"

@implementation RNSoundpPeakPower

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
  return @[EVENT_NAME];
}

-(void)startObserving {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sendEaseMobEvent:)
                                                 name:EVENT_NAME
                                               object:nil];
}

-(void)stopObserving {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)sendEaseMobEvent:(NSNotification *)notification {
    [self sendEventWithName:EVENT_NAME body:notification.object];
}

+ (void)sendPeakPower:(CGFloat)peak {
    NSMutableDictionary *body = [NSMutableDictionary dictionary];
    [body setObject:@(peak) forKey:@"peak"];
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_NAME object:body];
}

@end
