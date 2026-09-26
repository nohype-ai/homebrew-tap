class Macstack < Formula
  desc "macOS stack management based on a personal stack definition"
  homepage "https://macstack.dev"
  url "https://github.com/nohype-ai/MacStack/archive/refs/tags/v0.2.13.tar.gz"
  sha256 "2a1c4147968d4ae7406b16fbf7d799e168a0e7a531f30633abf02421667a8b9d"
  license "MIT"

  depends_on "jq"
  depends_on "node"
  depends_on "check-jsonschema"
  depends_on "super-keys"

  def install
    prefix.install "bin"
    prefix.install "scripts"
  end

  def caveats
    <<~EOS
      To update (set up) your Mac, run:
        mack update

      On first run, mack will ask where your stack definition folder is.
    EOS
  end

  test do
    assert_match "Valid calls are", shell_output("#{bin}/mack help")
  end
end
