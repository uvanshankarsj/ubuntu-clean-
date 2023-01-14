sudo apt-get autoremove
sudo apt-get clean
sudo journalctl --vacuum-time=3d
#!/bin/bash
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
