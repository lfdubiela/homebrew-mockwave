class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.3.0/mockwave-darwin-arm64"
      sha256 "36cb7623c39a005fe667c5a06ea9cf26e8badcc7fdc728291fb697517f81ee60"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.3.0/mockwave-darwin-amd64"
      sha256 "3ba75f08f2dd1612987f9e45ecd081d8b14decf6393ef803887ed48073e1e1f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.3.0/mockwave-linux-arm64"
      sha256 "23224eba29bba45e7004d63274c42de55aa068731b6689291410a478209d2a34"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.3.0/mockwave-linux-amd64"
      sha256 "926cef06d414b0f8435794db2ac1296a7abdc8f0dde1751fa05b68a20078c7ce"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
