//
//  HexToStr.h
//  test1110
//
//  Created by  on 16/11/10.
//  Copyright © 2016年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HexToStr : NSObject

+(unsigned char*)hexEnc:(NSString*)strInput;//加密
+(unsigned char*)hexDec:(NSString*)strInput;//解密

+(unsigned char*)hexEnc_SensitiveInfo:(NSString*)strInput;//敏感数据加密

@end
