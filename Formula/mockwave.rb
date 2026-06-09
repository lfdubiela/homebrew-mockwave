class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.0/mockwave-darwin-arm64"
      sha256 "6f5dc8c22278cebc2438990ce36ae3f15a88a94a9c56fbecc5d2cf5333a0424b"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.0/mockwave-darwin-amd64"
      sha256 "c931a14dc586ada22028def3cb9fe5f75af7ea5bcab569fd15a75ca096579a87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.0/mockwave-linux-arm64"
      sha256 "b79df92be491a47b8054937038768f7fa6befe45ca016f751e72880da2baeb6e"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.15.0/mockwave-linux-amd64"
      sha256 "fc15fed69a374148dd91c1bb32daaf44f5f4099396b45dac756e13df56571d02"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
