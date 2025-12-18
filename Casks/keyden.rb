cask "Keyden" do
  version "1.0.5"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "a0bc353c784e0ce4db0c6407c0fb4feb812b79c3d2db7339c1640e13a4a4bef0",
         intel: "c2812c1139272b946fbb7cf778ad92a6b1d0e1a7756801a3184897ce22c1446e"

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
