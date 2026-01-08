cask "keyden" do
  version "1.0.8"
  arch arm: "arm64", intel: "x86_64"

  sha256 arm:   "ab6d0ed46ced035a64367805611c7362447ba541201d209a9809ec6153b1dedb",
         intel: "a3f2d64f7efb61ee96344a5dae008b401fa89dc858245b84961e31c3165bd84f"

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
