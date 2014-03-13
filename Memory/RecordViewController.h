//
//  RecordViewController.h
//  Memory
//
//  Created by Danilo Lira de Lima on 11/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <sqlite3.h>

@interface RecordViewController : UIViewController<UITextFieldDelegate,AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)stopAudio:(id)sender;

//database property
@property (strong, nonatomic) IBOutlet UIButton *saveDataButton;
- (IBAction)saveData:(id)sender;
- (IBAction)findContact:(id)sender;
@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *mAVFoundationDB;

@end