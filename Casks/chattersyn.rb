# Cask template — NOT the published cask. scripts/gen_cask.py substitutes
# the version and sha256 placeholders, and the result is pushed to the
# Homebrew tap (smitht06/homebrew-chattersyn) by the `homebrew` CI job.
# Mirrors the packaging/linux/control template convention.
#
# Stanza order follows brew's StanzaOrder cop (version/sha256, then
# url/name/desc/homepage, depends_on arch before depends_on macos, app,
# zap — quit before trash).
cask "chattersyn" do
  version "0.10.2"
  sha256 "d8b079515e3c293635b9707a2360b28d5a4e3b7bd496f0e294c5739691ecbfde"

  url "https://github.com/smitht06/red-chattersyn/releases/download/v#{version}/chattersyn-#{version}-macos-arm64.zip"
  name "ChatterSyn"
  desc "Chatterino-style dual chat client for Twitch and YouTube"
  homepage "https://github.com/smitht06/red-chattersyn"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "chattersyn.app"

  zap quit:  "com.chattersyn.app",
      trash: [
        "~/Library/Preferences/ChatterSyn",
        "~/Library/Preferences/com.chattersyn.chattersyn.plist",
      ]
end
