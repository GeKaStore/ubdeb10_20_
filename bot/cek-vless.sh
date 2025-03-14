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
�S4�gcek-vless.sh �UQO�0~����jM�M��@Eۤi��I�넛8Ő:��:����~�~��NHS}�H����}��w�t��(�'�� q&�!i�c�rq��n	���� P0YXY{��V)�F��d�A���	�����d|���z��;�2{$z������ �>�k�W.��>c�6a��Gx��:
��������C�L�W���@�Ȓ4*��@�)����H���KaŰ�����6�7F,8�"U����rS#���������$��w�B�;en,>*��3V'�����m���^U.�*��RL%�T��)K�3G�.��nH��7�%%IN�v?��\誇n9�V%�J$Q�JS�b�ɲle��}8��΅�Y>��q�p�5Y�2q0���x��{N[�R����1�ӎ���������_J�*.j���fæ�OS���[���
U���4���0l|Z�����G���qr��>�!�^att_� F\����%�xB �'r�u�e�n�(��]9����'�^M���
?���A�i����=6��[ח%�T*{������0-b;+��m�[�r��foæ�6
��(-����=_Qk!�0J��� ���ʯڅ54�; ��ic���y��w���� f�I9ʮ�]�j�ꡣd�H��
B�_�@P =3� #x��40��D�W��ͤ�`>C;��'��x��  