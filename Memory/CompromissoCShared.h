//
//  AppDelegate.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CompromissoC;

@interface CompromissoCShared : NSObject
{
    NSMutableArray *allItems;
    NSIndexPath * indexPath;
}
//@property (nonatomic, strong) NSIndexPath * indexPath;

+ (CompromissoCShared *)defaultStore;

- (void)removeItem:(CompromissoC *)c;

- (NSMutableArray *)allItems;

- (void)addItem: (CompromissoC *)c;

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to;

@end
