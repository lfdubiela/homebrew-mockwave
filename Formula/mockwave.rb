class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.5.0/mockwave-darwin-arm64"
      sha256 "d42181a93f3ab4b56febdcb3c7863cf3c44851dcc6eee50a8b2bb941ecb81820"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.5.0/mockwave-darwin-amd64"
      sha256 "e12c12c078bccd501a63d87cb37e3a9b7b0541b2f59c55999ad383a9c3f473ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.5.0/mockwave-linux-arm64"
      sha256 "f5be5b624718a75ecd64034db6d49d8342b496e9214bd1f6cfd0ab68186e461b"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.5.0/mockwave-linux-amd64"
      sha256 "47ffda7714672f99d6676428558d4e9401a5e684d471e5fb1d6366f7b4dd74e3"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
