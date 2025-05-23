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
�S4�gcek-tr.sh �UQO�0~��8L7jM�M��@Eۤi��I�넛8Ő:��:����~�~��NHS}�H����}w�}�t{�O��Q^�8��ұU��8�}����Xd(�,�,����o�F#��M2� ڇ������]2�ȁ�n�����=�tp��I�~���+�i�q���O�0��ãu�úr]c�[�Rnm2��ڬ�}h RE��a��N��<ǲ̮��$V��~,,pic~cĂ����^�(�L�,`����.��B���A
������X������>���{{U��_��
�J1��Rdj�,��in@�J�!q�ތ��$9��~���Е�n9�V%�J$QԊS��R��h؇sO�\��Ӛ\ǲ,wq�MY�2�q0�ȥx#�{�\�\����1�ӎ ��������r��.jۻ�f�F�K�r�-�S�
U���4���Ga����7����OJ��"�Vc�jaxt��CF\���ܥ�xB 8�9��2�N_�H��]B�����}��`݀*�x;�1^L���{��1��:m�lcWH�u�/%F�+��� �(��x��&n]�E7b��6n:i������)��c���B
��M���A	��Ѡ��]XS&u�`:Yb��E�l�^~<�]�!�����A`�ǎ��k]�W={�l)�B�
�g����V��a"�+@�fRW0��c���O���!  