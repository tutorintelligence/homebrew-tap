cask "tingle" do
  version "0.4.0"
  sha256 "c2000cea19e0c9aba39e7e7e129cc443567dfcc9e1b1a220915c76b7e01e916d"

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
