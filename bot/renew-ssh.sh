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
�S4�grenew-ssh.sh �W�n�6���8��:i�ȷ%�S�pb55�؆c��Π%FlQ�(��2�;�	�$;��q:�u�%&ύ�w.��6��6%|&J|��8Y�����h �Ǿ
�g�[w�v5�ەL�	��'�#��P?��ڌS�Qr{AY � �xS�,׵t�pj��W�W�|�A�ǜ��R(s�UDj���#;t��y�V���ҕZrԒ)�j��<��l�%�f}�ܷ�`NCd2\�S��ܦ+�w��Js��Y��%Kƌs�Yn��½�����8%��nE���d9����x J}��o��:��w�@����(C. j�\P�	]pZ�Q�o*��u�������o��ySq�G|l�ȞF�����ǽ�ǣ���;�����)�~�w�}xѽ���{��{]�ϔ���z[06p\�;Wn�Ï�ˈ1�U���p�R���0F���+j<	W@1���2����m/��U�yGB�)�1h��͠�y�T����|��;
��-]fQ���<\�S���Q���P�{��3����D�8��<<�4j��F�?�;;���-���&I��V9=��S�z��'�a��5$���ޙ���H;9(����y��=�N��]H9�C$��9�p��j�v\��|��I�vki���������9�n��͡�?�ŉ>ܦ����'pI�   Ɨ��׾��}�?���[�
*di9� |JLĻg#�$ӕ�?�{-Yى�d+�bQ5���Vwe��y�'*��f0wꚫ�:
��RƌX�,@�R1�mn��8V��J�o�&^yV�kX�e�$���Ηؚ\f�6j;��'���mW+�J^��5Y�u���\Η#E� ���!�R����E�,�#�-�w+z���̃��2�]�FC�����w����1��Z�F��z����2�P�PfY!#��"6��+O`��k�Z3�'���Eԝ�Qwޒ�y��
������������~�-�~�$'�R�$�*�T?�w����tl�}� �Sb���,�g�$h�x�������ˎ��	�R��������9���'�U�Í�Wޠ����yv}����k2���)���ʆ�x�%Wc��'�3rM�ʾ�J|WJ9'��QWwb�/��A�Rٍ��(MN�,b��^l:�-�� ��Ԕ����CG��R��L'~�pv1�ѩ+��h%�I���"���U��J&��P�*�J�搉���q��N%7����ov}� �oX�#��V�= 7O7?����%�=��#g�/���iR�q�ی1�9 <�E��QR������(CQǥ�%%�.-a_W�D��Zn:��  