class OliveMail < Formula
  desc "Email as context for agents"
  homepage "https://github.com/nohype-ai/olive-mail"
  url "https://github.com/nohype-ai/olive-mail/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "01ae9d0cf2d7c2f28e189f1fd5b8beb7f32aa56026740636a864f335d7b81394"
  license "Apache-2.0"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 arm64_golden_gate: "0cd668dcc7b8ca7ab717d1d75aa471f93199997edc59e15bc3e83ab6e9f938f2"
  end

  depends_on "himalaya"

  # Build-time only. macOS bottles skip this; Linux compiles from source.
  on_macos do
    depends_on xcode: :build
  end

  on_linux do
    depends_on "swift" => :build
  end

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
