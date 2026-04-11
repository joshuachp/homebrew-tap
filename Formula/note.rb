class Note < Formula
  desc "Cli tool to take, search and review notes"
  homepage "https://github.com/joshuachp/note"
  url "https://github.com/joshuachp/note/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ca56c8700aa6bb5c6c9d832cb5a6476ccd1360f180a96dce6e14b75cacc623c1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/joshuachp/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "45b35f97be90dbe1761f7d1077749399f0141564a7bae75ca000af6e4b72a775"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9cd685b890fcf824130e7e6409c2419a28965d110154a5d48f4e9874f97af5bf"
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "zstd" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable("#{bin}/note", "utils", "completion")
  end

  test do
    system "#{bin}/note", "help"
  end
end
