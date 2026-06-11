class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/sloppoke"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cd5353e4edf789cd08d963d1305ab47502c1ddf7fccb582f546f5e363c996b4c"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cca13ec2f378734dd3003c6c5b1152b3294560e949eb61642a3117f3f4611308"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8edc90b4ebd591101fb15624a7c46affccfe31d62a1af1ab2872590cdba5b26"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8eebeddf35f3df05c084cf358841fc540069b260a2a5cb945cdea205fc0cb5d"
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
