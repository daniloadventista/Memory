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
#import "FuncoesDanilo.h"


#pragma mark

@interface ViewController ()

@end

@implementation ViewController
@synthesize novoCompromissoC,headerView,sections,dados, CompromissoCShared,CompromissoCView,CompromissoCEditando ;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.view.backgroundColor = [FuncoesDanilo colorWithHexString:@"C1ECBB"];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    compromissoCShared = CompromissoCShared.defaultStore;
    
    dados = compromissoCShared.allItems;
    
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
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dados count];
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]
        initWithStyle:UITableViewCellStyleSubtitle
        reuseIdentifier:@"idCelula"];
    //TODO fazer if da celula
    
    CompromissoC *c ;
    
    NSLog(@"indexPath row: %d", [indexPath row]);
    NSLog(@"indexPath.section: %d", indexPath.section);
    
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

    NSLog(@"add");

}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
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