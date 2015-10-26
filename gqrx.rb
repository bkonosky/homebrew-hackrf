require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
# from: https://github.com/xlfe/homebrew-gnuradio

class Gqrx < Formula
  homepage 'https://github.com/csete/gqrx'
  head 'https://github.com/csete/gqrx.git'

  depends_on 'cmake' => :build
  depends_on 'qt'
#brew install --with-c+11 --universal boost
  depends_on 'boost'
  depends_on 'gnuradio'
  depends_on 'gr-osmossdr'

  def patches
    #patch to link boost correctly
    DATA
  end

  def install
    system "pkg-config --list-all | grep gnuradio"
    system "qmake gqrx.pro"
    system "make"
    bin.install 'gqrx.app/Contents/MacOS/gqrx'
  end
end
__END__

diff --git a/gqrx.pro b/gqrx.pro
index c8877c6..1ad94e3 100644
--- a/gqrx.pro
+++ b/gqrx.pro
@@ -233,7 +233,7 @@ unix:!macx {
 }
 
 macx {
-    LIBS += -lboost_system-mt -lboost_program_options-mt
+    LIBS += -L/usr/local/lib -lboost_system-mt -lboost_program_options-mt
 }
 
 OTHER_FILES += \

