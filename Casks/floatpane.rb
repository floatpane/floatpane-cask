cask "floatpane" do
  version "1.4.11"

  on_arm do
    sha256 "eb9bb0042ecf7a8ab98fcd366024ca8237c5ba770a94e3accb90772eccbaadfd"
    url "https://github.com/floatpane/floatpane/releases/download/v#{version}/floatpane-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "a6bba06c8b4e0bd6cf1d2115a48ea87e65ae909b9240753b7ddbcb5aefa7647e"
    url "https://github.com/floatpane/floatpane/releases/download/v#{version}/floatpane-#{version}-x64.dmg"
  end

  name "floatpane"
  desc "A wallpaper manager app for macOS"
  homepage "https://github.com/floatpane/floatpane"

  app "floatpane.app"

  # This section is optional but recommended for a clean uninstall
  zap trash: [
    "~/Library/Application Support/floatpane",
    "~/Library/Preferences/com.andrinoff.floatpane.plist",
    "~/Library/Saved Application State/com.andrinoff.floatpane.savedState",
  ]
  
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/FloatPane.app"],
                   sudo: false
  end
end
