class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"

  on_macos do
    url "https://github.com/ScalableCapital/scalable-cli/releases/download/v0.1.0/sc-v0.1.0-macos-universal2.zip"
    version "0.1.0"
    sha256 "368c3bf8fb9af78db87150474e1ddec77ab9709ee68ca8a159282d9a19294ba4"

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
