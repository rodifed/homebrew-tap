class Boook < Formula
  desc "Terminal-based book reader"
  homepage "https://github.com/rodifed/boook"
  url "https://github.com/rodifed/boook/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "YOUR_EXISTING_SHA256"
  license "MIT"

  depends_on "xmake" => :build
  depends_on "ftxui"
  depends_on "nlohmann-json"

  def install
    ENV["CC"] = ENV.cc
    ENV["CXX"] = ENV.cxx

    system "xmake", "f", "-m", "release", "-y"
    system "xmake", "-y"
    system "xmake", "install", "-o", prefix.to_s
  end

  test do
    assert_predicate bin/"boook", :executable?
  end
end
