cask "spatialaudio" do
  version "2.0.0"
  sha256 "a6fa0050caaf8ec3213322ac5b271ed682e173e7133d45de3bbce27d5e27235c"

  url "https://github.com/vladsboev-web/SpatialAudio/releases/download/v#{version}/SpatialAudio.zip"
  name "SpatialAudio"
  desc "System-wide Apple HRTFHQ spatial soundstage and speaker virtualization for any headphones and speakers"
  homepage "https://github.com/vladsboev-web/SpatialAudio"

  depends_on macos: ">= :ventura"
  depends_on cask: "blackhole-2ch"

  app "SpatialAudio.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SpatialAudio.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.spatialaudio.app.plist",
  ]
end
