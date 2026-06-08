class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/sloppoke"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e1e840292387ddbaf7b0951d4acee5a21387f44984b33bdb71621fc2c69055e0"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "582e5ae3a3ac7727e95e770d85daa8a0a4afe14520353208d626739feac2938d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3d1144a4f183cf2a9806b83787e7200e9d785d8d755b3a59e195ae09e458ec9"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46ee273949e65f790fc14cfcdaefed124b05e0beac48eb6dfa07da1a1fec1891"
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
