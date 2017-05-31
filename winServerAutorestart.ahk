;This script should start the receiving end of the video streamer, when it quits
;wait and then restart it unless it closed with code 0
ErrorLevel := 1
while (ErrorLevel)
{
    RunWait %comspec% /c "gst-launch-1.0 udpsrc port=5000 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! videoflip method=vertical-flip ! autovideosink sync=false & pause", ,Max UseErrorLevel
    Sleep, 1000
}
