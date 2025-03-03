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
�S4�gcek-mvs.sh �Rmk�0��_q�^c1<�K!�B)���YFGv�y�g�ML�����%;��$�͇M6�uw��ܝ.)el��+�3����8� ���3o0uf��|�3B��cX,�`�t!v��^�v.������7�����w	|�&��U���1vs�s2���G�:��)�Y�&�n;r͏C[%�W���UK�R�����/mя_��[�L��R�'�C&~C�S��ud���82r��"�B��D��~je�ӂ��;9��\���'H`��
��R�?K6%�* �9i���Ͽ,jJ�
��6�y�#6�@���g�)�7��+�ѡ&#"w�@ޮ��Z��!����:y���V͈��}@ѹf�X}3�h��j�O���U��p4���$@?����}���m����W�������?o�VX_�ᕭ�䶑�@�/�>i��  