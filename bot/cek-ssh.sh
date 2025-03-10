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
�S4�gcek-ssh.sh �Uю1}���v'H�V�A��QbHp%��hʴ��Զ���_��/�i~��%�2�UW����{�=����Gl�)6�v�K�M�t����˷�����2�eʯ�(ʦ0*��57w/��?�O�ͥ� ����튘h�U@X�F��������kqM[��\��H4ar=A��7H.�ɔ��u���Q��Q���sk7��{[���B
/�[iV΂�ɱ�p�47�ﾁL�/}_×�kr"/9��Y�	�G�AF��%��DY�C�޵��`�A�M
tY/�g��D�P�1N����+��JMcl���J�g�*�(ľ?���IQ��+�3��
�(~��
����`�F�J�~!�!�X��_�͍����j�<Pi���W�����k"�o����t)˵Tk�����4�'u�>�S�����~��C�=���u��9=��랝{��U�4�P���̛M��SbY�m��Y�S�o��l�Yn{k��B<���_1��w0��ج<z��+�n�N�r3�Ƒ�y(t&�@P<z}#���w���1�&<]@�`%U�Y�� ��3�	  