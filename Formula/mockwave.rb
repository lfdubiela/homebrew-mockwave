class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.1/mockwave-darwin-arm64"
      sha256 "3e61338cdc17cf082d2dd25292f3685709f90754df36199cef7de838e7b60023"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.1/mockwave-darwin-amd64"
      sha256 "230e538fa29b45b47f7113b5e91e288fb8a0fc7c41d1883a88dbc0a7eb6c37e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.1/mockwave-linux-arm64"
      sha256 "cbcdf00de5d507e444f10007ddeae0ed9e2808416442002c6fb9befb84bfa6d0"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.1/mockwave-linux-amd64"
      sha256 "a121e5edf1b7797c413f0e07096980c8f607c677b1501fdcabdd2ecce257703e"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
