class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.10.0/mockwave-darwin-arm64"
      sha256 "2b373a6ec4b879d8fcbe7bbd0abb96958f37260c9a316069fe91e8488f4b7c18"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.10.0/mockwave-darwin-amd64"
      sha256 "e44310f866e15c2e6b98f6f8752c896dc7f5dfcfb93f032ff9cb4c00011d943e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.10.0/mockwave-linux-arm64"
      sha256 "c6df1c427f3ffab717186d34efb21e74d19d932e1c89659b1a642aa16a3e95b9"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.10.0/mockwave-linux-amd64"
      sha256 "0479e18cba2d3e1ba1efb6b8d99ba61c0e5f84e7c999912eabe8cc07b3195a7d"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
