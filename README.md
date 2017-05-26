# surrogatesPlay
code for our surrogates game with City of Play

##to stream video

###on RPi run:

```cat video | nc.traditional 192.168.1.10 5000 & raspivid -o video -t 0 -w 640 -h 480```

the IP address listed above is the Pi's address, *not* the listening computer's address


###on listening Mac run:

```netcat -l -p 5000 | mplayer -fps 60 -cache 1024 -```


these instructions slightly modified from:
https://altax.net/blog/low-latency-raspberry-pi-video-transmission/





##to stream audio

on Pi we are trying running something like:

```while true ; do arecord -D plughw:1,0 -r 44100 -c 2 -f S16_LE | avconv -i - -acodec mp3 -ab 320k -ac 1 -f rtp rtp://192.168.1.10:5001 ; sleep 1 ; done```
