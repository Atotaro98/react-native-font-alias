package com.difusionapp.rnfontalias

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap

class RNFontAliasModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String = "RNFontAlias"

  @ReactMethod
  fun register(aliases: ReadableMap) {
    // No-op on Android: fontFamily already resolves by filename
  }
}
