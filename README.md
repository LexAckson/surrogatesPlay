# surrogatesPlay
code for our surrogates game with City of Play

## software instructions

### to stream video

#### First! on listening computer run:

```
gst-launch-1.0 udpsrc port=5000 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! videoflip method=rotate-180 ! autovideosink sync=false
```

for windows there are some scripts that will run this for you: winServerAutorestart.ahk and wiggle.ahk which prevents screensaver by simulating mouse wiggle

TODO get another pi and just use that for the listening computer

#### Second! on RPi run:

```
gst-launch-1.0 rpicamsrc bitrate=1000000 ! 'video/x-h264,width=640,height=480' ! h264parse ! queue ! rtph264pay config-interval=1 pt=96 ! gdppay ! udpsink host=192.168.0.100 port=5000
```

TODO automate this in the script for the listening computer with SSH into the surrogate

### to stream audio

we use a murmur server on the pi and mumble clients on each device

TODO make the client autostart and join the server on the pi at system start

## hardware

item | cost | sample purchase link
 --- | --- | --- 
Raspberry Pi 3 | ~$35 | https://www.amazon.com/Raspberry-Model-A1-2GHz-64-bit-quad-core/dp/B01CD5VC92/
micro SD, maybe 16GB | ~$10 | 
RPi camera v2 | ~$30 | https://www.amazon.com/Raspberry-Pi-Camera-Module-Megapixel/dp/B01ER2SKFS
RPi camera 2m extension cable | ~$10 | https://www.amazon.com/Adafruit-Flex-Cable-Raspberry-Camera/dp/B00XW2NCKS
USB sound adapter | ~$7 | https://www.amazon.com/gp/product/B00IRVQ0F8
10 Ah USB battery | ~$24 | https://www.amazon.com/gp/product/B0194WDVHI
lav mic<sup>1</sup> | ~$11 | https://www.amazon.com/gp/product/B01EH6PK0C/
earbud | ~$5 | 
**total** | **~$132** | 

1: Using this lav, we actually had to cut off one of the mics and wire our own base; the base of this one is a TRRS and the USB sound adapter we had, as linked above, could not use that device as a mic. (It is probably a TRRS, and unusual to a standard jack, because it is a stereo mic.) Ultimately, we cut the TRS jack off of another cable and soldered the single lav mic to it.


# Round two!

In the next round of this project, we are going to be building capacity for more surrogates, and also working to make some improvements to our current hardware/software setup.

To setup additional surrogate/host pies just clone the sd and follow these steps:
* update hostname in: sudo nano /etc/hosts
* update hostname in: sudo nano /etc/hostname
* run init script: sudo /etc/init.d/hostname.sh
* reboot: sudo reboot
* assign permanent ip in the cop router

## Hardware improvement

We will be experimenting with bone conduction speakers for the surrogates, so that they do not need to wear an earbud to hear commands from their remote operator. This is beneficial both because with bone conduction speakers, the surrogate's hearing shouldn't be impeded at all, and also the fact that they're hearing remote instructions will be less obvious since the person they're talking with won't see any evidence of their getting a remote feed. The transducer(s) will be built into the surrogate headwear, which should also increase the ease of donning the equipment.

We will be testing the Adafruit Bone Conductor Transducer, [$9 from Adafruit directly](https://www.adafruit.com/product/1674) or [$15 via Amazon](https://www.amazon.com/Adafruit-Bone-Conductor-Transducer-Wires/dp/B00XW2OGAS), which is driven by a small 2.5W, 2.0–5.5V, class D amplifier, [$4 from Adafruit directly](https://www.adafruit.com/product/2130) or [$7 via Amazon](https://www.amazon.com/Audio-Development-Tools-Adafruit-Amplifier/dp/B00PY2YSI4).

Because this amplifier can drive anything with 4Ω or greater impedance, and we're using an 8Ω transducer, we should in theory be able to wire two of the transducers in parallel to the same amp and mount them at different points on the headwear. The sound the surrogate hears does not need to actually be stereo—it's flowing from a mono mic at the remote operation station—but two transducers should be better than one in case there's loud ambient noise. Conveniently, the amplifier board has a small trimpot on it so a crude volume adjustment can be done with a screwdriver if needed. (Hopefully that's not necessary though: we can do level testing while remotely adjusting the surrogate's RasPi volume output, so once it's set in software hopefully no further hardware adjustments would be needed.)
