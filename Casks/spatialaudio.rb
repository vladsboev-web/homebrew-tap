cask "spatialaudio" do
  version "2.0.1"
  sha256 "09740f03f2ae341b6bd19f1d37ff6e59e26153c27b07f06cd77add1c2d72c514"

  url "https://github.com/vladsboev-web/SpatialAudio/releases/download/v#{version}/SpatialAudio.zip"
  name "SpatialAudio"
  desc "System-wide Apple HRTFHQ spatial soundstage and speaker virtualization for any headphones and speakers"
  homepage "https://github.com/vladsboev-web/SpatialAudio"

  depends_on macos: :ventura
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
