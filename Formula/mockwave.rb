class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.19.0/mockwave-darwin-arm64"
      sha256 "96883f3bb235565c80da3c73fb5e6e67f6482e2c65298ba0e88770c8e6181d6a"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.19.0/mockwave-darwin-amd64"
      sha256 "02657747921e486a0be35d9728d82b12fd7bd018a13b39a529c55e73cc0322c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.19.0/mockwave-linux-arm64"
      sha256 "81c7cecf8ba621d2f623ac520e00e0ddd6072ef51d71d4873e8c7720312dbc5a"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.19.0/mockwave-linux-amd64"
      sha256 "3c62eb3f4fdf0c6198f0bce1f86ad8aa856772b25e3f828955e7b26f4a014dc7"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
