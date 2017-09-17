Tora
====

Use traditional wired speakers as wireless using raspberry pi. Just one command
required.

Setup
-----

* `sudo apt-get update && sudo apt-get install bluez pulseaudio-module-bluetooth python-gobject python-gobject-2 bluez-tools udev`
* `sudo usermod -a -G lp pi`
* `vi /etc/bluetooth/audio.conf`

    [General]:
    Enable=Source,Sink,Media,Socket

* `vi /etc/bluetooth/main.conf`

    Class = 0x00041C

* `vi /etc/pulse/daemon.conf`

    resample-method = speex-float-3

* `pulseaudio -D`
* `vi /etc/udev/rules.d/99-input.rules`

    SUBSYSTEM="input", GROUP="input", MODE="0660"
    KERNEL=="input[0-9]*", RUN+="/usr/lib/udev/bluetooth"

* `sudo mkdir /usr/lib/udev && cd /usr/lib/udev`
* `vi bluetooth` and put [this](https://gist.github.com/vipul-sharma20/8798c31c1dfd80f60fe129e67897fcaf)
    * `AUDIOSINK` might differe check yours `pactl list short sinks`
* `chmod 777 bluetooth`
* `sudo amixer cset numid=3 n` (n can be 0=auto, 1=jack, 2=hdmi)

Connecting through Bluetooth
----------------------------

* `bluetoothctl`
* `power on`
* `agent on`
* `default-agent`
* `discoverable on`
* `pairable on`
* `connect <mac-address-here>`

