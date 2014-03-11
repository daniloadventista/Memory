//
//  AppDelegate.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "ViewController.h"
#import "CompromissoC.h"
#import "CompromissoCShared.h"


#pragma mark

@interface ViewController ()

@end

@implementation ViewController
@synthesize novoCompromissoC,headerView,myRow,sections,dados, CompromissoCShared,CompromissoCView,CompromissoCEditando ;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithRed:(193/255) green:(236/255) blue:(187/255) alpha:1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    compromissoCShared = CompromissoCShared.defaultStore;
    
    dados = compromissoCShared.allItems;
    
//    [dados sortWithOptions:0 usingComparator:^(CompromissoC* obj1, CompromissoC* obj2) {
//        NSString *nome1 = obj1.nome;
//        NSString *nome2 = obj2.nome;
//        return [nome1 compare:nome2];
//    }];
//    sections = [[NSMutableDictionary alloc]init];
//    
//     NSLog(@"Dados ordenados:");
//    for (CompromissoC *c in dados) {
//        //contar CompromissoCs da secao
//        NSMutableArray * sec = [sections objectForKey:[c primeiraLetraNome]];
//        if (sec==nil) {
//            NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:[NSArray arrayWithObject:c]];
////            [sections setValue:arr forKey:[c primeiraLetraNome]];
//            [sections setObject:arr forKey:[c primeiraLetraNome]];
//             }else{
//                [sec addObject:c];
//             }
//        NSLog(@"Nome: %@", [c nome]);
//    }
//    self.title = @"CompromissoCs";
    
//    novoCompromissoC = [[VCCompromissoC alloc ]initWithNibName:@"VCCompromissoC" bundle:nil];
//    CompromissoCView = [[VCCompromissoCView alloc ]initWithNibName:@"VCCompromissoCView" bundle:nil];
//    CompromissoCEditando = [[VCCompromissoCEditttt alloc ]initWithNibName:@"VCCompromissoCEditttt" bundle:nil];
    
    UIBarButtonItem *btnAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCompromissoC:)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = btnAdd;
    btnAdd.enabled=TRUE;
//    btnReload.style=UIBarButtonSystemItemRefresh;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//metodos secoes
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return ([sections count]+1);
//    return [dados count];
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //
    
//    NSArray * arr = [sections allKeys];
//    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
//        return [obj1 compare:obj2];
//    }];
//    
//    NSString * titleSec = @"" ;
//    if (section!=0) {
//        titleSec = [arr objectAtIndex:section-1];
//    }
//    
//    return titleSec;
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
//    return [dados count];
//    NSInteger cont = 0;
//    
//    NSArray * arr = [sections allKeys];
//    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
//        return [obj1 compare:obj2];
//    }];
//    
//    NSString * titleSec = @"" ;
//    if (section!=0) {
//        titleSec = [arr objectAtIndex:section-1];
//    }
//    NSMutableArray * arrSec = [sections objectForKey:titleSec];
//    cont = [arrSec count];
//    
////    Region *region = [regions objectAtIndex:section];
//    return cont;
    return [dados count];
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]
        initWithStyle:UITableViewCellStyleSubtitle
        reuseIdentifier:@"idCelula"];
    //TODO fazer if da celula
    
//    NSArray * arr = [sections allKeys];
//    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
//        return [obj1 compare:obj2];
//    }];
    
//    NSString * titleSec = @"" ;
//    if (indexPath.section!=0) {
//        titleSec = [arr objectAtIndex:indexPath.section-1];
//    }
//    NSMutableArray * arrSec = [sections objectForKey:titleSec];
    
    CompromissoC *c ;
    
    NSLog(@"indexPath row: %d", [indexPath row]);
    NSLog(@"indexPath.section: %d", indexPath.section);
    
//    c = [arrSec objectAtIndex:[indexPath row]];
//    myRow++;
    c = [dados objectAtIndex:[indexPath row]];
    
    
    NSString *label = [NSString stringWithFormat:@"%@", [[[c anexos] firstObject] debugDescription] ];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:14.0]];
    [[cell textLabel] setText:[c nome]];
    [[cell detailTextLabel] setFont:[UIFont systemFontOfSize:10.0]];
    [[cell detailTextLabel] setText:label];
    
    NSLog(@"dados count: %d", [dados count]);
    return cell;
}
- (UIView *)headerView
{
    // Se ainda nao tiver carregado a view de cabecalho...
    if (!headerView) {
        // Carrega HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tv viewForHeaderInSection:(NSInteger)sec
{
    if (sec == 0)
    return [self headerView];
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tv heightForHeaderInSection:(NSInteger)sec
{
    if (sec == 0)
    return [[self headerView] bounds].size.height;
    return 0;
}

- (IBAction) addCompromissoC:(id)sender {
//    UIButton *buttonClicked = (UIButton *)sender;
    NSLog(@"add");
//    self.novoCompromissoC.title = @"Novo CompromissoC";
//    [self.navigationController
//     pushViewController:self.novoCompromissoC
//     animated:YES];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSArray * arr = [sections allKeys];
//    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
//        return [obj1 compare:obj2];
//    }];
//    
//    NSString * titleSec = @"" ;
//    if (indexPath.section!=0) {
//        titleSec = [arr objectAtIndex:indexPath.section-1];
//    }
//    NSMutableArray * arrSec = [sections objectForKey:titleSec];
//    CompromissoC* c = [arrSec objectAtIndex:indexPath.row];
//    
//    self.CompromissoCView.CompromissoCEdit = c;
//    self.CompromissoCView.title = c.nome;
//    
//    [self.navigationController
//     pushViewController:self.CompromissoCView
//     animated:YES];
}
//metodo para recarregar tabela
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self viewDidLoad];
    [[self tableView] reloadData];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


@end