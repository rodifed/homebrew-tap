class Boook < Formula
  desc "Terminal-based book reader"
  homepage "https://github.com/rodifed/boook"
  url "https://github.com/rodifed/boook/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "f1bed733f7d2692f1d59d66cb2024084e65b4cd95857c8205c1be6bfc7d5f00e"
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
