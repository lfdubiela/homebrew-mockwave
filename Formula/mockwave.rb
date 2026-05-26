class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.4.0/mockwave-darwin-arm64"
      sha256 "0d8c307897360ef5cdd02b8fad1a5db397d001d6ef14a4409267c175957f72aa"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.4.0/mockwave-darwin-amd64"
      sha256 "6aaf354bae169e8f573825f13447c91998e6b7792011f4f40c57a89cf6467467"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.4.0/mockwave-linux-arm64"
      sha256 "28a955e928e6fd3ac8006d15e85ada089ef07b1729db75efb457d690f4a4aa42"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.4.0/mockwave-linux-amd64"
      sha256 "0668d3de52f5bb6519029b28ab59b0d32d6957147462e0f8e6e0c9ff0333959d"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
