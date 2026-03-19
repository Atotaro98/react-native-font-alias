import { Platform } from 'react-native';

import NativeModule from './NativeRNFontAlias';

/**
 * Register font alias mappings.
 * On iOS, swizzles UIFont so alias names resolve to real PostScript names.
 * On Android, this is a no-op (Android already uses filenames).
 *
 * Call this BEFORE any component renders that uses these font names.
 *
 * @example
 * registerFontAliases({
 *   'Font-Regular': 'Arima-Regular',
 *   'Font-Bold': 'Arima-Bold',
 * });
 */
export function registerFontAliases(aliases: Record<string, string>): void {
  if (Platform.OS === 'ios') {
    NativeModule.register(aliases);
  }
}
