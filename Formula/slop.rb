class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/sloppoke"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0abff109dd9fc6feeb8031911f996912cb08bbd49e92c861e4c37a103bdcfa53"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0e01e31530d13f8f3889c3e260a4dd2749fa1bd7a366b69d6ca697050e13f836"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48288522bba1c7edf497ffcd106e2ab09fcc2e20884261368b0f123f9882910a"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "818450203f361df178da8ed34e337b17ad7f65374eb7a6e22a52b8763715e452"
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
