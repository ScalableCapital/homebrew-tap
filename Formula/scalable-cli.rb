class ScalableCli < Formula
  desc "Scalable CLI"
  homepage "https://github.com/ScalableCapital/scalable-cli"

  on_macos do
    url "https://github.com/ScalableCapital/scalable-cli/releases/download/v0.5.0/sc-v0.5.0-macos-universal2.zip"
    version "0.5.0"
    sha256 "8ffc5828799db6d7ce1617b099199c4c949c1f9664cb23b25b998aebbe13965f"

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
