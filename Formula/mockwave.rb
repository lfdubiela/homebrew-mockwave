class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.11.0/mockwave-darwin-arm64"
      sha256 "517f99d60894090416ec160fa95a28b1d09ee6644c7bd70da0e27b5ce57fdf9a"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.11.0/mockwave-darwin-amd64"
      sha256 "44d9627440d1a65299ae438dcd36c93112f048e402b6d1877d794300d52012d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.11.0/mockwave-linux-arm64"
      sha256 "e4828ae450fd411f1899946be13778fe3ebe491b53ce0a8e4791c461584d79f9"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.11.0/mockwave-linux-amd64"
      sha256 "e7f7f40de37020496f174b6166f8f87aa08aaa57e7fcf6fc393ddd41ff0c6d7e"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
