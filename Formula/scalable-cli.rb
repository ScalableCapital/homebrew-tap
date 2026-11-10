class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"
  depends_on :macos

  url "https://github.com/ScalableCapital/scalable-cli/releases/download/v1.3.0/sc-v1.3.0-macos-universal2.zip"
  version "1.3.0"
  sha256 "fb85da2123635f1cbb7dbc15a1c678e6a24d12990d4329f0cebb706d51d772f9"

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
