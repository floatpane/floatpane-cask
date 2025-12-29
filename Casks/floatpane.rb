cask "floatpane" do
  version "1.4.9"

  on_arm do
    sha256 "0fca971860760caebb36ed717028b1c5fc5d65a889823c491a64bb1f3026926d"
    url "https://github.com/floatpane/floatpane/releases/download/v#{version}/floatpane-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "d85aa254f5ca4e59f264d78d374a98a6ba3d919b008774138d21de92ee4de732"
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
