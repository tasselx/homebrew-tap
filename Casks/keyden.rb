cask "keyden" do
  version "1.0.5"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "PUT_ARM64_SHA256",
         intel: "PUT_X86_64_SHA256"

  url "https://github.com/tasselx/Keyden/releases/download/v#{version}/Keyden-#{version}-#{arch}.dmg",
      verified: "github.com/tasselx/Keyden/"
  name "Keyden"
  desc "macOS menu bar TOTP authenticator"
  homepage "https://tasselx.github.io/Keyden/"

  depends_on macos: ">= :monterey"

  app "Keyden.app"

  livecheck do
    url :url
    strategy :github_latest
  end
end
