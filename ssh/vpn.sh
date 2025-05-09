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
�S4�gvpn.sh �W�s7~�_�Ş!��N�R����$��'	P���#�(�IWIǏ��߻:��]�<�8��շ��~Z�~`#�؈�)9�����V�����jox,�"�v�۬L�K��_��(�Z9�\ꄽo��i#X6���v[�ݲ�#�
A�RI'Ѥ�V"��6��/�[�����ΰݹj*�$Z5<tr.Hw���)��ɇs���^���b"п�d*�XR3�>_�כ˖Ň�wlR9'���)P�8 � �3'�N���H�y;��b�ϩA,p��*�F'��u<���
��ׁ�+hs���A��ԡ���S�O�!S����G����	�G���M���zr��dI4&\�6�`.+�`$�. 9Mǟ}�X;e�2@d����H��Gf�{῞8��0���rt�!��r����i��ReK:QY�*��	�R��zLy�4�I`�c˻��H)���&��zbETBղ��Ͱ;���f�Qa�O��M�}#0���E�}&�b��e��V�$t1�#�*L������?ԅ�a�(%9@_\AT�+�m�[�.���i��,���������2DĔpX_�~�nV���?�M7O����h�D�Pc�e����@K���W=899k��.f!Rh���E� �-$sp�"���iD���K9X[D�t<�F8��j{�ɵ�&�Mub)�Ҩ��#��U��O�S�� 杵U0��'M04#��x\K�շ�p��������6�1�O����������]�o�����?Cv��x^�p����<��_���	WN�m��x���G��7 �"����n�m6���d��%�)Ԋ�L�^��]�+@�"�U��Qyyh��!BƝ�6��~���NW���� E�{�uD�M�*���O��$��g"��b�#xV:���h��0�I�b�`S��p�bY��X,r�P�}{Y,W}SǶ�X��C��8�E_��,J�P�}{	,W}Sѧ-ܕz���{�h~���L�l�HP�F:S�'�Y�}p�r��Ǚ�iOH�[R�M�����&�߽^w^�pRN�ZPc��]g�޵޴���������lP�����e�������%����;;^����t�k5� c;��w��}�)������$C���{<�/|J��D,���� x2�6�"n�r��)o��Oݿ��Y��  