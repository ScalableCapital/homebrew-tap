class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"

  on_macos do
    url "https://github.com/ScalableCapital/scalable-cli/releases/download/v0.6.0/sc-v0.6.0-macos-universal2.zip"
    version "0.6.0"
    sha256 "81a68e61cfd66ca9221b691d5feaa4bed4ab85df9ee9840048dc38a19728db36"

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
