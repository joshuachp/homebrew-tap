class Note < Formula
  desc "Cli tool to take, search and review notes"
  homepage "https://github.com/joshuachp/note"
  url "https://github.com/joshuachp/note/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e5c8dca3b1bc51884f9a5b5644da31d36b75d0cb74d4b3c825b451ec354346b4"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
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
