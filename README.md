# Octoprint Dockerfile


Thanks to : http://octoprint.org/

Contains: Octoprint, curl and avconv

On the host add the following to your udev rules (e.g. /etc/udev/rules.d/20-printer.rules)

```
SUBSYSTEM=="tty", ATTRS{idVendor}=="xxxx", ATTRS{idProduct}=="xxxx", MODE="666"
```

Running

```
docker run -d -p 5000 --device=/dev/ttyACM0 --name=mycontainername smeat/octoprint
```


