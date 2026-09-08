class OliveMail < Formula
  desc "Email as context for agents"
  homepage "https://github.com/nohype-ai/olive-mail"
  url "https://github.com/nohype-ai/olive-mail/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3bc191a7f62c09757d4426fbf8a432a4e05fab2925dae3411c8674e74b79c3ac"
  license "Apache-2.0"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 arm64_golden_gate: "f34e5c1c0dc7c3b3a020a9cabbea544cd08b2a7c7bdaae89d4c9f8505b997f72"
  end

  depends_on "himalaya"
  uses_from_macos "swift" => :build

  def install
    args = ["-c", "release", "--product", "olive-mail", "--disable-sandbox"]
    args << "--static-swift-stdlib" if OS.linux?
    system "swift", "build", *args
    bin.install ".build/release/olive-mail"
  end

  def caveats
    <<~EOS
      Himalaya is the IMAP backend and is installed as a dependency.

      Add an email account:
        olive-mail account add you@example.com --imap imaps://imap.example.com:993
    EOS
  end

  test do
    assert_match "account", shell_output("#{bin}/olive-mail --help")
  end
end
