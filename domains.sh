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
�S4�gdomains.sh ݕmo�0���)n.��$���������
L�h5�!.��%*e|�9	P�>��6ͯ������ƈqc�#7�5�Gq��(qh�U�TV�L���Ң��t�F��~?����i�[g=��'��KW���Q����V��C��,��`��;�D���*��	�������#�ݥ�æS#1���A����vWԪ�;�h*�C�GV~��/��<�H�?|=i^ZN��jW�
-�QӬ��32ˤTƕ�CIi��հ&.f!�"�0��n�c�%�gAR�0�PG���C�@�PD4��`\2>��Pn8��*؅��6�(�L�_:g�{|����JD5��Ӊ'b��B��1��(������Fo9����2�XƑ��dS��*=$�'@Z=���L.WSa�7_<%;���H�|�:\�P��,�5�AੴK&�q	�T�n����(��x�3{7�Λǝ��67����Ph�����^�Hh��wg���󝌂�y�"\_�t)�?�N�NokPΦ\���P�#�Ĩ��h%YT�B�Ȃ���cfluS������=��Q�d�E�W�)��0��_op���`k�ʶ��Lw��w�M����`gUnB����!�K�����`����6ި�y�7�m4�G����&e=��h��.;��eS�)[�_Vi�}����4r��y��B��[r�g�Ga� ~ F��\L  