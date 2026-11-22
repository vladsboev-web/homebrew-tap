cask "contextring" do
  version "1.1.0"
  sha256 "65f0303a09c13c93c52b9504571893f661e2befce84ac513a66217b6da5f9773"

  url "https://github.com/vladsboev-web/ContextRing/releases/download/v#{version}/ContextRing-v#{version}-macos-universal.zip"
  name "ContextRing"
  desc "Floating context ring and menu bar token monitor for Google Antigravity 2.0"
  homepage "https://github.com/vladsboev-web/ContextRing"

  depends_on macos: ">= :ventura"

  app "ContextRing.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ContextRing.app"],
                   sudo: false
  end

  uninstall quit:      "com.vladsboev.contextring",
            launchctl: "com.vladsboev.contextring.autolaunch"

  zap trash: [
    "~/Library/LaunchAgents/com.vladsboev.contextring.autolaunch.plist",
    "~/Library/Preferences/com.vladsboev.contextring.plist",
  ]
end
