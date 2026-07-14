cask "tingle" do
  version "0.14.2"
  sha256 "ba17e7e09eb6ecc5bc88b430b0d42f7f7f2d8b6643b682f8db7a76f24e35fd73"

  url "https://github.com/tutorintelligence/tingle/releases/download/v#{version}/tingle-#{version}.zip"
  name "tingle"
  desc "Menu bar companion for the Teenage Engineering EP-2350 'ting': dictation, macros, ultrasonic button detection"
  homepage "https://github.com/tutorintelligence/tingle"

  auto_updates true # Sparkle owns updates; brew is install/discovery

  depends_on macos: :ventura

  app "tingle.app"

  uninstall quit: "com.tutorintelligence.tingle"

  zap trash: [
    "~/Library/Application Support/tingle",
  ]
end
