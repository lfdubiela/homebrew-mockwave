class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.0/mockwave-darwin-arm64"
      sha256 "9f1d885f18bc8f395f503a3ec5c40abd178b6922c223bad21d3a1701ae13239c"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.0/mockwave-darwin-amd64"
      sha256 "ab3c1cd2c58794ededab75cd919437754337d69689f7d34fe7e519f6c61128ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.0/mockwave-linux-arm64"
      sha256 "cc5d18115067e709ad4a74c17a919f14ae2e6af864e2b023d867fb203aa55cdc"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.0/mockwave-linux-amd64"
      sha256 "b84af0ab315fccfa2383d2a6978d5867f11d6f47bb13a1360205616b53c68e69"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
