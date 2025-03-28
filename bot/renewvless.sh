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
�S4�grenewvless.sh �U�N�0�?Oq� ($m�ii��	i�ئ�R�8.�&N;@ǐ�{�=��v��[�V������󙥜�gg9��aE���N�����_�MaFZa��p��}�r�/�SI��Eʥ����P�<��;˗/+B�Ӓ�����pł+���49�>�� �X���a�~�����
�2/����f�%ͽ�4�,���z/y)h��	2Pᇣ�La�7p��:��X2.*_��9��<���Lsc(d�^^"H�,Q�EI��z�����m�� 1��U��<�^L���!fTR:Sɴ|�=�d���A��rEF�TR`�6��b���&.�0!��2��<��,NJ��>n��Aj�\\��ڰh���5f���*Vױ5;�򊝵�,���q���׆���ffbDBb���B�����ڐ��8�w�6��t�sbD��kv�������	���ݺ����`��Fs,�K�S�ak�����k�e?��,q��!rat��KˈPm����#փ ?�!x"2�i(l�ۈ�0}�x�@Kݐ:N��`5y~�R�e��zz���2ԫW[�W^^�
���۶�m���b.ϘJ��HEQ�ڝVd�/Q�)������e�\�^ׄF�C־�>R	�*�pn�)���c�d���y�pL���a��u}-@ۍ��k�S^��\ H���i��.��B�
�P6�\��j�Ru���gSo	  