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
�S4�gtools.sh �Vmo�&��_1u��Eb�}�Um���&�N�Ҫ귋��fl�` �7������n������g`^��)J����6�\���,�r�9W'w�qz9�v'Y��l��H�A���Ʒ?���>=�O�Uk�!�ww�����r�:�</��>ǭ����YB�;S���A����k���J��3�-L3n�-���V�d�O�� �W4�eXVF׬R��ɖ[g֛�Ԯ�~�,-������;��
�1ۻ������HC|�k�-v�y̈ټ��1m�v�V��(���w��`�.PhX�4z������4���!Y7�|���JcRȂ��z	��@��*H���]��\>����?�.���?on����Rt�@�1r�1T��-�j�HWX�F�����,םb�;?��R���;n�W��P�$����0��Z�(q�E���+Ӏ�����&z[ڟ�҆��fh�PVɛ��ָ������J0:d��
�t�n�!C5�C�n����D��J��Հ�o��j.լ����5��k�j�uY�J�D���)rFC,#�^�"FY��a�<��>$g �0ʗ�`��G�ZZ6ŝ,�3���o�"�C�";d�w���e��h��,�IR����<%m���H�Z�J�ɍ�?��C�h�+
z��Ռ��A#x�(��*%w�)�[lz��t��Mh�f���z�d�,�·՛4k#�ރn�^�mm�Xm��O�ҿ��ǽ�4�퐳Yc��Kţ�W��i�0�2�CQp+'�ZۗJo��_��kb�ER/�I�th��[�Yj��C��n����|u:9?�'��ݴ8��9�j���!R?\���;�Ӗ�0OZ.���/l�����2%�;�n1��g[��$��3P���Dd&�r��kqv4��xH��݆jU���&V��ơ�����:&g��[��v���wAZZ�Ҿo����<�J~��Z����W��cB|��Z�mtGuTd�*ĳ�w�AQt����M�"���b~�1�!�}2�렊��g���@1�Lrz��oz���+	  