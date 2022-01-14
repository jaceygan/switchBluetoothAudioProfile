# switchBluetoothAudioProfile
Shell script to automatically switch bluetooth audio profile between handsfree and a2dp mode

When using a bluetooth headset in Linux, I have to manually go into pulseaudio to change the profile from a2dp to handsfree in order to speak in Zoom. And after I am done with the conference, I have to switch the profile back to a2dp (so music doesnt sound too bad).

This shell script monitors if the bluetooth headset is connected. When it detects Zoom is running, the audo profile is changed to handsfree. And when it detects Zoom is no longer running, the audio profile is switched back to a2dp.

This is a quick and probably dirty way of automating the audio profile switching task. If anyone knows how to make this better or if an elegant solution already exists, please feel free to let me know.
