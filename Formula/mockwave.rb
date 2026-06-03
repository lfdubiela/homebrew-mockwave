class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.8.0/mockwave-darwin-arm64"
      sha256 "719a6ca85ad87a5696b9455caba9ecde347013aa89903eba5c5df8318463f690"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.8.0/mockwave-darwin-amd64"
      sha256 "e2fd4c0ddec5f7cf9a51ef203deab4b30ffb473698ab0ebae8b3dc622ea63a17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.8.0/mockwave-linux-arm64"
      sha256 "9306f0d470cf032f2eef6dd763b5f92667c47017d204bc7ef5147425487b9b67"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.8.0/mockwave-linux-amd64"
      sha256 "f2a04a0fc6ccc33d640738927e255586f7893cb264d9476a8776ef446019486b"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
