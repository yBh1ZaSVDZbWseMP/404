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
BZh91AY&SYv�b� _�E����?n߾����    P��^�un㳰��D�&?Ti�=��5��H��0�G��G�z����&��zz�SI���� 40�b@� �"5OL�S���L��1�2�h�4i�4�P�4ha!��44ɣ@2@ h$��j�S!�hd  �@�4�@  F�0q��âo�.���u�h���W�<�����6���Xy��hB�ƿMΉå�,����"fRIq�e��N/�r�b��ž�J���U��t�V�(�Q�w�s�).¸ʲ��l�l'I���s꠿�YV��Y�W�$��SF����a�����5��%���z�֡�O�(��P�2�F���`�����%Q:���q��P35���͚N��o�7�ʶ]��:�_����(b�$E��N�Э�V'!j�F?|3�$I��A�4�dD��C���O*�Np�`U�uCk8�J���CE��7�$��c[�7��`��q���&S&P�7�ʴFВ�k{RD�:vp�cW6%N�	�Bܺ���I�j#���!3�dl,�F��X���
#��5�p�Z{kQnX2��Y�����-�=�)��2���!�%��Y/��)]Dc�Ì7!�cuXW3h,��I�,��h�"(��Z���mJ����,��Y^��&DV<�L2U��B!��
qL*{[F	
«.�B�	H�.��Qei#(q�K1�8z�d2��D=�:1�4����F�Er���&XF����h>S@&�b`��g]��ј[q�NġqT�B�A�J��R�D5�ӆ{�QNs�)Y��0��#��,��.�m�t�����&TN:/�șN��HX��#TF%�B�q�:[h�1�)�ZӭX{ͶH'��G��5[`'/O}&cT�
�hˢ �?!y���X�	Q�XT��RM:�*��BiXa��QS(�xcGFK�0쀂D��n����� ��ǥ]T�'�����"N�Z�ʓ��a`�Q���$���M�A%��]��BA�9��