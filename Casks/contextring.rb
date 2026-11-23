cask "contextring" do
  version "1.1.1"
  sha256 "b6962ee05680cb5d20ab85011b64e55508f3a2b3b47f53ca9493f5a81bc6c843"

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
