cask "keyden" do
  version "1.0.10"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "2f46603aa28168f18df0b45dd76461a7791ccabffa3ccc61a62595b94a7b21da",
         intel: "1f119cfa05ccacd9f8255ecc22ae7d2843b6bf09888eb9ea02ac613fb45c68f5"

  url "https://github.com/tasselx/Keyden/releases/download/v#{version}/Keyden-#{version}-#{arch}.dmg",
      verified: "github.com/tasselx/Keyden/"
  name "Keyden"
  desc "macOS menu bar TOTP authenticator"
  homepage "https://tasselx.github.io/Keyden/"

  depends_on macos: :monterey

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
