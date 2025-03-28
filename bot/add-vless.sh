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
�S4�gadd-vless.sh �X�r�H�_O�Lֲ gw|G�M\�#�`g7g'�A�Y�U�L|\վ�>�>�u�!lb��]�l*�`�s�{���#{$B{�R�p|�#��V��;^�쬾�{���k�'���{�0�(`"l��&��ұ/6��r�8:yY��~4s��Ny�';�tT3���o�;B�k�`xSq��2?��>��By����O�xʬ���u����o�P�@��{x���:�nC�^����(�v����.���_�����-�g]{��^������z��?B��}s28.�P暚{�Et.��+���­R2q}-mX��`Ͳd*%
/�x��4
�0s��k�W\��ؔ��N��xhP�t9��B��������;�����<�0ң�AsG\�B�3�����CrwbLi�5D�`a����������K!�n��T���>��T�D�3a���/6�өp�-3N"l��Ԟ�$依���M,5#?u��X`Ç-��������M��X1� }�
[�^*��M#�6s�Xq���g�,b��'v������ij��._ѩ^F)ר궨�����!�>���t��Y��ډ	ߘ�]�f���.��I�N����/c�6�h�*�f��r&��\J���2�%R'�1�B�k*�M�������W>ڎ��Sn8�p��x[kb�ڝ��,e8_��i�$^����x��Pg�T*en�I�	�Yr%yH=yG^J��)��a!�'ł�T풪����J��+�f��Xl_��5�$�&���M��mr�~���\�<2��'��5���ܷ�(���8� ��9�d���`);s������L�Q��;��p|84K���^�rVF� ���O#���Q"[���.~��E�I�E�!^z�#b���TD�~��L)��DĖ�i�~q1_�E�R�j��,J&-���YjE�L[�2b&��K/ <<�<ɨ ��T�m�� ��m������붸<��[a�`��o�%�|����n�e�z��o���5�6�@��eC'�#���D.ʌ��r�T	�[Z�>N�t!<�A�������'�d�8N��w�(,3Ȍ�l;�͟�0����uv+)w�	��1Z:�<�"
�!��yn��~{���ii�>�Hӝn=��y�UyE�vWl(�mL��QPn+Y����*�4+�~�馡4��l�m��r��l�f�?�Ond��}}��#���biDnX�"�ܰ�1ĵ�(��"��ޞ5�,�m@�q	zV+��D�̰���<VpE�-xD�jr+
� V0qEB�tEU`E�Y��w)X�(����Y7�1*�\dT9��h)�H�j�-�jj�~$��Ķ�՚AP�|�,�	4�ͧ�Z-���h���F\4���V�Wzk����^��[���L;:��w�^�͏�����o��4p��&P���/{��7��G��pյ������(Su6�1ۛ� O�P�4m�'��7ݿ�{fV4%�*R��$�OOͼX�8X%d��/*�%�y"<wN/?�q�on�u�t��!t��;�o�[�����I��nAޮrzO52��Yc+pFX��3��,P���-���W/<��ԜV�hGD�V�m�v�3�4a�m�O��g�]gSs�6~z�y��xV�����*Dt"
�/yr�f���0�$�B�@�瓅�4\�.��[^aex,���/��묽9b?� o�����q֍��'
^��s �#�%��㾮�5���}}F���}�g/obv}�z�	:��p��v݀ �A쭣����gӇcu���%�ر�h�a8b.�:��l+p��	�x�4OK!F� �`.�ICh��=Q!S�(!�z
�[1| ��9x8կ](���Q�	�]�#���;���7�a  