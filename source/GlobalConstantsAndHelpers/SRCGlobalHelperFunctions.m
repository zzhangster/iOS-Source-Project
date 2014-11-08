//////////////////////////////////////////////////////////////////////////////
//  Copyright 2014 Zhiheng Zhang
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//////////////////////////////////////////////////////////////////////////////

#import "SRCGlobalHelperFunctions.h"

@implementation SRCGlobalHelperFunctions

/*================================
 * colorWithHexString
 * -------------------------------
 * 1.) Return UIColor From HEX
 * and Alpha
 * -------------------------------
 *================================*/
+(UIColor*)colorWithHexString:(NSString*)hex alpha:(float)alpha
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

/*================================
 * imageWithColor
 * -------------------------------
 * 1.) Create Image With Color
 * -------------------------------
 *================================*/
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/*================================
 * cellHeightCalculator
 * -------------------------------
 * 1.) Height Calculator
 * -------------------------------
 *================================*/
+ (float) cellHeightCalculator:(NSString*)text
                          font:(UIFont*)font
                    constraint:(CGSize)constraint
                   extraHeight:(float)extraHeight {
    
    // iOS 6 & 7 Support
    CGRect labelRect;
    labelRect = [text boundingRectWithSize:constraint
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{NSFontAttributeName:font}
                                   context:nil];
    return labelRect.size.height + extraHeight;
}

/*==================================
 * cellHeightCalculatorByAttributes
 * ---------------------------------
 * 1.) Cell Height With Attributed
 * String
 * ---------------------------------
 *==================================*/
+ (float) cellHeightCalculatorByAttributes:(NSString*)text
                                attributes:(NSDictionary*)attributes
                                constraint:(CGSize)constraint
                               extraHeight:(float)extraHeight {
    
    // iOS 6 & 7 Support
    CGRect labelRect;
    labelRect = [text boundingRectWithSize:constraint
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:attributes
                                   context:nil];
    return labelRect.size.height + extraHeight;
}

/*================================
 * croppingImageByRect
 * -------------------------------
 * 1.) Image Cropping
 * -------------------------------
 *================================*/
+ (UIImage *)croppingImageByRect:(UIImage *)imageToCrop toRect:(CGRect)rect{
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    /*
     UIImage *img = [UIImage imageNamed:@"myImage"];
     CGRect frame = CGRectMake(0, img.size.height - 200, img.size.width, img.size.height - 200);
     
     img = [img applyLightBluredAtFrame:frame];
     */
    
    return cropped;
}

/*+ (UIImage *)addImageToImage:(UIImage *)img withImage2:(UIImage *)img2 andRect:(CGRect)cropRect {
    
    CGSize size = CGSizeMake(imageView.image.size.width, imageView.image.size.height);
    UIGraphicsBeginImageContext(size);
    
    CGPoint pointImg1 = CGPointMake(0,0);
    [img drawAtPoint:pointImg1];
    
    CGPoint pointImg2 = cropRect.origin;
    [img2 drawAtPoint: pointImg2];
    
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}*/

@end
