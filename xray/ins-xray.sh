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
�S4�gins-xray.sh �ZmS�H�����
!�$��@�ZB�{�P��rE(j,�m�%�nf�!,�ۯ�E�$dc�_6T@�����g�{^���7o���ZCݕ���!�(��z��[�����v�a��wx�t������N���zs�6��)Q^�����q������t�����?��W@z� >!�d�8=��!R��y��q(&�0��4$�Oc��ʈ�2l��:�+/��C�"��"� ۲� �	�m����ŅdzD��÷^@e;ty��Ą$�~�?��x �i���\t�B�G������{�@�wcFHr��x�~�?�G��pB�)�u]0��	8�P�
<�/��0r9`�ܮ�E�:h7�D�r�ePJi�K��aL$��D8@G�ed�^z�4�F�[��`f,��2�DgF�DΨ�/�Є�b�w<Y��!k�0�\`+��8͘/9�9���:�Hc�G'H�����L�����1�3�懓�0�h6&B�;�u�Sʄ�&:'Y:ֿ;�O	׭">t�.9��܉���x�LF�{�;�h�R�s;7WSV�#L���A�0�є$�G�s�Υd��
�:K"���g�Hk�/R	�!�mj�O���um�e��H{�W�����`�|�� ~��f3���������}�Q@�vc��yטy++J�<U,��П�4@������I��af0wὑM�Lq�����r�����:r�evď�?jGg��^C���0B��|:����ʼ
����!f�Alpqu��]Ҿ��Gy�ih��*=���{�Ώ����Y���Os�)_%8&��I������¾~�ش������	��MP{Ӷd#�G�	ǅ	������URW>C�Ӆ�'�6��L'+�$r3`�^u D�D�0a\�p.h��q��ԉ�2z�ǁ�(���X�o���bn����[��g��Ck��BO+��f2�)�$Bg�毋�e=
�g�p|�\� �r���6���g���ds�� G��9SD|���k����v�O����xN���$�+�r�)�mb���e~V�A)N�A�6�9Ak���R&�pO7�[vu�v�l]�	��^C���T�WЭ�̦^��7�Eƭ�2.��Ǒ2t])���D�~���t��Xbm�$�e����/X�qe��\�熆�h_/(�;���^x�~�tmoB�����`���Jo"�H��eY��|9
��{�ޔ����O`�xRdژ���±%�ߕ��&�p ��[����,�l@�F{H>ÛN������[ZR�ڇ�E1���1"�$��3��:C�^��0�,	d�JCdC����ڝWn~�F'0��	X���ԧ���Ni@b��,D�^���䨃��a��2���-du)A�4ǨYfnn�-�-QK�B�����	���޳H+E#�G!���,���	����|�NN�{��Z;��?8?��|=�kU������pB0��A1��6��eS5)x}3>h�3$;=�׬&��Sn�SQ�4����_�a�AG��#)�*���o	J�"(O�t�ʶ����'?=��b��[l)�Vo�������<U|J.�� =j#�$Ԗ��lsԴ�Y�����=�_��F	C>����vZ��[�TU(&bB<�p��y�����[+�V���-���[v��y����Ū�i匸��j�Z��c�kq�=tX�KU'�����ӲᣡUEg�R�>��<3�=D�>l9J�#hY+/�*H���k��Y?ժ�����(n��Q���ѫE�T�ea-�d$�S�.cM�U1��V	����Q�ꨙV�-�Q�-/ٗ`U��uA\Z�l-�1�'��ղZ%G��Z]n-Z)Ԫ�}>�f��@��:F��J?���̶i&j�û��߈����vo5�8�͇���
���!��$0{��X�ʽm��f$�����t�*o�BeW�im��-51[��겥���rw_*N�Uc��q;;��[���]���Xo:����&Ng������7�ݶa�<d��]9��:;�m�����^쮹b�Z{{ޫ���Tp��#Ŕ;o����JX�#ݠ]qP�H'Rnk��X���Y�`��b�0�2�dy9��7}v��ԊQ�(澉����R~�Z��I�`E�Ki��s����^�V5�*s�@��V)L�f7�� �%-	T�W�Au�]�N5>�`W�o5I,0B˜|��L�P�J�J[�{K�9l���Ձ��O�n��o��::|��w��ݣj���,Tː��f��g1L$�XW7"���ֆ]S\\���%M�JD�N��P,�¨��$~��&�:�)�Q(n�KoA�J�=<8���ί>|>����Q��ՠw���gɋ!��h�J�>��)�È�����wC��<���N��y,�������X�L_�wi�pe��S�>��P�Yx��m�q(��g'�]u�i'��{�4��ܧ^Z�Ɖ ���n�E"t���_��Iqi0=ɑ�3º������yJ؛F,�ȝC���P�R�]#�:�m�aՓ�����`)Y�dݫ^�K��CXӭ�9P�Zӗ�<]��;'�O��0ts�rU&?a�/]� ٮ�57f�_���K�R����?����̵���̌�m������G�M"A�EnJ��U��-��1������gy�_$�Ā#�c���i�5���Y�y�
�%j�ߩԮ8�j
Î�� ]�����Q\�\����7�FM~���C�i"#�A^�KHHD���&�C(��_����x����w󹙽�I�#[M���@�J�'�V|m��}�|ʩo��32|��j��8Y�jHa���&Y�ݳ��6K~��t��.]���1Fq'  