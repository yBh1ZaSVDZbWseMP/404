#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYA�hG  �_�F����?n߾����    Pm�<�]�a��S#BOS�L�y��&&Ѥ� 6�4Ѧ�S�O(�P��ʟ�e&?U14�	��0�F �!4L�����O$�S�mG��A� z� h�F�h� 10@ 4�� 0&@�I������4 h 42z��4� �D���~�~�l�%w5�����˸�憞�S4Qi�B'�!nٓ�ߕ�ٙ�<o�sj�i�	�$�01D��`��Jlz^DX��TL�k��s����rQ��j�P)�Q��v�[!&�du�w�j1t�嚪N��e]�cA7�+����8��8�-��a����-�wkn�\�����Mz����RӍ�q�ip.b�.�u�!��"<��`]���F�z����5��r���u]w��ޮ`i��*2C�Z�:����T�r�R�%a�j2��וpPļ�m�EN"0R&��H�A\KV�Y�-�pJi��\�QW���Ș��P��NP�+ID̦;V+u���D4�b���=t���g���vu�$'��}�
>32�H�r9�b3N���+�,�Tf�o��!�f�W��4�2��ȹ 1ֹ09b�䂓,�>Q�n'w��>�wc):��!8a�1�
��{�n��reC�_"�0�9��M̺6�N�{�撼��ɲ��JkR3*a�/�2f�Y�Y��z�VB�I̴�=�Pa�F2Uc4��_�rV]��Hu�(,�-j{M�A���[����>����a]7lQmBC�o��G*������Q��C�ژ}���4��36@�0��� �(s�5}��-4�{D���х�*E�bo!4n�OXc.���w3�j�Z���wK�\���Ql��eU��Q��cҢI���MS�@�W�3D+=�]Z��"н�OF@SR��t�O��)��X8�(L�5b��G�zՠ�`ʩ=U�T��&RγC
��i�m��I%�$��HIX�ܑN$c��