//
//  RecordViewController.m
//  Memory
//
//  Created by Danilo Lira de Lima on 11/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "RecordViewController.h"
#import "FuncoesDanilo.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//
//- (void) findContact:(id)sender
//{
//    const char *dbpath = [_databasePath UTF8String];
//    sqlite3_stmt    *statement;
//    
//    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
//    {
//        NSString *querySQL = [NSString stringWithFormat:
//                              @"SELECT address, phone FROM contacts WHERE name=\"%@\"",
//                              _name.text];
//        
//        const char *query_stmt = [querySQL UTF8String];
//        
//        if (sqlite3_prepare_v2(_contactDB,
//                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
//        {
//            if (sqlite3_step(statement) == SQLITE_ROW)
//            {
//                NSString *addressField = [[NSString alloc]
//                                          initWithUTF8String:
//                                          (const char *) sqlite3_column_text(
//                                                                             statement, 0)];
//                _address.text = addressField;
//                NSString *phoneField = [[NSString alloc]
//                                        initWithUTF8String:(const char *)
//                                        sqlite3_column_text(statement, 1)];
//                _phone.text = phoneField;
//                _status.text = @"Match found";
//            } else {
//                _status.text = @"Match not found";
//                _address.text = @"";
//                _phone.text = @"";
//            }
//            sqlite3_finalize(statement);
//        }
//        sqlite3_close(_contactDB);
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _playButton.enabled = NO;
    _stopButton.enabled = NO;
    _saveDataButton.enabled =NO;
    
    NSArray *dirPaths;
    NSString *docsDir;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    //iniciando gerenciador de audio
    NSString *soundFilePath = [docsDir
                               stringByAppendingPathComponent:@"sound.caf"];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2],
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord
                        error:nil];
    
    _audioRecorder = [[AVAudioRecorder alloc]
                      initWithURL:soundFileURL
                      settings:recordSettings
                      error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [_audioRecorder prepareToRecord];
    }
    
    //iniciando banco de dados
    
    // Build the path to the database file
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:
                                      @"contacts.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];

    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];

        if (sqlite3_open(dbpath, &_mAVFoundationDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS AVFAUDIOS (ID INTEGER PRIMARY KEY AUTOINCREMENT, AUDIO BLOB)";

            if (sqlite3_exec(_mAVFoundationDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }else{
                NSLog(@"Create/Load table");
            }
            sqlite3_close(_mAVFoundationDB);
        } else {
            NSLog(@"Failed to open/create database");
        }
    }

    
    //ver files no path
    [FuncoesDanilo listFileAtPath:soundFilePath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)recordAudio:(id)sender {
    if (!_audioRecorder.recording)
    {
        _playButton.enabled = NO;
        _stopButton.enabled = YES;
        _saveDataButton.enabled =NO;
        [_audioRecorder record];
    }
}

- (IBAction)playAudio:(id)sender {
    if (!_audioRecorder.recording)
    {
        _stopButton.enabled = YES;
        _recordButton.enabled = NO;
        
        NSError *error;
        
        _audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:_audioRecorder.url
                        error:&error];
        
        _audioPlayer.delegate = self;
        
        if (error)
            NSLog(@"Error: %@",
                  [error localizedDescription]);
        else
            [_audioPlayer play];
    }
}

- (IBAction)stopAudio:(id)sender {
    _stopButton.enabled = NO;
    _playButton.enabled = YES;
    _recordButton.enabled = YES;
    _saveDataButton.enabled =YES;
    
    if (_audioRecorder.recording)
    {
        [_audioRecorder stop];
    } else if (_audioPlayer.playing) {
        [_audioPlayer stop];
    }
}
//sqlite3 metodos
- (void) saveData:(id)sender
{
    sqlite3_stmt    *statement;
    const char *dbpath = [_databasePath UTF8String];
    
//    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
//    {
////        "CREATE TABLE IF NOT EXISTS AVFAUDIOS (ID INTEGER PRIMARY KEY AUTOINCREMENT, AUDIO BLOB)";
//        NSString *insertSQL = [NSString stringWithFormat:
//                               @"INSERT INTO AVFAUDIOS (audio) VALUES (\"%@\")
//                               audio];
//        
//        const char *insert_stmt = [insertSQL UTF8String];
//        sqlite3_prepare_v2(_contactDB, insert_stmt,
//                           -1, &statement, NULL);
//        if (sqlite3_step(statement) == SQLITE_DONE)
//        {
//            _status.text = @"Contact added";
//            _name.text = @"";
//            _address.text = @"";
//            _phone.text = @"";
//        } else {
//            _status.text = @"Failed to add contact";
//        }
//        sqlite3_finalize(statement);
//        sqlite3_close(_contactDB);
//    }
}

//delegate metodos
-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
    _recordButton.enabled = YES;
    _stopButton.enabled = NO;
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
}

-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}

@end
