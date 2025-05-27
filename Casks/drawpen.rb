cask "drawpen" do
  version "0.0.22"
  sha256 "bbe9add0b9500c9a4cb99135781105ed23e303ba1594ca8520c48d0596a27f3d"

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