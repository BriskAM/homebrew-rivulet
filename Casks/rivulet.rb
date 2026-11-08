cask "rivulet" do
  version "0.2.0"
  sha256 "79ac719685454445ab1759e131fcf3c28523a50347851415d56ef1348a1058f8"

  url "https://github.com/BriskAM/Rivulet/releases/download/v#{version}/Rivulet-#{version}.zip"
  name "Rivulet"
  desc "Lightweight native front end for the aria2 download daemon"
  homepage "https://github.com/BriskAM/Rivulet"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Rivulet.app"

  # The app is ad-hoc signed and not notarized, so clear the quarantine flag to let it open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Rivulet.app"]
  end

  zap trash: [
    "~/Library/Application Support/Rivulet",
    "~/Library/Preferences/app.rivulet.mac.plist",
  ]
end
