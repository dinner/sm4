//
//  HexToStr.m
//  test1110
//
//  Created by zhanglingxiang on 16/11/10.
//  Copyright © 2016年 zhanglingxiang. All rights reserved.
//

#import "HexToStr.h"
#import "sm4.h"
#import "hex2str.h"

#define KEY     "1111111111111111"
typedef unsigned char Uchar;

@implementation HexToStr
///测试 //////
//计算mac
+(unsigned char*)hexEnc:(NSString*)strInput{
    NSData* data = [strInput dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger length = data.length;
    NSUInteger plusLength;
    if(length % 16 == 0){
        plusLength = 0;
    }
    else{
        plusLength = 16 - length % 16;
    }
    NSMutableString* new_str = [[NSMutableString alloc] initWithString:strInput];
    for (int i =0;i < plusLength;i++) {
        [new_str appendString:@" "];
    }
    NSUInteger new_length = length+plusLength;
    Uchar *input = (Uchar*)malloc(sizeof(Uchar)*new_length);
    Uchar *output = (Uchar*)malloc(sizeof(Uchar)*new_length);
    Uchar key[16] = KEY;
    const char *utfChar = [new_str UTF8String];
    memset(input, 0, new_length);
    memcpy(input, utfChar, new_length);
    
    sm4_context ctx;
    unsigned long i;

    sm4_setkey_enc(&ctx,key);
    sm4_crypt_ecb(&ctx,1,new_length,input,output);
    
    for(i=0;i<new_length;i++)
    printf("%02x ", output[i]);
    printf("\n");
    
    unsigned char* c_str = Hex2Str(output,new_length);
    printf("%s\n", c_str);
    
    free(input);
    free(output);
    return c_str;
}

//
+(unsigned char*)hexDec:(NSString*)strInput{
    int inputCharSize = strInput.length/2;
    Uchar* input = (Uchar*)malloc(sizeof(Uchar)*inputCharSize);
    Uchar* output = (Uchar*)malloc(sizeof(Uchar)*inputCharSize);
    for (int i = 0; i<inputCharSize; i++) {
        NSString* str = [strInput substringWithRange:NSMakeRange(i*2, 2)];
        NSString* gw = [str substringWithRange:NSMakeRange(0, 1)]
        ;
        NSString* dw = [str substringWithRange:NSMakeRange(1, 1)];
        int n_gw = [HexToStr str2Int:gw];
        int n_dw = [HexToStr str2Int:dw];
        int result = n_gw * 16 + n_dw;
        input[i] = result;
    }
    Uchar key[16] = KEY;
    
    sm4_context ctx;
    sm4_setkey_dec(&ctx,key);
    sm4_crypt_ecb(&ctx,0,inputCharSize,input,output);
    int kgPos = 0;
    for(int i=0;i<inputCharSize;i++){
        printf("%02x ", output[i]);
        if (output[i] == 32) {
            kgPos = i;
            output[i] = '\0';
        }
    }
    printf("\n");
    free(input);
//    free(output);
    return output;
}

//加密字符串转为十六进制
+(int)str2Int:(NSString*)str{
    char* ch = [str UTF8String];
    int result;
    char c = ch[0];
    if (c >= '0' && c <= '9') {
        return (c - '0');
    }
    if (c == 'a') {
        return 10;
    }
    else if(c == 'b'){
        return 11;
    }
    else if(c == 'c'){
        return 12;
    }
    else if(c == 'd'){
        return 13;
    }
    else if(c == 'e'){
        return 14;
    }
    else if(c == 'f'){
        return 15;
    }
    return 0;
}



@end
