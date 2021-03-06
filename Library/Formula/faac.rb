class Faac < Formula
  desc "ISO AAC audio encoder"
  homepage "http://www.audiocoding.com/faac.html"
  url "https://downloads.sourceforge.net/project/faac/faac-src/faac-1.28/faac-1.28.tar.gz"
  sha256 "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"

  bottle do
    cellar :any
    revision 1
    sha1 "46a8facbfd103d787d198e6fb802d6f0948222e0" => :yosemite
    sha1 "2a1e8a1decd52fcdf6498edd7f8437536d05d453" => :mavericks
    sha1 "9ea199f750c83887bb9e3d66759a60872672865f" => :mountain_lion
  end

  patch :DATA

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"faac", test_fixtures("test.mp3"), "-P", "-o", "test.m4a"
    assert File.exist?("test.m4a")
  end
end

__END__
--- a/common/mp4v2/mpeg4ip.h	2014-08-11 21:47:47.074013710 -0700
+++ b/common/mp4v2/mpeg4ip.h	2014-08-11 21:48:38.278413585 -0700
@@ -123,7 +123,6 @@
 #ifdef __cplusplus
 extern "C" {
 #endif
-char *strcasestr(const char *haystack, const char *needle);
 #ifdef __cplusplus
 }
 #endif
