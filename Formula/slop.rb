class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/sloppoke"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4a9a67698b0d97204697857d6ddb3145fd0c1c639593e1be0eb475c0e0d08b07"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e90b12b623e421ac1e211578c17a5ac1e9057bf6f13a2d4951b08e2e16221832"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "149b7414ab7c017e2644e3313b00b7966b14cfd6153e83fc85ce7db379f97613"
    end
    on_intel do
      url "https://github.com/peeramid-labs/sloppoke/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f82244eda4619d8b7d29cb5480912aad4e9636e4580abbc0ff5c5fdbc76b7089"
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
