class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.12.0/mockwave-darwin-arm64"
      sha256 "7151f10ec496769305cef265b589796472b249a964765e9f3046522a9773d6dd"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.12.0/mockwave-darwin-amd64"
      sha256 "63771bdc46b34b4e5cb6b75fc5f9b1f07fec8527b670c7b9f32f6f2eddba8496"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.12.0/mockwave-linux-arm64"
      sha256 "1815c3b2215a8744d0b2602fb697e2e9b82eabe84f2e25db8be120de5c48d1d5"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.12.0/mockwave-linux-amd64"
      sha256 "6385067f0b86bcddcfba0a0da68f83718ac5ccfa8ed56bca5b2e39e3a38ebc2a"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
