class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"
  depends_on :macos

  url "https://github.com/ScalableCapital/scalable-cli/releases/download/v1.0.0/sc-v1.0.0-macos-universal2.zip"
  version "1.0.0"
  sha256 "9f307672a08a8270b0deb9354e55d77b3c612d0f73e4c2ec9cb4b6b52bdccbf5"

  def install
    (prefix/"Sc.app").mkpath
    (prefix/"Sc.app").install Dir["Contents"]
    bin.write_exec_script(prefix/"Sc.app/Contents/MacOS/sc")
  end

  test do
    output = shell_output("#{bin}/sc --version")
    assert_match version.to_s, output
  end
end
