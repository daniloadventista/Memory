//
//  AppDelegate.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "CompromissoCShared.h"
#import "CompromissoC.h"


@implementation CompromissoCShared
//@synthesize indexPath;

+ (CompromissoCShared *)defaultStore
{
    static CompromissoCShared *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
        
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init 
{
    self = [super init];
    if(self) {
        
        CompromissoC * c1 = [[CompromissoC alloc] initWithAnexo:@"Danilo"];
        CompromissoC * c2 = [[CompromissoC alloc] initWithAnexo:@"Jaine"];
        CompromissoC * c3 = [[CompromissoC alloc] initWithAnexo:@"Idalia"];
        CompromissoC * c4 = [[CompromissoC alloc] initWithAnexo:@"Idevaldo"];
        CompromissoC * c5 = [[CompromissoC alloc] initWithAnexo:@"Daniel"];
        
        allItems = [[NSMutableArray alloc] initWithArray: [NSArray arrayWithObjects:c1, c2, c3,c4,c5, nil]];
        
    }
    return self;
}

- (void)removeItem:(CompromissoC *)p
{
    [allItems removeObjectIdenticalTo:p];
}

- (NSMutableArray *)allItems
{
    return allItems;
}

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to
{
    if (from == to) {
        return;
    }
    // Obtem o objeto na posicao de destino, para memorizar em 'p'
    CompromissoC *p = [allItems objectAtIndex:from];

    // Remove o objeto da posicao destino
    [allItems removeObjectAtIndex:from];

    // Insere o objeto memorizado em 'p' na posicao destino
    [allItems insertObject:p atIndex:to];
}

- (void)addItem: (CompromissoC *)c;
{
    [allItems insertObject:c atIndex:0];
   
}
@end
