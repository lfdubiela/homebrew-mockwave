class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.24.0/mockwave-darwin-arm64"
      sha256 "8248193194b4745105c8a01bef860da6580af5c942c65f9036733c13da1ee6da"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.24.0/mockwave-darwin-amd64"
      sha256 "a5f8a025b14194bba8c23b272d0244d95b3a9e32d92726e340a504cb8c6a38e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.24.0/mockwave-linux-arm64"
      sha256 "06f1b0450871bc199f6aa1783c2cae6967157e95cae4edae0b4f7b87eac1770d"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.24.0/mockwave-linux-amd64"
      sha256 "cc14416ae9ebcea137834f4347639223b944a56161297746b9e049b64e46ed6a"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
