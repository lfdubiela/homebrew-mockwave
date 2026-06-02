class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.7.0/mockwave-darwin-arm64"
      sha256 "6bfeabc1a387bb990d01bdd6c3e95d06ab06fcb3e4ade9b9a22379bfdc444371"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.7.0/mockwave-darwin-amd64"
      sha256 "6b612757b5c455997c0480036ea33a7ad42c8cc9d8c8c12246252ae10703faf7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.7.0/mockwave-linux-arm64"
      sha256 "6cbc46dd153127e66839489cb0a7a8cefad638fea8712570e1c31964adb9b46e"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.7.0/mockwave-linux-amd64"
      sha256 "22957fbdbcbb846f4d48374d1e4583ab17c31d11a448ec65a77d919ab5549109"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
