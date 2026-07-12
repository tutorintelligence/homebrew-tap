cask "tingle" do
  version "0.14.0"
  sha256 "7a2e1c7d3445c06cbd51f2fcaa4f1ce1385d9b672bf05f5a594759646ee46bc9"

  url "https://github.com/tutorintelligence/tingle/releases/download/v#{version}/tingle-#{version}.zip"
  name "tingle"
  desc "Menu bar companion for the Teenage Engineering EP-2350 'ting': dictation, macros, ultrasonic button detection"
  homepage "https://github.com/tutorintelligence/tingle"

  auto_updates true # Sparkle owns updates; brew is install/discovery

  depends_on macos: :ventura

  app "tingle.app"

  # Unsigned until Apple Developer enrollment completes: strip the
  # quarantine flag so Gatekeeper doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/tingle.app"],
                   must_succeed: false
  end

  uninstall quit: "com.tutorintelligence.tingle"

  zap trash: [
    "~/Library/Application Support/tingle",
  ]
end
