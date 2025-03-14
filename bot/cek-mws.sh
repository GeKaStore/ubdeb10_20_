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
�S4�gcek-mws.sh �R�j�0��S�X��]
!�J��^gq�U�J�%'�/�}�>I�dc��b��������26BI����	��TeX��3�?un��|�sB���#X,�`�t)���N��.��J]�g�G����>�u��U���1���d8�/N�uLkK[��nZr�OC%WW���uC�R�����?^ڠ��<���T&�RG)GK䐉Ga�5YG&����#!7q�TD��!���VV;-x�N��E#.k��$0@�V��_)��%��D٢���`旋���B=���<�1�+���<�O��[ �Ktx,ʈ��4��m#ޭx��e�"��k�<��V�b�^�!��h��Q��etm��pH���U��tt���$@?����ھ��S;�tU!��f�[��^�ZIng(�� /� 3�  