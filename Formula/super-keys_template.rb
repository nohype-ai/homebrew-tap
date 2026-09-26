class SuperKeys < Formula
  desc "Global hotkeys for macOS"
  homepage "https://github.com/nohype-ai/SuperKeys"
  url "https://github.com/nohype-ai/SuperKeys/archive/refs/tags/<VERSION-PLACEHOLDER>.tar.gz"
  sha256 "<SHA256-PLACEHOLDER>"
  license "MIT"

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
