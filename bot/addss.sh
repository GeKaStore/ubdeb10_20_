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
�S4�gaddss.sh �X�R�F��Oq"\&�@�ƌh�x��Pl�p+��{c�fw��LߡO�'�YI�eC��?R��?�g�sў�������P�#���|U�ں��lU�2i�q�.+��t����lU�t����/p'��&��&�jJI�]�X8���da'B��!۷;o�(Դ����2��m�w}F���1�q��)׾C�쌼FN���{ҏ^(m��'&6⤳��IB�}��3�Mp~��/��˞uQ�^�\?7au�Q���l�4>�ڭ18�+e���/" �,��"�h[��?������ţ)���^ةPxޟ]\��ǧ�{RO�|�Ie����n�a�����N���|��Q�4�c<�ˌ�!MG��Ѝ���!�p������-!3&sԬ�̂�$������5KR7
oyw㣌B�.X�A~~�&�C�V͒M�XH�1�'ܲ'\u�(�{o1�Z��wp�ďR��
�C�X�*��
=(�Q|˱�����=&�2iU7���.
L�MZX,"�aCi�1}�ob��5d����8�*���8�Q��P��X�5l��c��T�Q�9��]���D�`��u0��жlN�gz��\G��婰���
�L%nf"7B�0��m����46iݣ�j���X++U�3��p��D�oj+ok+�	���Q*�r�L-�ݬ�)m�.u�N�K��at�_�tXeSL�z�@Fn_�0���q�k�=P*�H��C�.I9��M���1��(_���Ȉ)"�X��0�|[7�zє��k��p��2#�.�s�tE������.�L�ԏų�(,6�NΟ믥��k� ���K
���ً�I.爵�b���G����Lj��lAn;i���R�l�!5l��e3󸶽��CLUϱ��rU27\��U�b+�N�EkU� d���������%j��cN7	��N7�z��.k�(㠱-�N'�n�Q0��~ց@���`��mf����?��V����56GxI���:����db�wo�j�/�?z�X D_N���0�BҠ�"$���(¨�����@���S):�����zvx0g�����C�}ԚB0����I���:������� ��&SXJ�3�@B$@gMQ�~!*j�����[� ������]a,EYX�ƺ@/��r��,YJ�U��y{��b>hVg��*x�J�N�3�	�h^8��A����p��0�t|c��~���uw�e�˄PK�%&ќ�X#����kPN�n&�)��yy��R�AH��t�1/����_�-b�  