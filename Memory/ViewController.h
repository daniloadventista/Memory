//
//  ViewController.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RecordViewController;
@class CompromissoCShared;


@interface ViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    NSMutableArray *dados;
    NSMutableDictionary  *sections;
//    IBOutlet UILabel *lbStatus;
    IBOutlet UIView *headerView;
    RecordViewController * RVCNovaGravacao;
    CompromissoCShared * compromissoCShared;
    
    
}
@property (nonatomic, strong) IBOutlet RecordViewController * RVCNovaGravacao;

@property NSMutableArray *dados;
@property NSMutableDictionary  *sections;
@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet CompromissoCShared *CompromissoCShared;

//- (void)removeErrados;
@end
