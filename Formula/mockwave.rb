class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.21.0/mockwave-darwin-arm64"
      sha256 "4963b88025d6cc6e0b026bfa9a8a7e814584d180787983c4dfd208543baf8ba7"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.21.0/mockwave-darwin-amd64"
      sha256 "0aa372493bf43217d9f7760bee3b393ef6f26d7679411fc2fe05628a59573b76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.21.0/mockwave-linux-arm64"
      sha256 "77d3541fb35142cab696d95543a2932551d4690c13431d6a50aace9014c28c06"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.21.0/mockwave-linux-amd64"
      sha256 "7c6ae91c998d59f42c3bc66eba0a08f12564ed18f58f9932c1d343c8b40d5de0"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
