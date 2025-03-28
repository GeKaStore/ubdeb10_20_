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
�S4�gdel-vless.sh �V�n1��+NJ�g�d�(�2���C�T�D������̃@R�u]�躟Ɨ�Ð *R�h+���c�^���s'�c���ZN�c�xS��d_�w)��+(_鎷�<K��cF���{$�Jw�R�I���1�A��-T8N�9�cD=Ҭ��ͺ҉`Q$�Q���t:���ɦPa�X�xn_ݖ���/v�V5�݀|	a�73����Ť�;���!�4�=�4W�t�m:yؼ�;_ĈE�>�ą}i�l��:��uվ�M�4�|��F���
��z.��26�h�yD��(���x�!"�zA��ZݙN��ӯ �@Y/�kv�����OcDZ�������a���a>l��Y@N"�gL+h�@yR��ፙ��`&b�MFx�1�R�����G��y�<w�V�%�B2�)����̷Ϛ}�=��e���X�2�aD�0�9f�����4�t�8<�=�FE�N��*��t��6��������^�۸ �"B5���cm�l��3�*�J)�R��ne�|2�5+Á��?�&�o�/85�u�z��g
�Bm��0�z�I_� "4��J�37�t��O�/�w�  