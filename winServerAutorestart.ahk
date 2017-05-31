if WinExist(""), ;TODO put the video window title here
{
    Run %comspec% /c "gst-launch-1.0 udpsrc port=5000 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false ! videoflip method=vertical-flip"
}
