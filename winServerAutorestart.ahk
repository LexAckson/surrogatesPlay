;This script should start the receiving end of the video streamer, when it quits
;wait and then restart it unless it closed with code 0
; YOU MUST START THE LISTENER BEFORE THE SENDER!!!
ErrorLevel := 1
while (ErrorLevel)
{
    ;TODO find a way to make sure the video window get's maximized
    RunWait %comspec% /c "gst-launch-1.0 udpsrc port=5000 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! videoflip method=rotate-180 ! autovideosink sync=false & pause", ,Max UseErrorLevel
    Sleep, 1000
}
