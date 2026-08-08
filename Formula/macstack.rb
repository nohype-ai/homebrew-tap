class Macstack < Formula
  desc "Tech stack management based on a personal stack definition"
  homepage "https://macstack.dev"
  url "https://github.com/nohype-ai/MacStack/archive/refs/tags/v0.2.11.tar.gz"
  sha256 "f69a5dc9ca61ef84d39e2f96e1569e37192effd9a51fb8848499c4d146820246"
  license "MIT"

  depends_on "jq"
  depends_on "node"
  depends_on "check-jsonschema"

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
