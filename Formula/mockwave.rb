class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.13.0/mockwave-darwin-arm64"
      sha256 "204bded5b0d8628705412e5ce3f33d984bebc3f077d6df3b712d4d7294a57cb9"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.13.0/mockwave-darwin-amd64"
      sha256 "3df043f5b05d5475674f22b5df4a753b968739e25cc3987ccabc024ca8474876"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.13.0/mockwave-linux-arm64"
      sha256 "a148d959970e0ad3b5c124e0e9ed696282e59bd2726f635dfdb986f1f8a327e0"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.13.0/mockwave-linux-amd64"
      sha256 "196ce93d157597261409f3320dc113bf5fefa6ea45e2eddbf76833fb8448600e"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
