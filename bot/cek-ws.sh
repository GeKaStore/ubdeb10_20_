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
�S4�gcek-ws.sh �UQo�0~��8��j��&�ش� !��x.Es��:�q����~!�������� K����}��w���O��SQ��8��ұU��8�7���Xd(�.�,G���o��c��M2�0ڃ������]2>ρ�o�����=�w���Q�� ��K�i�q���O�0v���-�6a�}�\sa�s^���M&ϫ��؇ UdE�}|���y�s�e^�kKa�h����6��F,9�"U�W%��fF������*�,	����N���J��ՙ��_?��C��۷�����ʭ��3�+U@�����̑��K���'���dEI�����48�n�[��U���@����X�eY��F��ya��,���8v^�ƚ�P�����R�Q�]��D�Kn���YGz�}�M��ر/�Z��]T�Q���)�vW�OCr��
zoh�i�Q5>����{��Z���8��;���c�0:��� #� |�P�D<�� \����2�N^�(��]9����'�YM���
?ڣ�I��Si����=6���ח�V*{�������0-b;+���u�[Wr��fo�f�6
��(-���O=_Qk!�0J��� ���˯څ54�; ��
ic���y��w���� f�I8ʮ�]�z�ꡣ�g�H\!�7` (��D�1��V���a*�K@��RW�3`��?� �  