# react-native-font-alias

Register font alias names on iOS so `fontFamily` works with filenames instead of PostScript names.

## The Problem

On iOS, React Native requires fonts to be referenced by their **PostScript name**, which often differs from the filename. For example, you might add `Arima-Regular.ttf` to your project but need to use `Arima-Regular` as the PostScript name — or worse, the PostScript name is something completely different like `ArimaKoshi-Regular`.

Android doesn't have this issue — it resolves fonts by filename directly.

## The Solution

`react-native-font-alias` lets you register alias mappings so you can use consistent, human-friendly font names across both platforms. On iOS, it swizzles `UIFont` to intercept font requests and resolve aliases transparently. On Android, it's a no-op.

## Installation

```bash
npm install react-native-font-alias
# or
yarn add react-native-font-alias
```

For iOS, run pod install:

```bash
cd ios && pod install
```

## Usage

Call `registerFontAliases` **before** any component renders that uses the aliased font names (e.g., at the top of your `index.js` or `App.tsx`):

```typescript
import { registerFontAliases } from 'react-native-font-alias';

registerFontAliases({
  'MyFont-Regular': 'ActualPostScriptName-Regular',
  'MyFont-Bold': 'ActualPostScriptName-Bold',
});
```

Then use the alias names in your styles as usual:

```typescript
const styles = StyleSheet.create({
  text: {
    fontFamily: 'MyFont-Regular',
  },
});
```

### Finding PostScript Names

To find the PostScript name of a font on macOS, open **Font Book**, select the font, and go to **View > Show Font Info**. The PostScript name is listed there.

Alternatively, in Xcode you can log all available fonts:

```objc
for (NSString *family in [UIFont familyNames]) {
  for (NSString *name in [UIFont fontNamesForFamilyName:family]) {
    NSLog(@"%@", name);
  }
}
```

## How It Works

- **iOS**: Uses Objective-C method swizzling on `[UIFont fontWithName:size:]` to intercept font loading. When a font name matches a registered alias, it substitutes the real PostScript name. Thread-safe via `@synchronized`.
- **Android**: No-op. Android already resolves `fontFamily` by filename, so no aliasing is needed.

## Requirements

- React Native >= 0.71
- Supports both the old architecture (Bridge) and the New Architecture (TurboModules)

## License

MIT
