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
