cask "keyden" do
  version "1.0.8"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "2f6c6dc1d0b4e4900df12326355c395c2ac54275d3041ef96f3ff4bfd5e40fff",
         intel: "bc9a1a9f69557ffdb441756e376cc2dceccdef0c14befa99341dc6ee8ed8b05b"

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
