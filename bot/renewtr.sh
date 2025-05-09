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
�S4�grenewtr.sh �U�N�0��Oq�0PH�T�*�6UҴ�M���8.�&Nf;@ǐ�{�=��v�&�[�V������˙e��gg�A����v�����_�mQN���A?���_�gIg�ǜ+�+*��yFw�/_V�tN%/!9Z]$䚅W&-V�Iz�u�
A�;�JC��:��	�جY�4�U!�P��ks���.9M �%�=QbZ����"�tL��	�!��Y���g\XK�EhY�S��3��D�K!��pyQ�0K�T��e�]��n��� �q��GWe*y݄ΔoB̩�t��I��x��@��s�|[����oQi�A�L�ʡ�u�����pe�m-���i�J����8�x6�} ��L+Fe�<.ԫ�{n�.*vv����iJm	�Y8�.ID,�![N�5���Z�*E���F�����]�������=��s:Yz��[���춂�Ӏ��Eq���9l�}	��`-q%Hz�kE<�4A���-#��`D�1wQ�=�CO����6�kz�[�c0zF7���[�a/HQo��BvPO���W�f��öˢ�!�V��qˍ[�8�Li�3�ᗣ4E=wF�	�E�e��}ԳXf�/��r6�&4���U�b�&���]k<!�G6��^d)ǔ^�F�֢��o�U��g-ʫ���R�Uf;��4��Hhsaa��ʦP{c�w�����r�t	  