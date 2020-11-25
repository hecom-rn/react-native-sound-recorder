//
//  RNSoundpPeakPower.h
//  RNSoundRecorder
//
//  Created by LJJ on 2020/11/24.
//

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif
#if __has_include(<React/RCTEventEmitter.h>)
#import <React/RCTEventEmitter.h>
#else
#import "RCTEventEmitter.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RNSoundpPeakPower : RCTEventEmitter

+ (void)sendPeakPower:(CGFloat)peak;

@end

NS_ASSUME_NONNULL_END
