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
�S4�gaddtr.sh �X�R7���b���g�mLL�'�C�b3� ���$�8ԝ�;�	�$]�t�CH;m
�;K���ծvׅ��"�����M-ˏC�E����P�9��;q��ux����A<�#�p�~��z2ꕭ�n����Ĥl�w�G��u�"�89���A�7x�ڟ��������Q�֠x%7��ov;��(UJpv�~lQo�M��ғ����?~�6�����JH lnn=�~���y}��]�{pԆ�R����'wٕ��v�ۆ�}���܇7Gͷwؕ)u}�  ���RZ��2�3J$0"����#�����?�8�_a��-�f*w����Ȓ.ʲM�ͽ$aW�6��v����l�H���+������#��j�w�s
���fjt�|o�1	31��<��`�=c��ȸ���A�ǐ�r
(!Ƈ�Ș*��.y��\2�O���'H)n*�����$2�/��Z��󒒤1�	w��c4pR7ª�H�����˄�`�N���;�b����/�X��X��L��RY�Qqi;���HZG��7rX�d9;�,���lHq|w�	<"�>)[� ����dbp+�[$��	m�"궋(�."�Pj9�\���U�KR���h��WSkJb�X����Yy��N��c��/K��M��n���ڳ�b��n�ģTq����\_���(���U�"l�3��v�ť�h��������k3(9���Ǽ踧�(��fR:����H�r>�S�`(�`|{L(�a�l��r��򰤳�&��Uf�3�C�|L��Ma�����>q� �>���;�U�q"gW����uǲlu���j�hg{ Y�Yǚ���S\K�T�ass��$A�L����Ii�$����a�\
�آ4>d���Tب�]L���������܎��*2W���𞠩���W1��%��G���W[K����7��z�g.�ф���p��*�0��|�Eo��>����c�0�D��b����uruu�і�83���x&O��Z{1;�5N�Q�JC|m�GӘq�I77$M�櫅���*P/��n��>m�G�"�^:nM�t=�0��a�Q2� ��c��[�U��,@�=����Y��,���xl����[���/O�����R��4��.��L�U aE6^������p�Tvƶ������:�����B��uICԤ�YJ�9y/��C��ʖl���)<�j����(�g�Z��4 5��9W⣂mA4;�nsg�M������t���
ɿ��C�S�5w<��U�2l���)bϐ!M��`ia�ѵ�8�=-���]C�խ���������&���}��l������CU��jw����u���5�ۗt�s�u��3Y�یRh���,��D�.�@��zXȥ�t}�� ;ĺ���Aw�SVdx�}��: -eq[)��Y�FƧA�MM�����w�l���T����+t�$�Y0'ɍ�S��^DE�0d.�����A�;}�~����AB�V��Z1"��[�����{a�����A$GX�5�
��T��`�F�b�ñ�hGx���z�7��F#�o=_���K�4Hp�z����%�p  