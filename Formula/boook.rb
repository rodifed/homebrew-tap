class Boook < Formula
  desc "Terminal-based book reader"
  homepage "https://github.com/rodifed/boook"
  url "https://github.com/rodifed/boook/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "bf2dabe506428a3931ce1fe4d5ef29d1455b07e1248fea898bf5b8c07e0d74b0"
  license "GPL-3.0"

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
