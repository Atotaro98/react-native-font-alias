package com.difusionapp.rnfontalias

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = RNFontAliasModule.NAME)
class RNFontAliasModule(reactContext: ReactApplicationContext) :
  NativeRNFontAliasSpec(reactContext) {

  companion object {
    const val NAME = "RNFontAlias"
  }

  override fun getName(): String = NAME

  override fun register(aliases: ReadableMap) {
    // No-op on Android: fontFamily already resolves by filename
  }
}
