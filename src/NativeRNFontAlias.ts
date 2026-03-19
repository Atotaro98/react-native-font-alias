import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  register(aliases: Object): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RNFontAlias');
