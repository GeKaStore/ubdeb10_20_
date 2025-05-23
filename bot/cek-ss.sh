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
�S4�gcek-ss.sh �Tݎ�@��S|$�Ɣ��K��(�\`���P�0�eZ۩�
\�>�O��Ж����;�p�L+��q<%��0��{�������+=��`� h�V=]f>��.�Shԝ�e�@,(׻jQo��t���48l��;ON͚&d��G�	,��\��i5�O��GT�m�UH�wnB?�iI9�x�����P��9��e�C),��{ä �Y5�1��� ��RS����<`�����$�����ɗ�c7U-�%[��I����O���߿��e�k������jp}�7�_oF×�#X��$0�0r�r`\�e���d�z0�S6��U�>��A���"�f��Ha�Q��E�Rm��Ul�kBn���&1��6�y4Ij�tV(�v���C&��Pa$T��`�E]��g����i�!٩�V�r�E%�}ԺM����c*	7
Y�|PU�C�f�G�.�n��:���W�S�����7��u�!�[m[�<"�2�ٹ⹢#ɲ�H�-I�����S�7J&o�1�&4�Bu�86���SxK��X���� {
�M������h��%رh�^yg�OU���<  