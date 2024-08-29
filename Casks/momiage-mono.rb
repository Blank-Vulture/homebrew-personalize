cask "momiage-mono" do
  version "1.1-20221222"
  sha256 "e501b56de82d52c627b039baed7aee175e953acfa4dd7ff8d79a245a02e3316d"

  url "https://github.com/kb10uy/MomiageMono/releases/download/v#{version}/MomiageMono-#{version}.zip"
  name "Momiage Mono"
  desc "Coding font for sidelock lovers"
  homepage "https://github.com/kb10uy/MomiageMono"

  font "MomiageMono-Regular-NerdFont.ttf"
  font "MomiageMono-Regular.ttf"
  font "MomiageMono-Bold-NerdFont.ttf"
  font "MomiageMono-Bold.ttf"
  font "MomiageMono-Italic-NerdFont.ttf"
  font "MomiageMono-Italic.ttf"
  font "MomiageMono-BoldItalic-NerdFont.ttf"
  font "MomiageMono-BoldItalic.ttf"

  livecheck do
    url "https://github.com/kb10uy/MomiageMono/releases/latest"
    strategy :page_match
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)*-\d+)}i)
  end
end