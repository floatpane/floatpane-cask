cask "floatpane" do
  version "1.4.10"

  on_arm do
    sha256 "72fc57a613a8b9431d97255353beb26ec6d49e1892cfdee2eedd93ddf6711ff9"
    url "https://github.com/floatpane/floatpane/releases/download/v#{version}/floatpane-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ec6a341aa0bc608f4e10582f2c3920962e2bcf61cfadc5cde7722ed29e41c34a"
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
