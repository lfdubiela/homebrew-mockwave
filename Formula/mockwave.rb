class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.17.0/mockwave-darwin-arm64"
      sha256 "e087c1ca8cc3c6d12e094a7625e815d9855733db4552f9eeee32124841049432"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.17.0/mockwave-darwin-amd64"
      sha256 "ba4d2946328ec4b74fd48c26b29e9fc8ecc65f63dc3c49d56b462a1e2af81083"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.17.0/mockwave-linux-arm64"
      sha256 "7ece7f9d85044b4bfe61e5d4144af54a23181023c1196154ab7c3d80e9cd64f2"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.17.0/mockwave-linux-amd64"
      sha256 "7c689fe17a52ef19500f37ae1a662b6e68d305bf95ea1e4152b2b2547743c155"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
