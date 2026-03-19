require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-font-alias"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = "https://github.com/Atotaro98/react-native-font-alias"
  s.license      = "MIT"
  s.author       = "Alejo Totaro Barbieri"

  s.platforms    = { :ios => min_ios_version_supported }
  s.source       = { :git => ".", :tag => s.version }
  s.source_files = "ios/**/*.{h,m,mm}"

  install_modules_dependencies(s)
end
