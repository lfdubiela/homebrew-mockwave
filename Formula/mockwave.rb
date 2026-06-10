class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.2/mockwave-darwin-arm64"
      sha256 "c9b88985571944e67822fd728f62b1fceee0277adc1db9d381fbca9b1acdc768"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.2/mockwave-darwin-amd64"
      sha256 "3a0045de0d00f5eb864e87b9ad9bd8777460feb97d9c983180ea37ff267d7f70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.2/mockwave-linux-arm64"
      sha256 "2dcfcbfc3b773fef1fa3de8b6df07c637c57d962eae32ae8544175ae628af695"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.2/mockwave-linux-amd64"
      sha256 "5b7c916c1c2a47b74895ce30761380bac99aa5823d0f6e30a7f24604e3a15723"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
