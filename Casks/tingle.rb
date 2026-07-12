cask "tingle" do
  version "0.5.1"
  sha256 "9f042d213114e90da5893136c6470746ea72ed0ada46946e9431700bfec83ae0"

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
