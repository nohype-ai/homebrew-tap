class SuperKeys < Formula
  desc "Global hotkeys for macOS"
  homepage "https://github.com/nohype-ai/SuperKeys"
  url "https://github.com/nohype-ai/SuperKeys/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bce1bbd31ad36213958c6e35198b986321e6896bfd239136f217a282e5298c57"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "3464e3cd915ca8b45433cbb8e5573c2846d065d25775ca1b578909dd4bd20c45"
  end

  depends_on macos: :ventura
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--product", "super-keys", "--disable-sandbox"
    bin.install ".build/release/super-keys"
  end

  def caveats
    <<~EOS
      super-keys registers global hotkeys and stays running until quit.

      macOS asks for Input Monitoring the first time it runs.
      A LaunchAgent can start it at login; the binary is:
        #{opt_bin}/super-keys
    EOS
  end

  test do
    assert_predicate bin/"super-keys", :executable?
  end
end
