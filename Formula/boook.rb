class Boook < Formula
  desc "Terminal-based book reader"
  homepage "https://github.com/rodifed/boook"
  url "https://github.com/rodifed/boook/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f352625be51d179741cec1f83e0c8e62596310c58ef04c1db450ebdba1ad3e05"
  license "MIT"

  depends_on "xmake" => :build

  def install
    system "xmake", "f", "-m", "release", "-y"
    system "xmake", "-y"
    system "xmake", "install", "-o", prefix.to_s
  end

  test do
    assert_predicate bin/"boook", :executable?
  end
end
