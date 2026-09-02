class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.26.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.1/mockwave-darwin-arm64"
      sha256 "1c72b5159300a306e9826a3b4ff439c5b0ef5d80182794c808f177f9bfce2289"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.1/mockwave-darwin-amd64"
      sha256 "f5c37c0d2b6269636981da5f5c8b2e14175d6e2f03dd16c9f770f8675a1e0e86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.1/mockwave-linux-arm64"
      sha256 "ac66885fe9f1cdbd1fb2a55971942d23b20981b5ff2b5b4273da41c865709f89"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.1/mockwave-linux-amd64"
      sha256 "294a0d9c6678649d1c970968d21d29603ef94d165f53d614576dfce5be2bb4bd"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
