
#include "hex2str.h"

unsigned char* Hex2Str(unsigned char arrB[],int length){
	int iLen = length*2+1;
	unsigned char* ch = (unsigned char*)malloc(sizeof(unsigned char)*iLen);
	unsigned char* p = ch;
	for (int i = 0; i < length; i++)
	{
		int intTmp = arrB[i];
		// 把负数转换为正数
		while (intTmp < 0) {
			intTmp = intTmp + 256;
		}
		// 小于0F的数需要在前面补0
		int fw = intTmp/16;
		int sw = intTmp%16;
		*p++ = Hex2Char(fw);
		*p++ = Hex2Char(sw);
	}
	*p = '\0';
	return ch;
}

unsigned char Hex2Char(int n)
{
	if (n < 10)
	{
		return n + '0';
	}
	else{
		switch(n){
			case 10:{
				return 'a';
			}break;
			case 11:{
				return 'b';
			}break;
			case 12:{
				return 'c';
			}break;
			case 13:{
				return 'd';
			}break;
			case 14:{
				return 'e';
			}break;
			case 15:{
				return 'f';
			}break;
		}
    }
    return 0;
}


