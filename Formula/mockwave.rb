class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.22.0/mockwave-darwin-arm64"
      sha256 "11732040ec443770f151122105d8a51b2f040622a9dde299ce0f43f88809609b"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.22.0/mockwave-darwin-amd64"
      sha256 "80bad8359a3bc46eda157c95b6292961e13d939ea92d8b5a8c166ffe7733c09f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.22.0/mockwave-linux-arm64"
      sha256 "1b9db0b4be201ea50edfe4418e26f0ba4953caf025d8b5b6c0ffdba14c85366a"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.22.0/mockwave-linux-amd64"
      sha256 "a1afbf7fb082c21a49cf9a1273ab257adfe43f42682a5e40f1d0155c0932d8b6"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
