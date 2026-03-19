#import "RNFontAlias.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

static NSMutableDictionary<NSString *, NSString *> *_aliasDictionary = nil;
static dispatch_once_t _onceToken;
static BOOL _swizzled = NO;
static IMP _originalFontWithNameSize = NULL;

static UIFont *_swizzled_fontWithName_size(id self, SEL _cmd, NSString *name, CGFloat size) {
  NSString *resolvedName = _aliasDictionary[name];
  if (resolvedName) {
    name = resolvedName;
  }
  return ((UIFont *(*)(id, SEL, NSString *, CGFloat))_originalFontWithNameSize)(self, _cmd, name, size);
}

@implementation RNFontAlias

RCT_EXPORT_MODULE();

+ (BOOL)requiresMainQueueSetup {
  return NO;
}

+ (void)initialize {
  dispatch_once(&_onceToken, ^{
    _aliasDictionary = [NSMutableDictionary new];
  });
}

- (void)applyAliases:(NSDictionary *)aliases {
  @synchronized(_aliasDictionary) {
    [_aliasDictionary addEntriesFromDictionary:aliases];
  }

  if (!_swizzled) {
    _swizzled = YES;
    Method originalMethod = class_getClassMethod([UIFont class], @selector(fontWithName:size:));
    _originalFontWithNameSize = method_getImplementation(originalMethod);
    method_setImplementation(originalMethod, (IMP)_swizzled_fontWithName_size);
  }
}

#ifdef RCT_NEW_ARCH_ENABLED

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeRNFontAliasSpecJSI>(params);
}

- (void)register:(NSDictionary *)aliases {
  [self applyAliases:aliases];
}

#else

RCT_EXPORT_METHOD(register:(NSDictionary *)aliases) {
  [self applyAliases:aliases];
}

#endif

@end
