class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.20.0/mockwave-darwin-arm64"
      sha256 "a12e3504f9691dc9647aa785e134b5b443f475073a009f1b247bb5be9abf581f"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.20.0/mockwave-darwin-amd64"
      sha256 "f32d8494d567a6d264ba25c7114f13d6920ca89c7d60f6f0e91560bd2450a803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.20.0/mockwave-linux-arm64"
      sha256 "0cf63f118c7499ee562f46ef0baa4534ce68a3d775ce084aef0e0ef5f9ce78a8"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.20.0/mockwave-linux-amd64"
      sha256 "72b065adf9d51e3f3530da8b9f1e4981186cc78897f0848f72c7e40c61219d68"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
