class SuperKeys < Formula
  desc "Global hotkeys for macOS"
  homepage "https://github.com/nohype-ai/SuperKeys"
  url "https://github.com/nohype-ai/SuperKeys/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "845b258e86f70b37572e7f1c51e937ae6bd0bc7777b40b006c6d5c22ce81b944"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "ce7622578d41413fc70b27b321428df0634362cd4057999d385c2caa10a956ec"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ce7622578d41413fc70b27b321428df0634362cd4057999d385c2caa10a956ec"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ce7622578d41413fc70b27b321428df0634362cd4057999d385c2caa10a956ec"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ce7622578d41413fc70b27b321428df0634362cd4057999d385c2caa10a956ec"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "ce7622578d41413fc70b27b321428df0634362cd4057999d385c2caa10a956ec"
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
