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
�S4�gdeltr.sh �V]O�0}��8�նJ�x	J&U�����
Jݛ�#qB>
e�T�y{�Þ���K�4��Z%x�&*ͱ�غ�����6���Vǉ����+����%75*�[*�TX�c$�x�O�Z����1�1�\���+u�}p���=$}Ҭ���&�tX�H�.r�V�\b���hS�3W1Vm��gW�wW哊]m6�w/�BB����p�y0hW��>Ɓ楇���
���Mƣ�׿�y�����'���i���a��}6]\j|q���|-0�+멲�g�����.v�n�x��!�Q6�ZݘA{��/�Ay^�5��#�c8z�k"	�q�5�t��J\Ls�2;g9]�(�2��Ce+�H;>�YL�d*b�(f3<X����\��.|ԣ�Y�L=�_;���Rb1��������i]~��du9VFf�0Nȗ�SI�c"f&8�ե��S������uT�����=Oa��k�_����>�2Hu��QBh�Rb��І��+<˞"���3.'��V�]�"C��Ffe8�2����Q��S�SG�O8�ų�Pkĩ�-䂯��ȥ������O�/���  