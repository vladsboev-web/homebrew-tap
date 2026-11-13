cask "turbocontrol" do
  version "1.1.0"
  sha256 "385d793810619a6ff70b34365b5600bba106121606f26f6244b07420283f3758"

  url "https://github.com/vladsboev-web/TurboControl/releases/download/v#{version}/TurboControl.zip"
  name "TurboControl"
  desc "Menu bar app for macOS: toggle Turbo Boost on Intel, manage fan speeds, power, and monitor thermals"
  homepage "https://github.com/vladsboev-web/TurboControl"

  depends_on macos: :monterey

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
              "/Library/PrivilegedHelperTools/turbocontrol-helper",
              "/Library/PrivilegedHelperTools/turbocontrol-fan",
              "/usr/local/bin/turbocontrol-helper",
              "/usr/local/bin/turbocontrol-fan",
              "/etc/sudoers.d/turbocontrol",
              "/Library/Extensions/DisableTurboBoost.kext",
            ]

  zap trash: [
    "~/Library/Preferences/com.turbocontrol.app.plist",
  ]
end
