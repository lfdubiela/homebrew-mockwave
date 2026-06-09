class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.1/mockwave-darwin-arm64"
      sha256 "f7a88289c19984b121d8e05385627621dc05cd05fc1c84a3dde39ffdb8153f2e"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.1/mockwave-darwin-amd64"
      sha256 "785f1833e6fde627ea760267e9d52b9503fbc0fa99ede18f767020381ddf1000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.1/mockwave-linux-arm64"
      sha256 "3e373231dbfc21cc7eebf31c88d75833851ff7b07ed95e1ec71fdf49372050c1"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.14.1/mockwave-linux-amd64"
      sha256 "cde372f9e8c62bd8d7bd22ac3e2eb50d1199183a4d15ad8fdbff63ec749d1317"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
