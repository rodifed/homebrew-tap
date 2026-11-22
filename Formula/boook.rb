class Boook < Formula
  desc "Terminal-based book reader"
  homepage "https://github.com/rodifed/boook"
  url "https://github.com/rodifed/boook/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "54e94844f8d5764c2b8385f0c251e0da5f84ec32d35defc99c69762a538bc5ef"
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
