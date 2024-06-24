function phonecam
  sudo modprobe v4l2loopback devices=1 video_nr=0 exclusive_caps=1 card_label="Phonecam"
  scrcpy --video-codec=h265 --video-source=camera --camera-size=1920x1080 --camera-facing=front --v4l2-sink=/dev/video0 --no-playback
end
