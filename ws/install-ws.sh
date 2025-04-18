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
�S4�ginstall-ws.sh �Tmo�6��_qU��*+�aتI��P7��C�x�S�J���������7�4C��;��y�{9zRT�����|�'B,��y'�)��.im���ع2k���eQx�-55��}�,��Q���[�N��y,b����d��d^�R�L��NI��U�@��6�8��C���c.��#
�/��W ;��$* �zW�$1̎��ep�P�V ���^�!������(i0*iA
�_U�PI�C�u� G�fkMu�j��w�jg�O�G4ƭ3�BT�c_C��ј}��t�����P�od��N�F�@��x���Qۍ���.��;=��zH��Ivz����j�����*��>���*��X�>h'�!>)�5�yHbц���+v�|]�z?3�K��BXh�)!jE�0��&M�X/� �k�����xv�s�_�u(��LD�\�OQw���-�nZ�����6���*���01�3�7�FQs[��i��&�j��7��p^���t,��YM�b����#�lɥ���+���ձ����}���-�e N���Hk�W#�>��!�ƹU�!��Ю��M�e�mgP�c,�w��9���F���E����<?��O'o��WS�}�]L�������q�V���k%lꦸ����+������#���Z�j�/��q6_Hm�G&���Z� y?��M�FC:O+sG=i,�k���r��IuώVV�{�����7vy|���-�7��}�O�����|���!�x����{c���HyH  