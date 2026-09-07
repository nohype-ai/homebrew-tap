class OliveMail < Formula
  desc "Email as context for agents"
  homepage "https://github.com/nohype-ai/olive-mail"
  url "https://github.com/nohype-ai/olive-mail/archive/refs/tags/<VERSION-PLACEHOLDER>.tar.gz"
  sha256 "<SHA256-PLACEHOLDER>"
  license "Apache-2.0"

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
