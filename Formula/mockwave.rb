class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.18.0/mockwave-darwin-arm64"
      sha256 "d46830d23691d24f4a7003de10efd88e8ad6df50b14e5a7aa201de85727c6c68"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.18.0/mockwave-darwin-amd64"
      sha256 "1ad5cb5f658591053218e911cf95479d5ec443d3c238e23ffaa1dcc55286c6fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.18.0/mockwave-linux-arm64"
      sha256 "77868d4f1aeb85111ad269ed7ad5d6e607449cf1c90c28f188d4be4f4e9710e8"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.18.0/mockwave-linux-amd64"
      sha256 "4c45dc5243eb338eca5186a405bbfbac731d24f3a7a5e35375e7525f17596615"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
