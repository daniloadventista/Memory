//
//  AppDelegate.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VCCompromissoC;
@class CompromissoCShared;
@class VCCompromissoCEditttt;
@class VCCompromissoCView;

@interface ViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    NSMutableArray *dados;
    NSMutableDictionary  *sections;
    int  myRow;
//    IBOutlet UILabel *lbStatus;
    IBOutlet UIView *headerView;
    VCCompromissoC* novoCompromissoC;
    CompromissoCShared * compromissoCShared;
    
}

@property NSMutableArray *dados;
@property NSMutableDictionary  *sections;
@property int  myRow;
@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet VCCompromissoC *novoCompromissoC;
@property (nonatomic, strong) IBOutlet VCCompromissoCEditttt *CompromissoCEditando;
@property (nonatomic, strong) IBOutlet VCCompromissoCView *CompromissoCView;
@property (nonatomic, strong) IBOutlet CompromissoCShared *CompromissoCShared;

//- (void)removeErrados;
@end
