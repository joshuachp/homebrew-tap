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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b3b36ddacbb3be3966788b66775312bc369e1010945ace21a614ebf54017082f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ca922913a19c883d7226d7728af22d98f3e80850ff0a773ff4a81a483dc3e590"
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
