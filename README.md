# switchBluetoothAudioProfile
Shell script to automatically switch bluetooth audio profile between handsfree and a2dp mode

Pre-req:
1. Bluetooth headset (I am using Jabra Elite 75T)
2. Linux
3. Bluetooth Manager https://github.com/blueman-project/blueman (This is not really required but it allows my bluetooth headset to auto reconnect) 
4. Pulse Audio (should be installed by default with your Linux distro)
5. Zoom (or any other conferencing app)

When using a bluetooth headset in Linux, I have to manually go into pulseaudio to change the profile from a2dp to handsfree in order to speak on Zoom. And after I am done with the conference, I have to manually switch the profile back to a2dp (so music doesnt sound too bad).

This shell script monitors if the bluetooth headset is connected. When it detects Zoom is running, the audo profile is changed to handsfree. And when it detects Zoom is no longer running, the audio profile is switched back to a2dp.

As an option, this script can be added to cron (example provided in cron.txt) to launch during startup

This is a quick and dirty way of automating the audio profile switching task. I have commented the scripts on where changes are necessary to make it work for other use cases. If anyone knows how to make this better or if an elegant solution already exists, do let me know.

