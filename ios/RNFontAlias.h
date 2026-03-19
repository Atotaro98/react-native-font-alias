#ifdef RCT_NEW_ARCH_ENABLED

#import <RNFontAliasSpec/RNFontAliasSpec.h>
@interface RNFontAlias : NSObject <NativeRNFontAliasSpec>

#else

#import <React/RCTBridgeModule.h>
@interface RNFontAlias : NSObject <RCTBridgeModule>

#endif

@end
