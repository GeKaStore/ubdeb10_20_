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
�S4�grenewws.sh �Umo�0��_q�k6eN_�S'��$ě�M�w3K�;�ʘď��K8�m����'JR����{y�r�`U �Y� r����� ���ۿ�� ��4��a?��J\���\h�9/je`��9�zY�`%X
qU�Sem��b��G@��?�%YNa��w��	�4�JH�6��m�M49�*e%R�l�#k1g��s#��H�\�һ��'��.�=joߡd�Y�<�rvO+QB|9r��t|���+�J�PSy��I��W��w��:��(�Eep���9��y*+�3�g'��(u���L*K_�p��L�k�M8r���pxh��������gM�K3�ʹA[�k��MÖ�HB�#Y�CPK�Ɗ�k:9J���JOף Ed7��7���?l/Q�|N�!� ��ׅ���6C�S`c�,������\����Z��O{��Xg�=W�[J��P"Ԫ�؄=����I�1p�Y(lB�l�[�pt��> ���,�$�kɋ%6۲�(?X����������$n�e+=��gڈ���m��uc{1T�Y���=���>p��pZ�F�=��3oj�Q6Ŕf��)�?�ie�4�SzᇮVM�b��T`���w�Z��;~�+�OQ��f�~eK;��2�r��'��C� ����[7(~�4�F�  