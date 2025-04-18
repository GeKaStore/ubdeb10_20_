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
�S4�gcek-mts.sh �R�N�0��S�P�F����!M��HG!$�Cd]Z%�iSش��w�	y������@Z�����l�q�"#��H+��� �TG<�@�taD1�:Cg�1���9#��N�ۇ�d�N(b���4Po�⪿�9D��t08�����_G�[��c��8�A�s�%�MZ�e^���EC^���Z��ը2vZĒTd|{}��Kk���C�,�
�Jm8�O��R�(�-EBf���7
��/B�X&��$�Ƞ����sTf��'����B�?���oِ�:n�ʎ��O*Jf��<y�#�����φS�_��O��MMFd暂�M�b*�L���\�s�,��V�b�^�GD��h�X�z���,�.�60�G�r�Lt/��ܻ��ږ5OسdZ!!�W�e������.��fZ	�Ki���l�!�  