class Slop < Formula
  desc "Blazing-fast AI-slop firewall — scan + auto-clean git patches"
  homepage "https://github.com/peeramid-labs/slop-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7018ec01858c64f063e7bcf630e8a968cf1234f6e1e712263a0d89fb0f1d85a2"
    end
    on_intel do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "57437648ea577226baf3eaa5b7c5444eaa349b514b8afe9f4acdeef5be17f5fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b779b35cfa25ed537dc0f1b755690f24bb97d8e66a63b93378b8835205dde14f"
    end
    on_intel do
      url "https://github.com/peeramid-labs/slop-cli/releases/download/v#{version}/slop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "417caa2160146671ad28bc5b166c78e99bebb1bebcc5fa807cfa036bd051deea"
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
