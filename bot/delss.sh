#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�S4�gdelss.sh �VIo�@�ϯ�:��H�XIo�)!���TE�Dfx�3v�P�"��{�C��i���q@���V ն4�����s��Q��8ေb�P9�>}ӧ�,�|�{ޡ�,��NɁ��*���J�3&]r�T�x�P�8�h�OH��7r�6y���HZ���Z�t���CL��z��R�xaWo�/n�W�T�����|	a�_g2p�U6����=�s�E-���Z�g�w}��:�����캍W��&5����8����;��/|/0H�������{����'�=�gɜ��#����!����]�~��V�\�ۨ�p�C�"��q��ƈt�&��9�͋���.D�/�Vо��R��ṙ����� �"�<���,�xd�J݊&��!�6k~���ԨL�$gZDּ�:��?���[���i�HF.�"�dLBp�KcKǮ���G�苋��M��5w�Y��!�J�J����^���$�"B-��ȣg�6]�޲2�*�J���eO|1�5�(���0�?�&.������Eϴ�-��#M��`�n&�}�#���?D� ~�w3�0^��~-ho"  