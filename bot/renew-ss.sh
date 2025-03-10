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
�S4�grenew-ss.sh �U�n�0����ש��,ISXՋ2��VZ7MS76/q[��)��:�Oȓ`g=�q��$��۟�s�?e�JH���!!񈳜�<iU�x�o~Z%��sYlx͠n6���ʊǯ�F�����Ջ�}�mU���1����(��u�Nsv�ƙ���[�I���'N����>�N`���$�p��U���D�w5R}�z�|x��Z-T�*�ϛ�C.I�38����n�����qx)%X�a����GM���x��t��?�t;��.�ðs�>��E~fp��.����R:�&��2�
�� 	.�*/�ZQ�
����I�p�%pƠ�s�R�gzm�%M5�	�v�jN�b�Z�>���P73FU����*��H2�16�9�7O����Lj$��F�V�cj`e��=�h� s�B[&p�z.�6<�,j-ձ��"�;�Ѻ��-�Mߘ���%!��(��٪!K�����Ŝ�@z��ܖ��!b����� U�z����%�[�U�;+��䊨[�y�r�43]��fcw�G֯�T�8��o��bV�o�wsa1��6\�ތms,����;�#a1�w��}������  