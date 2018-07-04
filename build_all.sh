#!/bin/bash

# NOTE:
#
# We currently build without libpng or anything that
# depends on it, because libpng doesn't link nicely.
# Until we find a fix, this is the best we can do.

#DISABLE_PNG=1

# tools first
             orc/build.sh &&

# build low-level		 
        libiconv/build.sh &&
          libffi/build.sh &&
         gettext/build.sh &&
	     gmp/build.sh &&          
            uuid/build.sh &&

# build utility libraries	  
          a52dec/build.sh &&
           bzip2/build.sh &&
	libmpeg2/build.sh &&
   libjpeg-turbo/build.sh &&
        libtasn1/build.sh &&
	  mpg123/build.sh &&
          nettle/build.sh &&

if test -z "$DISABLE_PNG"; then
    libpng/build.sh
fi &&     
	  
# Build Crypto libs
          gnutls/build.sh &&
	  
# Build libav
	  ffmpeg/build.sh &&

# Build Glib
            glib/build.sh &&
 glib-networking/build.sh &&

# Build text rendering libs
# these ALL rely on png
if test -z "$DISABLE_PNG"; then       
           expat/build.sh &&
          pixman/build.sh &&
        freetype/build.sh &&
      fontconfig/build.sh &&
           cairo/build.sh &&
        harfbuzz/build.sh &&
           pango/build.sh    
fi &&       

# Build Gstreamer      
       gstreamer/build.sh &&

# Build Plugins
gst-plugins-base/build.sh &&
gst-plugins-good/build.sh &&
 gst-plugins-bad/build.sh &&
gst-plugins-ugly/build.sh &&
       gst-libav/build.sh &&

echo "Done!"

