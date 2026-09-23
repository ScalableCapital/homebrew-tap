class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"
  depends_on :macos

  url "https://github.com/ScalableCapital/scalable-cli/releases/download/v1.1.0/sc-v1.1.0-macos-universal2.zip"
  version "1.1.0"
  sha256 "a88f2e395fddeaf96f90876db0ee8b1f37a987de16f7000526af5815c2af2d71"

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
