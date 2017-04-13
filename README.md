该demo是基于oc的sm4加解密，

HexToStr.m里定义密钥KEY。

调用：
    NSString* input = @"today is Monday";\n
    unsigned char* ch_enc = [HexToStr hexEnc:input];//加密\m
    NSString* strEnc = [NSString stringWithFormat:@"%s",ch_enc];
    NSLog(@"%@",strEnc);
