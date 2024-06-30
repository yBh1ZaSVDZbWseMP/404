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
BZh91AY&SY^ѯf  �_�E����?n߾����    Pm�<���v�e�Dɩ�3CSi=&F�� 4�A�da �"f��B����  4 � DL���=!��d��4h=&� � @q��h�#Md& ��d�Jd���h�� ��4� dh ���"W0vdT�e��VC(�}�E�ˁOש:s�J�XD!����Y3m3�z��i���X�Y�P].��iI+�,ц� �Qy0���q�AA&�F��"�_��6x)ފ�<T>�a���m���V1�ld	~�������(@�:wRK����N֨l1��:6)j��(��ot�n��y��b��.�:�!���:I�pÖf�y3f��:ث�囮����;Q �N z��e^l�m:Ep-b-��[O
�i��Ⱥt"�ʟmR[�#~�G�H�N�Kzm���n8c4���Ƕ���pbtJ �L%h"�g�q;N_�~댒�B�"�m�8j�%fyj��c�P�}NE����� D*g=�QC�;B9�o)dib����-SH��$%��
	HOy�@��w1�n��5.YS�f]�q�s���.r1���U�D��٫�:P&P�+�T��M�)6�	X���W_��f�����nY���̵i�	 ̃�u��ٛM�.��"AhWc����s05pA���(B�uk�EE�[���&��Dt�1i@ Ȳ)���d��*&�@0�ҚJmm
gCeC佲�"�NgIŨ!�\>w<�xA��@ߙ�͐30Am�M�CUe�Z�.�i��-�L�F'�)8��bט�5�k��54�]dk�=v����Pz�!��OC^"�5ɕ:[h��j���p�8�-�*e�#xj�0")��k�G~�^��YmN9 �/����J&�Ӣ�!���#� =H�Z�(��e�C�T,��#i�1�J�bA�KG�K�I%a!%���ܑN$�kـ