cask "spatialaudio" do
  version "1.0.0"
  sha256 "f756683c93575a3817a1a9b63f19c7c25e2369832493ec4f6dcb1e2dbb91314b"

  url "https://github.com/vladsboev-web/SpatialAudio/releases/download/v#{version}/SpatialAudio.zip"
  name "SpatialAudio"
  desc "System-wide Apple HRTFHQ spatial soundstage and speaker virtualization for any headphones"
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
