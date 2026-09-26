class SuperKeys < Formula
  desc "Global hotkeys for macOS"
  homepage "https://github.com/nohype-ai/SuperKeys"
  url "https://github.com/nohype-ai/SuperKeys/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "f1b10cbfd8ae400bb628e0f1f5e956cc1c868120433618c798bc3616ab5dc0f3"
  license "MIT"

  bottle do
    root_url "https://raw.githubusercontent.com/nohype-ai/homebrew-tap/main/Bottles"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "e3ce1ac40cf442ae4b437fbdc309486933ec18a67435b0fc23dc7ecf5a505909"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e3ce1ac40cf442ae4b437fbdc309486933ec18a67435b0fc23dc7ecf5a505909"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e3ce1ac40cf442ae4b437fbdc309486933ec18a67435b0fc23dc7ecf5a505909"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e3ce1ac40cf442ae4b437fbdc309486933ec18a67435b0fc23dc7ecf5a505909"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "e3ce1ac40cf442ae4b437fbdc309486933ec18a67435b0fc23dc7ecf5a505909"
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
