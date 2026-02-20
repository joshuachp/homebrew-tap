class Mctl < Formula
  desc "Command-line to manage machines"
  homepage "https://github.com/joshuachp/mctl"
  url "https://github.com/joshuachp/mctl/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "c830deae4a3e5ac9e8c135c4d60a0d75cac5222c172a15f8d087e1a25b8d99c2"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable("#{bin}/mctl", "utils", "completion")
  end

  test do
    system "#{bin}/mctl", "help"
  end
end
