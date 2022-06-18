class Randpass < Formula
  desc "An adequate command-line random password generator"
  homepage "https://mraffonso.github.io/randpass"
  url "https://github.com/mraffonso/randpass/releases/download/v0.1.6/randpass-0.1.6-darwin-amd64.tar.xz"
  sha256 "a16e94c9263ed57a0678321c88f6cc1f284000989796d236d96dece7912b3fce"
  version '0.1.6'

  depends_on "jq"
  depends_on "libevent"

  def install
    bin.install "randpass"
  end

  test do
    require "open3"
    randpass_bin = "#{bin}/randpass"
    ::Open3.popen3("#{randpass_bin} -h") do |_, stdout, _|
      assert_equal "Randpass 0.1.6", stdout.readlines.first.strip
    end
  end
end
