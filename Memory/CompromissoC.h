//
//  CompromissoC.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompromissoC : NSObject

{
    //audio, video , imagens, etc...
    NSMutableArray  *anexos;
    //data e horario
    NSDate          *dataCompromissoC;
    NSDate          *dataCriacao;

    //variaveis em texto para usuários que queiram utilizá-las
    NSString        *descricao;
    NSString        *nome;
    int             *mId;
    //possiveis melhorias
//    x               *localizacao;
    
}

@property NSMutableArray  *anexos;
@property NSDate          *dataCompromissoC;
@property NSDate          *dataCriacao;
@property NSString        *descricao;
@property NSString        *nome;
@property int             *mId;


-(CompromissoC*) initWithAnexo:(NSObject*)obj;
-(NSString*)primeiraLetraNome;
@end
