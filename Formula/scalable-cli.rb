class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"
  depends_on :macos

  url "https://github.com/ScalableCapital/scalable-cli/releases/download/v1.2.0/sc-v1.2.0-macos-universal2.zip"
  version "1.2.0"
  sha256 "e051683418312e684e4108c0eb16c37c3b9988ed2ffb1bc68d183900f3910460"

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
