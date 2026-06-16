class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"

  on_macos do
    url "https://github.com/ScalableCapital/scalable-cli/releases/download/v0.3.0/sc-v0.3.0-macos-universal2.zip"
    version "0.3.0"
    sha256 "b685bb1a68118ab389ad4728e1c108a94d6253efb3157b1f5bd6fec32b128677"

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

  on_linux do
    odie "The scalable-cli formula is only available on macOS."
  end
end
