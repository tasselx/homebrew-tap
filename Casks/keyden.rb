cask "keyden" do
  version "1.0.7"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "76af0804a9e10ad41beefeaf73354923c8fa27d72bb8a5132397b29907653fca",
         intel: "0f27d6e48ac46b733d8985ea88502ff49a0d8cf916855bc05a8c8b3bfe0b6162"

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
