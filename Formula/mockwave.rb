class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.23.0/mockwave-darwin-arm64"
      sha256 "890b13739fdb521cfa5326eb6d0ac6309d8828b44afa60c369fe05eb1c34a6a3"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.23.0/mockwave-darwin-amd64"
      sha256 "3e68e517d018b5c604d794a038f05655183fba6a92adb1ed085bbb338dd39aa7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.23.0/mockwave-linux-arm64"
      sha256 "0710b805d37c943e18d453f607df2ccc49391669ac00a9cf50c34f30ef2d5305"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.23.0/mockwave-linux-amd64"
      sha256 "6bb284f35cfb14c1ea6d4fc08ab222376d1e6b2ee5d2f64bab11be9952b2c59a"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
