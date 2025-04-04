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
�S4�gpanelbot.sh �Tmo�@ϧ���Z�( n�J|a-�&��6͉�^&9�������E���O��ʎu��JH���q�:z�O	է([*�6M��9�Ԯ˚�eƵ���I�%�K�u�ϒ�$u�I�%1C�B��T�[��[I���E(�w��z%,0%��b�N�M&$��$��8�#���#�gPj��Ѝ8Yc�~��&e�rЬmM@QΡ1�D�ƼU�`��Fa7�`��=`�q<8��a2��������P��������nJGGm��6xҋo��U���A��)�x�H柞9Q�FL��2�!.½}���_��d�G-w{�L�m۴��1T��o?`*N�"�WE>yB�e��YՁ���RO�mvP��e'
$������O�.���l
S�
��?|ZMgFxZ�̀�^0�$F���02�f�HA��x�?8Ua�11P�A�@�b����:�:l���a�lb����O5W�m+F1Z��O��,a���"����Ң�k�۝�4����1�""�47��g(��Q��  