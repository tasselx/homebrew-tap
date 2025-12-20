cask "keyden" do
  version "1.0.6"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "e8bb3dabfd3058bcbca31dc0de7965ad6c2d5b0cea2164e70c03d571dcc7df53",
         intel: "6d6b7319f6e789f3daa3c19e144be0bef5b918d62dc6a761eff5d216773047b9"

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
