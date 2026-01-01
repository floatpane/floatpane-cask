cask "floatpane" do
  version "1.5.1"
  arch arm: "arm64", intel: "x64"
  
  on_arm do
    sha256 "0d5f35951ca50c5903c68fd035ee5f0c412c3c00e9e858fdc182f2623f59b3da"
    url "https://github.com/floatpane/floatpane/releases/download/v#{version}/floatpane-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "f62e9a028f24849aaa7a9e70a82f58ce200285234e887a33e6648ed780021fed"
    url "https://github.com/floatpane/floatpane/releases/download/v#{version}/floatpane-#{version}-x64.dmg"
  end

  name "floatpane"
  desc "A wallpaper manager app for macOS"
  homepage "https://floatpane.com"

  app "floatpane-#{arch}.app", target: "floatpane.app"

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
