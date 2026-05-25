class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.2.0/mockwave-darwin-arm64"
      sha256 "031ef6c021c642b1fb82c948d65a3cc8ddc09573ed495f5e8c6ad42478df5324"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.2.0/mockwave-darwin-amd64"
      sha256 "ba5302dadc04acf1e7dd0d23c0cf14c385c0e63f9e6fdeb12009e49fa8c8a510"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.2.0/mockwave-linux-arm64"
      sha256 "69f28f4b7d47fe7864b23e0c60ef3882f6cd64070c73de99e614ea6346c405a7"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.2.0/mockwave-linux-amd64"
      sha256 "c2c3a2b571335a759fadfa25de4c038317b16eb26a7f7d37bf939ff04b07cb9d"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
