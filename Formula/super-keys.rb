class SuperKeys < Formula
  desc "Global hotkeys for macOS"
  homepage "https://github.com/nohype-ai/SuperKeys"
  url "https://github.com/nohype-ai/SuperKeys/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0f383a29255de0fff0e0bab0d22eb1c5aa26a6c466f5e73b8992c7673fd9a884"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "23c6344f17a0062960d870b240aa1903c9a63b5720104272c915edb0a535a0d3"
  end

  depends_on macos: :ventura
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--product", "super-keys", "--disable-sandbox"
    bin.install ".build/release/super-keys"
  end

  def caveats
    <<~EOS
      Register the login agent and start it:
        super-keys

      It comes back at login. Log: ~/Library/Logs/super-keys.log
      Stop it until the next login or the next `super-keys`:
        super-keys stop

      macOS asks for Input Monitoring the first time it runs.
    EOS
  end

  test do
    assert_predicate bin/"super-keys", :executable?
  end
end
