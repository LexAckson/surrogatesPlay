# surrogatesPlay
code for our surrogates game with City of Play

## to stream video

### First! on listening computer run:

```
gst-launch-1.0 udpsrc port=5000 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! videoflip method=rotate-180 ! autovideosink sync=false
```

for windows there are some scripts that will run this for you: winServerAutorestart.ahk and wiggle.ahk which prevents screensaver by simulating mouse wiggle

TODO get another pi and just use that for the listening computer

### Second! on RPi run:

```
gst-launch-1.0 rpicamsrc bitrate=1000000 ! 'video/x-h264,width=640,height=480' ! h264parse ! queue ! rtph264pay config-interval=1 pt=96 ! gdppay ! udpsink host=192.168.0.100 port=5000
```

TODO automate this in the script for the listening computer with SSH into the surrogate

## to stream audio

we use a murmur server on the pi and mumble clients on each device

TODO make the client autostart and join the server on the pi at system start
