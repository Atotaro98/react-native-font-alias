package com.difusionapp.rnfontalias

import com.facebook.react.TurboReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider

class RNFontAliasPackage : TurboReactPackage() {

  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? {
    return if (name == RNFontAliasModule.NAME) {
      RNFontAliasModule(reactContext)
    } else {
      null
    }
  }

  override fun getReactModuleInfoProvider(): ReactModuleInfoProvider {
    return ReactModuleInfoProvider {
      mapOf(
        RNFontAliasModule.NAME to ReactModuleInfo(
          RNFontAliasModule.NAME,
          RNFontAliasModule.NAME,
          false, // canOverrideExistingModule
          false, // needsEagerInit
          false, // isCxxModule
          true   // isTurboModule
        )
      )
    }
  }
}
