class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.0/mockwave-darwin-arm64"
      sha256 "afafb1d3ac194160b881c3df9294d72bd5e4939878347e7831c4e9283eacbc28"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.0/mockwave-darwin-amd64"
      sha256 "06694e60d7358bdf006064f0dce865613a1b295052613f41c9d3389adf1f78ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.0/mockwave-linux-arm64"
      sha256 "6b71b0af1addcda65992134f1dc3ef04e9ed451a880128ffc23da0b1bec72883"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.26.0/mockwave-linux-amd64"
      sha256 "2ca9de76be27d3675909d61de5d7245bf0c23b0c199019b6b0d7e56688ebde05"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
