cask "floatpane" do
  version "1.5.0"
  arch arm: "arm64", intel: "x64"
  
  on_arm do
    sha256 "602d826aae6fe0aa0b3f30d4d0eec2f5f203f3c5f7ed38a155eddd4a34b61c1c"
    url "https://github.com/floatpane/floatpane/releases/download/v#{version}/floatpane-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "eb695b6970629af38dc173e0d52922cf578b109dd4fa7bff43f20fd92c2b0e22"
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
