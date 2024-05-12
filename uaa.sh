#!/bin/bash
echo "== Ars Vincere - commit & push"

DIR=~/ya/avin-dev

# git commit & push
echo ":: git add"
cd $DIR && git add .
echo ":: git commit"
cd $DIR && git commit -m "$1"
echo ":: git push"
cd $DIR && git push

echo "== Complete!"
exit 0

