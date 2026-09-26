class SuperKeys < Formula
  desc "Global hotkeys for macOS"
  homepage "https://github.com/nohype-ai/SuperKeys"
  url "https://github.com/nohype-ai/SuperKeys/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "5489fc2624432126c12954b1b6bbf5b247ab173b4c90e02c522b27250b835add"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "e33a12b6c29eedd96e2c03736170f89805453f241ef766446e15d217f920e52d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e33a12b6c29eedd96e2c03736170f89805453f241ef766446e15d217f920e52d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e33a12b6c29eedd96e2c03736170f89805453f241ef766446e15d217f920e52d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e33a12b6c29eedd96e2c03736170f89805453f241ef766446e15d217f920e52d"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "e33a12b6c29eedd96e2c03736170f89805453f241ef766446e15d217f920e52d"
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
      Bindings: ~/.config/super-keys/bindings.toml
      The first run creates that file. Add binds, then run `super-keys` again.
    EOS
  end

  test do
    assert_predicate bin/"super-keys", :executable?
  end
end
