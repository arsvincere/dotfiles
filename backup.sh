#!/bin/bash
echo "== Backup ~/ to selfhost"

DEST=toshiba:/home/alex/bak/

echo ":: sync AVIN"
rclone sync /home/alex/AVIN "$DEST/AVIN" -P

echo ":: sync blog"
rclone sync /home/alex/blog "$DEST/blog" -P

echo ":: sync conf"
rclone sync /home/alex/conf "$DEST/conf" -P

echo ":: sync db"
rclone sync /home/alex/db "$DEST/db" -P

echo ":: sync ebook"
rclone sync /home/alex/ebook "$DEST/ebook" -P

echo ":: sync math"
rclone sync /home/alex/math "$DEST/math" -P

echo ":: sync media"
rclone sync /home/alex/media "$DEST/media" -P

echo ":: sync src"
rclone sync /home/alex/src "$DEST/src" -P

echo ":: sync utils"
rclone sync /home/alex/utils "$DEST/utils" -P

echo "== Backup to selfhost complete!"
exit 0

