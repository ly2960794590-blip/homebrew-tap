class Wsnap < Formula
  desc "Save and restore your Mac's window layout across desktops and displays"
  homepage "https://github.com/ly2960794590-blip/WindowSnapshot"
  url "https://github.com/ly2960794590-blip/WindowSnapshot/releases/download/v0.2.0/wsnap-0.2.0.tar.gz"
  sha256 "b7e45b15933c8f94cbcb2b5fcab97b8367e61a4e80cea2f679ffb92d5bccaa16"
  license "MIT"
  head "https://github.com/ly2960794590-blip/WindowSnapshot.git", branch: "main"

  depends_on macos: :ventura

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/wsnap"
  end

  def caveats
    <<~EOS
      Run `wsnap doctor` first. It shows which permissions wsnap still needs
      (Accessibility for your terminal app, Automation for Chrome and Safari).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wsnap version")
  end
end
