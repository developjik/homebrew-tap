class Damon < Formula
  desc "Local multi-provider agent daemon"
  homepage "https://github.com/developjik/damon-agent-core"
  version "0.9.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/developjik/damon-agent-core/releases/download/v0.9.0/damon-aarch64-apple-darwin.tar.gz"
      sha256 "af666aa7c642535df8207dd0a2bff6093050cabc206b7e043a0f8b76a5994dff"
    end
    on_intel do
      url "https://github.com/developjik/damon-agent-core/releases/download/v0.9.0/damon-x86_64-apple-darwin.tar.gz"
      sha256 "0db9d343f2572241a95ca5ec1719bb19f7359294269688e40e2937d716d643cd"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/developjik/damon-agent-core/releases/download/v0.9.0/damon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98e00f9e3aa5b65395ecf0e4c04f0e5e5278ed9c41594528db058731965f5916"
    end
    on_arm do
      url "https://github.com/developjik/damon-agent-core/releases/download/v0.9.0/damon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06af951c9104ca02e166bcd995c6e51d2f893b1f4deef720824059a5bf3f0da6"
    end
  end

  def install
    bin.install "damond"
    bin.install "damon"
    bin.install "damon-telegram"
    bin.install "damon-discord"
    bin.install "damon-slack"
    bin.install "damon-relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/damond --version")
    assert_match version.to_s, shell_output("#{bin}/damon --version")
  end
end
