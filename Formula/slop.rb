class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/slop-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a62cd9aedfb04e28e69045c23f6cee7f7c20af535bc9eb11d1be4aa3ac14fe17"
    end
    on_intel do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "75a0c91e1e31d01c0e8fd7517c50d9a46e2d45dbee254b69ae76dc01a86ae99f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de4860a44523dd2ad17774af9c3b33d1a7a57945adb86498f9a58118db687b34"
    end
    on_intel do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e0dbfecec4e6b93cf78072fd2661617cc4d9e0dfcff5a9aa765b991c41b6106"
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
