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
�S4�gohp.sh �VQ��F~���W�T�1�KCӸg�ds���	3�խw���q���(p��-�������>�p�1a�b��3�|apOr�H�����f�}����du�v��0=/د���`���6bë
r���*+�k�zw+�~Cd�.'{�BO�Q�K���뷶��Uc�LZ�
*�0�Df� >đ�
�b6��Ӝ��S;���BWK0�Q����2����2�1�(Z������Wz��H�frN_�%�N]��嘎�2��t�Ć�Im0����@6�~�Z��%�%@߽�^�'�W����(�&���)HJ�F,җI����M�9K)��n��r��T��r�Bk�Ky[�[���m�2Y��j���V�*)��y<c����,Ĝ�e��u����L���~@wO~ПF^���y������@�Bd ��bw��)F@�{H"�ظG��]��V��5uZoM�8o�N�C-S��Z$�I+���/�!˘	F�}�6����M��H�o�_1Zn~�v��f�.�5����W2�A�6�uZ��#n�oc�[�kOTs�0�`�O6�s�~�r����	ڝ�#&�z��S=P���l8�(��p~?_<(�N�1d�X�񼂃�g�vLT�C5V���Yr�wdyK�x� ��zf=z�\1a��Ѥ;v'��}��
�O_|u�9@N���_�{�^��Џ&^PލG�fzM-���֥V9�_��qM�"ok����1)�$���C�4D�Ѵu\�c��4�}i�_)�������,ʾ��������M�_M��V}4��KǗ�ҏP+?������EI%  