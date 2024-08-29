cask "drawpen" do
  version "0.0.21"
  sha256 "add6fcd60c650d91e0ac5e3d1027d597f4ad246e7f8ebeaf6e6e120f6e1baf61"

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