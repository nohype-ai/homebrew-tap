class Macstack < Formula
  desc "Tech stack management based on a personal stack definition"
  homepage "https://macstack.dev"
  url "https://github.com/nohype-ai/MacStack/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "c795ec662653a60f07a26b6afc3610050545b978dcba2a4d0ab70dfc7768fea2"
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
