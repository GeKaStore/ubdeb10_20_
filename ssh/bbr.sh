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
�S4�gbbr.sh ��]O�0���_q�IM�~Q4���&���r��֪c�i�}v��Q�%�+��yΛsޓ��Mg�DgL��S�S8��$!��|������Z,����8�E���Em~���9���㝙��Z-��|..lP�{��y����f����O1��K��v7_�����)O�|�yI�9׹��[�u�ʬ6�G��\]}s�J�A���Z������A�{�R�r��d%s<V�U�2t��)$�U��o�I�)��ȳ�Y>�2�PL��V\����9��'�렉;�X�Q���I�������2�&X�����a��.	�����%L�p���X>�.�ݛ�6L
�4JrK*�TA�η����Aй�/s��m�U��u�\�k���n�8F��A��թtB��.�+������a{@rM�Р�/��H5��4�ә_5�B1s��V�Y{�-h�2eauð	dJU�B��Ҽ���SK��X�:pQ���#P/v=�*ÌT��i�F�~}��5 v���aȘ�3.'��a����r즰�~x6�EXO����3��b�f� 
��	)Ď��XH/lF�!攳9�,���_J�	�1�$��E��ϱ\�`8Æ�\�m��:?�κ�Y���"��q�k.+�����z�`V�xh�S���U��T��p��0:��f��-�x���7|!/3q�&&�ߟ����eM�=���}_-�U{�
  