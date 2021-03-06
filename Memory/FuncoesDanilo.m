//
//  FuncoesByDanilo.m
//  Memory
//
//  Created by Danilo Lira de Lima on 11/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "FuncoesDanilo.h"

@implementation FuncoesDanilo

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(UIColor*)colorWithHexString:(NSString*)hex
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
                           alpha:1.0f];
}

+(NSArray *)listFileAtPath:(NSString *)path
{
    //-----> LIST ALL FILES <-----//
    NSLog(@"LISTING ALL FILES FOUND");
    
    int count;
    
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:NULL];
    for (count = 0; count < (int)[directoryContent count]; count++)
    {
        NSLog(@"File %d: %@", (count + 1), [directoryContent objectAtIndex:count]);
    }
    return directoryContent;
}
+(NSArray *)listFileAtPath2{
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    NSFileManager *mgr = [[NSFileManager alloc] init];

    NSArray *allFiles = [mgr contentsOfDirectoryAtPath:bundlePath error:NULL];
    for (NSString *fileName in allFiles)
    {
//        if ([[fileName pathExtension] isEqualToString:@"mp3"])
//        {
            NSString *fullFilePath = [bundlePath stringByAppendingPathComponent:fileName];
            // fullFilePath now contains the path to your MP3 file
//            DoSomethingWithFile(fullFilePath);
            NSLog(@"fullFilePath: %@",fullFilePath);
            NSLog(@"bundlePath: %@",bundlePath);
//        }
    }
    return allFiles;
}
+ (NSString *) dateString
{
    // return a formatted string
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MMM-YY_a_hh-mm-ss-SSS";
    return [formatter stringFromDate:[NSDate date]];
}

@end
