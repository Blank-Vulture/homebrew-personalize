cask "drawpen" do
  version "0.0.23"
  sha256 "b40dd4c547fc2fbc9da9b3c06cbfe651d760dc9c62e7a39e171a9e997131402a"

  url "https://github.com/DmytroVasin/DrawPen/releases/download/v#{version}/DrawPen-#{version}-arm64.dmg",
      verified: "github.com/DmytroVasin/DrawPen/"
  name "DrawPen"
  desc "Vector-styled drawing and annotation tool"
  homepage "https://github.com/DmytroVasin/DrawPen"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "DrawPen.app"

  zap trash: "~/Library/Application Support/DrawPen"
end