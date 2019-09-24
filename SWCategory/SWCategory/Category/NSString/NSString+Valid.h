//
//  NSString+Valid.h
//  HYPlatform
//
//  Created by hs on 2018/7/13.
//  Copyright © 2018年 hs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Valid)

/**
 *  判断字符串是否是纯中文
 *
 *  @return 返回是否是中文
 */
- (BOOL)sw_isChinese;

/**
 检测字符串是否包含中文
 
 @return yes 是  No 否
 */
-( BOOL)sw_isContainChinese;

/**
 整形
 
 @return  yes 是  No 否
 */
- (BOOL)sw_isPureInt;
/**
 浮点型

 @return  yes 是  No 否
 */
- (BOOL)sw_isPureFloat;

/**
 有效的手机号码
 @return  yes 是  No 否
 */
- (BOOL)sw_isValidMobile;


/**
 判断手机号正确性  （准确的）

 @return  yes 是  No 否
 */
- (BOOL)sw_checkPhone;


/**
 密码:字母或数字 ,长度6~16位
 @return  yes 是  No 否
 */
-(BOOL)sw_checkPassword;

/**
 纯数字
 @return  yes 是  No 否
 */
- (BOOL)sw_isPureDigitCharacters;


/**
 字符串为字母或者数字
 @return  yes 是  No 否
 */
- (BOOL)sw_isValidCharacterOrNumber;


/**
  字符串为字母和者数字
 @return  yes 是  No 否
 */
- (BOOL)sw_isValidCharacterAndNumber;


/**
 *  验证否是是金额（只能是数字，小数点后最多只能有两位）
 *  @return YES为正确
 */
- (BOOL)sw_isMoney;


/**
 去除空格
 @return
 */

-(NSString *)sw_removeSpace;



/**
 判断身份证号码
 
 @return   Yes 正确   NO  不正确
 */
- (BOOL)sw_accurateVerifyIDCardNumber;


#pragma Mark - 银行卡验证有效性
/** 银行卡号有效性问题Luhn算法
 254  *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 255  *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 256  *  16 位卡号校验位采用 Luhm 校验方法计算：
 257  *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 258  *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 259  *  3，将加法和加上校验位能被 10 整除。
 260  */
- (BOOL)sw_bankCardluhmCheck;



/**
 检查邮箱
 @return <#return value description#>
 */
-(BOOL)sw_checkEmail;

/**
 判断证件
 @return <#return value description#>
 */
- (BOOL)sw_checkCard;
@end
