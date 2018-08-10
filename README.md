== Overview ==

This guide will help you download profit browser, and generate an Android Studio project.


== Install ==

1) From terminal run:

./ all.sh

This will download profit browser and its dependencies, build it then generate an Android studio project in the current directory. This script should be called just once.

2) Open Android Studio and import 'chromium_android' project from the current directory


3) If asked for using the gradle wrapper say yes


4) If asked for using the Android studio SDK say no


== Rebuild == 

If you want to rebuild the project you can either do it from Adnroid Studio or by calling:

./build.sh

Generated apk can be found in chromium/src/out/Default/apks
