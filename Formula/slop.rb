class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/slop-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7adb5b7328e28250e53c63aa9f505dccbd2acc5110c290eed1a83a56042d082a"
    end
    on_intel do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d75218d119298012f06487b958f0c5c40a62f9cd96047003c08286824c35924a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef5d1ee1a6a48c505148fcd738e93cbe5b57100360264dfac73fd73cf364241a"
    end
    on_intel do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5aabf7bb78cb1bdfe340affc1381a56c7769b4bccd080ac15b1424c93c99568c"
    end
  end

  head do
    url "https://github.com/peeramid-labs/slop-cli.git", branch: "main"
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
