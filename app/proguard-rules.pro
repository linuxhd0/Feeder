# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /home/jonas/android-sdk-linux/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

## The following is necessary to avoid R8, which is used by desugaring
## lib, from breaking even the debug build
# Keep kotlin.Metadata annotations to maintain metadata on kept items.
-keepattributes RuntimeVisibleAnnotations
-keep class kotlin.Metadata { *; }

# Everything in the app is essential
-keep class com.nononsenseapps.** { *; }

# For Okio
# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

# For Glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
-keep class com.bumptech.glide.load.data.ParcelFileDescriptorRewinder$InternalRewinder {
  *** rewind();
}

# For Jsoup
-keep class org.jsoup.**  { *; }

# For Rome
-keep class com.rometools.** { *; }
