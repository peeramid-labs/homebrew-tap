class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/sloppoke"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d34c58e6822ea126887b268371cf45d0952977bbc4baf12078ff72090ccb60d9"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d99226b5c1ba26c63c942cbd776a65729a48b92d9e9e58a92c8576561023c4d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a76d086759174ff333ce32ae161dd1b1c16549ed8e76da7c52d9b502bf2674d0"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "948c042a0e9844f4f113137c220296f368c95c7f68c00e86813420abe11cb172"
    end
  end

  head do
    url "https://github.com/peeramid-labs/sloppoke.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args(path: "crates/sloppoke-cli")
    else
      bin.install "slop"
    end
  end

  test do
    assert_match "slop", shell_output("#{bin}/slop --version")
  end
end
