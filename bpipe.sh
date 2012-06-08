#!/bin/bash -e
#
# Usage: browser
#        pipe html to a browser
# e.g.
#  $ echo '<h1>hi mom!</h1>' | browser
#  $ ron -5 man/rip.5.ron | browser   

case $(uname) in
	Darwin)
		OPEN="open"
		;;
	*)
		OPEN="xdg-open"
		;;
esac


if [ -t 0 ]; then
  if [ -n "$1" ]; then
    $OPEN $1
  else
    cat <<usage
Usage: browser
       pipe html to a browser

$ echo '<h1>hi mom!</h1>' | browser
usage
fi
else
  f="/tmp/browser.$RANDOM.html"
  cat /dev/stdin > $f
  $OPEN $f
fi
