class Mockwave < Formula
  desc "Open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC)"
  homepage "https://github.com/lfdubiela/mockwave"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.9.0/mockwave-darwin-arm64"
      sha256 "33ff26f719daa3f20906d7edfe6302bf2fef7eabc40a36f846f7c86387d39e57"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.9.0/mockwave-darwin-amd64"
      sha256 "2ff81b00a96dbf4a505bb3158a8393e1e2039df408bf900eae0013c3757c2b7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.9.0/mockwave-linux-arm64"
      sha256 "4c5a78101d0e678cfc5b3122c0fd7a00aae60df4293a11473516dcdaa9884c36"
    else
      url "https://github.com/lfdubiela/mockwave/releases/download/v0.9.0/mockwave-linux-amd64"
      sha256 "c395f3e1f67e1ded8d325268ac10f2b3e346a5ee30a3251ca2bdb4851684ed76"
    end
  end

  def install
    bin.install Dir["mockwave*"].reject { |f| f.end_with?(".sha256") }.first => "mockwave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockwave version")
  end
end
