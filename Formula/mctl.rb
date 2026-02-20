class Mctl < Formula
  desc "Command-line to manage machines"
  homepage "https://github.com/joshuachp/mctl"
  url "https://github.com/joshuachp/mctl/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "c830deae4a3e5ac9e8c135c4d60a0d75cac5222c172a15f8d087e1a25b8d99c2"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/joshuachp/homebrew-tap/releases/download/mctl-0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e7eee89fe2c9d9fd001435024d9b2e018e7534207c9a4be25e69a2a955aa36d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "713e23e546f518bfeebba37df0204aba3e3ed4fd80fecb915bc4a7b07cbd3f5a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable("#{bin}/mctl", "utils", "completion")
  end

  test do
    system "#{bin}/mctl", "help"
  end
end
