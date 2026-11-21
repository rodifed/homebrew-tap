class Boook < Formula
  desc "Terminal-based book reader"
  homepage "https://github.com/rodifed/boook"
  url "https://github.com/rodifed/boook/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "1cc6fff6b5199f4f148b96cc97c74aa7880268df57255bfbdfe2c093e4229954"
  license "MIT"

  depends_on "xmake" => :build
  depends_on "ftxui"
  depends_on "nlohmann-json"

  def install
    ENV["CC"] = "/usr/bin/clang"
    ENV["CXX"] = "/usr/bin/clang++"

    ENV.prepend_path "PATH", "/usr/bin"

    system "xmake", "f", "-m", "release", "-y"
    system "xmake", "-y"
    system "xmake", "install", "-o", prefix.to_s
  end

  test do
    assert_predicate bin/"boook", :executable?
  end
end
