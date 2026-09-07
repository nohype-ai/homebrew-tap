class OliveMail < Formula
  desc "Email as context for agents"
  homepage "https://github.com/nohype-ai/olive-mail"
  url "https://github.com/nohype-ai/olive-mail/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8c7e8545eedb0563c015b93bddfe69aad6334728c2a2911aa50b2766c2292ac8"
  license "Apache-2.0"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 arm64_golden_gate: "49ec8602f2ac793111e08dd49134fe77196b075214771153026fa2b78be73b11"
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
