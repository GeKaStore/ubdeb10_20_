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
�S4�gautocpu.sh ��ao�6���W\9�V(���@�e)�a�b��e)%�2g��Hʲ���HY�S�j�뎼{��#�1aL�̉��|�1���S��#�A/%�@\c�Y��-�&�G')�R�����j�NB72�3V�кϒRL}��c�'�
⼽�	F���b���ͯ7o�19����g�$� h�������!�5j;�`:��X
�
!3ϷQ/��-����|�f�Y����E�9�RtE��n��& >5�<;+��$��˔�p�-�)� Р�ny}�jYMk�C�na�u���P��,�zVǵb#k&4����/�V����J��$aJ��>�cr[}�I�9x�*Ʌw���N�r� ��S�>�X��+aR�)ǂ2\Ӈ~A �Ї~|�l0 �wX2+q��ZxC%'��BA�s�9�4���,�<7[�5ux���Z}��mzV�7����{�Yo8���}��6����Ω���b��tV�XV��m#6}����-=6%��^1�/_���q��)J0�M� �>�'c��] N�8 ������r[�� kn����Ե ��"=7-�.N����r�Z���L�C������D����n.�����،f�hƆ�Rҕ�S+�z��L�Z�qt	_%�/؁���B��Ev�1D��L���`<"k!���uCb����J��Hm�8�vFd�Q���0��wJ�.ݑ(��{4��D������u���e�7���ӷ��6ё v�FkE|�,�5i���Joإ)Ͳ�2��:� ���Q�&�Q�6�v��F�)G�^Ji�h��O���4�^�A;�ج2�'9��<W�?7{6t�OPl^ΨS]0Qo�ڕd�pWl5�ynךx_ !SP�
  