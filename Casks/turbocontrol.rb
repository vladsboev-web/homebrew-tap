cask "turbocontrol" do
  version "1.0.0"
  sha256 "d60c19bb80664ccf25b3c178220d16008f10a59b7669e5ab5cd757857d00ce52"

  url "https://github.com/vladsboev-web/TurboControl/releases/download/v#{version}/TurboControl.zip"
  name "TurboControl"
  desc "Menu bar app for Intel Macs: toggle Turbo Boost, manage fan speeds, and monitor thermals"
  homepage "https://github.com/vladsboev-web/TurboControl"

  depends_on macos: ">= :monterey"
  depends_on arch: :x86_64

  app "TurboControl.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/TurboControl.app"],
                   sudo: false
    system_command "#{appdir}/TurboControl.app/Contents/Resources/setup_helper.sh",
                   sudo: true
  end

  uninstall quit: "com.turbocontrol.app",
            kext: "com.rugarciap.DisableTurboBoost",
            delete: [
              "/usr/local/bin/turbocontrol-helper",
              "/usr/local/bin/turbocontrol-fan",
              "/etc/sudoers.d/turbocontrol",
              "/Library/Extensions/DisableTurboBoost.kext",
            ]

  zap trash: [
    "~/Library/Preferences/com.turbocontrol.app.plist",
  ]
end
