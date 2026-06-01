class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.6.0/mockwave-darwin-arm64"
      sha256 "f48a81303a1bd3e9f8004280334daed4ecc84382af0804e86f4bf32eeb633490"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.6.0/mockwave-darwin-amd64"
      sha256 "45271bc329bac006ba38e38b4ea894685739eb8a684812fd994b2aa8651a3061"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.6.0/mockwave-linux-arm64"
      sha256 "c93572725a6b028689fdba837060a8428aaf6ab8ea161e7a6e74daa4e001e5f1"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.6.0/mockwave-linux-amd64"
      sha256 "dc0a4243cf57820f4028380c8f69d7549d1033e0fc5257a713e3c07fb050427f"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
