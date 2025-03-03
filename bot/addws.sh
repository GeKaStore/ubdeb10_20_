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
�S4�gaddws.sh �Z�r�H�_Oё�bv-co.K��0���|8�WHc�EH*iLX������G#$N�ٔ��Q���{�[=�3�y���ٳ��v�j֊�ʻ��'�;���n�=�(��~hMj:��<�-�t���L����X�AJ�GJؑy��2���y=E���~F�7��c%��vQ���u����|�eV�9���^��i[L&l��3rI;=?��"�;^dF,���� ��܅�(�Ȅڿ�Åe|�o��/��*�?@a�8>j�����G�ng��Ex��	8���b��������?����$���{{8OvF���:���=9k��GN�~����s(g�z�Gm��e�Ӂ�g�7�9�!�0�ѽs�q����U$S����뀇́MǚD%%:�"�
~�,�G\H�yxPJ������,�,4-�0m7f:��B�aM��1V��U��{W���{�{��m0ܒ������U��T�0O�`ܨ���ٝM�7��X��K�0ŕs�>�fS�o��89owWJ���aHt]��Rx(8�y�\( 
�ͯ8&������R�N�Ƌ`��'�����|J�m��m�����W���X�e-�D��l�B�"a��I�Ԁ
���1U��~R����RݛG,�L��)��L��;�v�>�ד��R�\3�<��M)i��� �����G@��?�������X����boP�]t
h�(�f���tr������I�D�D��ǧ��*RaEj��}�r5#ݐ[��%�H�,�Y��#b<�Ҵ�o1��P�x^}�������E�����*�
���
��mq-4�F��;���i���hn�)��;2Z�3�z�6ۚ���q�(��¼��ۖn���G�(�e���3���\U�\q���l��]� W��W��oX
O��N�i�:<UW�#)��[�}ARF�'�'x8�	�Pkoo7#r%MO�ג���cr�8�)�ĀhIYgt1	�=\2����-�	W>]�������G��}�=���<.�ϘH�Š��6�{�P	-E��X�}�d��c��#f~"{<�ۗ1r�i0dnO��O��v+n���G�J"��i�f�ݼ�P������U�:�.i)�0wi�*`��;��2hx�ֈ*8y0��V,�����
"�i�G���<0l
M�IƐ�_����pX�1�8�?QU���
f�>� ��9=�lE���?�����z\�������g9Ts��Ǫ�E�:Jā�N���)��?���Q��L�[�qk���\p�-)�635YiciQ�]~�G[�B��7T�۶{�KU������fa3�����c���=�2˥�f����S��w5J{í%�;Y����ٝ���!ճA����Kn��m#W< B��΅��
����5�A�����b�x��̰  ��� J<��P]��+=���p=<��O�?ɀȏ��x$�JP,���@y�g�!�P�m���<s�J�\Ю�p驨��"�[�̋�c�h��bI��l�0�g�#�+{��R)�UH�A� @�5Im R�my�T�|iֻ���Am"�����g�G���|COoqR�`i�x�irl��Y1�e(��{���w=��]��i\�9� ⨦���O/Z��pA�E��R�H�Dz�.Ӑ�z��۴e#B�i��D��Qi�gU��F��ԙ�:�Z�S*r���p�G�i�gM�KC&��L�0	t��R��ɳO��`�L���A��c-r�K����[���TV��jsx����Enz��!n0ۊK�o�o����M�f;�d~ޅ�r�_aF:z�̅R6-�@=�M�@9��0;��(a���`�t �n~(�^�5����� s���N�ps���(�xf�+��@� 7�^�߶��C~�>d>>j�P���<da��ٺN]:q��Z�:{�������ŵkm�nwm������zNN[��q��|m���<�ѥ���xg��[�uxغ|�a�5R@*{=��
y��^��ѩ�X
��H9�Z����LU��l¤kK�Ғ%�`Ua�_�!��hy���=z�=����0dQ�����Ѵ�� ��A���l�����I$%  