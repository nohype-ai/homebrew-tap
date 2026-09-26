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
      Register the login agent and start it:
        super-keys

      It comes back at login. Log: ~/Library/Logs/super-keys.log
      Stop it until the next login or the next `super-keys`:
        super-keys stop

      macOS asks for Input Monitoring the first time it runs.
      Bindings: ~/.config/super-keys/bindings.toml
      The first run creates that file. Add binds, then run `super-keys` again.
    EOS
  end

  test do
    assert_predicate bin/"super-keys", :executable?
  end
end
