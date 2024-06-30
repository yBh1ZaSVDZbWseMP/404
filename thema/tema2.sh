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
BZh91AY&SY+�s _�F����?�ݾ����    P��=�v���I!4m2���(�=LFjh�@4�MM2z�� 2ROS��2���(bHd� �  � i�DBb��ҏ�6��RP mOQ�  h��ѵ��h�M14!��� %4�i0��L�jm �`@4hPƂ#C D�Jp���_������?LDLv����3Ik��d��z��3š
�64��(ik��:���ev�"F}$��e	E���S����C�ž�J��%���q����j�9�=��j⠢ڍ����}��x�<|���M��ޢ�D�q�nJU勊�ck���	{��k��v��l�jZ��������<t��D�g���7�g}�����*_��2���j�ѢgX�c�m�/�]�����;ipE�g��fH�/G�k��,$mTl�z�$'��I�%�y�����!��5�cΥV�X�f�v�q"�~͉ؕ��ל���"F$�Y!��������'�L�&S9��.�	�Z~M�M��I�Ka��R^����9�2� t9�8i��"I�͌��sL���F�G]��*��<��d�u`WV���P[d�p��`�rǤ���"��9�0�3T�!��yWO�gБr����a���B�>��:N�]/�V��B�*Byg���S<���!�l��׼��*s��Չ�,B<q��D�ո�i��XQK*�����3�"�ʠWH�$�%���1Jf% �2 �	�\T���*� ��ux~�ְq��=,)�p��;RH�5�k$_�4"���NI���eFӆ��cx�I��=��N{6�g`�*V��2�E�R�^t��D��(��h"
VJ�R���"�<
���8�m	���-kj���� �eT<�9��.�>��Q�V��4����@���}���,�=J��ˊ���nPU[��}�U�P*��<3XP���c�<a0�p�S���K|¯�Is-j�����59t�������q1pۧ���$���O1 ��rE8P�+�s