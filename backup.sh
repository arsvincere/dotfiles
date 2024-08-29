#!/bin/bash
echo "== Backup ~/ to selfhost"

DEST=toshiba:/home/alex/bak/

echo ":: sync AVIN"
rclone sync /home/alex/AVIN "$DEST/AVIN"

echo ":: sync BLOG"
rclone sync /home/alex/blog "$DEST/blog"

echo "== Backup to selfhost complete!"
exit 0

