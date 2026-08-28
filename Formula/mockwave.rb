class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.25.0/mockwave-darwin-arm64"
      sha256 "efd0c3b62b59d250bae6d4988adac3eb28f90a250481fb98d65708feaf695ba2"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.25.0/mockwave-darwin-amd64"
      sha256 "085ea0063473d8815d32286618764ee605f2924055cab2ce04a9c80a96e5c475"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.25.0/mockwave-linux-arm64"
      sha256 "1223733f0b85a54f676aecb28f3124ffceecc981aab243e070007771230cb7ac"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.25.0/mockwave-linux-amd64"
      sha256 "60e566defc88bba1356fac4c2a8054bf8086ae91e408cc306dea43ee3fb0a537"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
