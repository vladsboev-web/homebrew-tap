cask "turbocontrol" do
  version "1.0.0"
  sha256 "4e37a61964df9e6e5b6133b3d14cfc76f129a3bfecf347c5c6a7621411eed6aa"

  url "https://github.com/vladsboev-web/TurboControl/releases/download/v#{version}/TurboControl.zip"
  name "TurboControl"
  desc "Menu bar app for Intel Macs: toggle Turbo Boost, manage fan speeds, and monitor thermals"
  homepage "https://github.com/vladsboev-web/TurboControl"

  depends_on macos: :monterey
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
