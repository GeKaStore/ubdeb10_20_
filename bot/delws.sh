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
�S4�gdelws.sh �V]k�0}ׯ8S¶@U��m��6� �|�$c��ŕ�-����m�a�{�C����_29n��ڇm$0Y K�{}�sϑK/�+��+'�3V?���ʯo{�B\7T��n��RQe�����>Ɂ�=�k�9c�''fLy8;/�Z{���H�����&�tRX�J�.v�V�\a�'�`Sk1O1���������q�nt�ƻS!!l��R�>�&C����$Լ2Kj�� ����d<Z����sļMF?qd��ON�m�'�Ņ��o�����������+|��3\�2��-v������$��!���ڟo�˳F�c��S���Ch�4ĕ#5��Z@lJ�q������q4�ZMG�nB�v�����T� >���0��q�
����A�ngu3uy~��,�K�%d�S�e�%kú����r9��f�0I)��SK�cB�&؇�ҍ�3����˭u�����=Oa����_���>�2̴�#�)%�3)5<Sh���K<��"��Qp�`��V�]�bÆ�Fne8�B�����)���O�>���g	�ֈS�0��TH��Db���'��R>�LD�h<�  