cask "keyden" do
  version "1.0.9"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "fe17a902d2e44edbfe5d73b473e68e749b8d957a4397cfdddd8cec647e7af667",
         intel: "4f25f939629ebc19c6c81a663f512149e563ae603398b14178ea7f9a2a5a53d0"

  url "https://github.com/tasselx/Keyden/releases/download/v#{version}/Keyden-#{version}-#{arch}.dmg",
      verified: "github.com/tasselx/Keyden/"
  name "Keyden"
  desc "macOS menu bar TOTP authenticator"
  homepage "https://tasselx.github.io/Keyden/"

  depends_on macos: ">= :monterey"

  app "Keyden.app"

  # 安装后移除隔离属性，避免 Gatekeeper 报"已损坏"
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Keyden.app"]
  end

  livecheck do
    url :url
    strategy :github_latest
  end
end
