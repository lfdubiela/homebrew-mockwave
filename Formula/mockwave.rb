class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.16.0/mockwave-darwin-arm64"
      sha256 "b2ba6834f9528f0c8ed0ccf6ef0f8559e4c22834b07cb9f38fc2733eee0b0761"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.16.0/mockwave-darwin-amd64"
      sha256 "aa2dbf192bafbe0570e109a8207fa7ecb6ecfabd798df0ec654e59b7f3ea0b76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.16.0/mockwave-linux-arm64"
      sha256 "4295c8f4e442ca3f077fb79127c173fba65849e64054748344411fc0b2b4e2ac"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.16.0/mockwave-linux-amd64"
      sha256 "d344cba0b13d3174a5840b6ee7eb88abe81b0b354c36b5e33a7b5799190117c7"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
