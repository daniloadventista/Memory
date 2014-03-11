//
//  AppDelegate.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//
#import "CompromissoC.h"

@implementation CompromissoC

@synthesize anexos,dataCompromissoC,descricao,nome;

-(CompromissoC*) initWithAnexo:(NSObject *)obj
{
    //chamando nsobject
    self = [super init];
    
    if (self)
    {
        anexos = [[NSMutableArray alloc]init];
        //adiciona o obj (audio, videos, etc)
        [anexos addObject:obj];
    }
    return self;
}

-(NSString*)primeiraLetraNome{
    return [[[self nome] substringToIndex:1] capitalizedString];
}
@end
