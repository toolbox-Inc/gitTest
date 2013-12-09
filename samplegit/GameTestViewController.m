//
//  GameTestViewController.m
//  samplegit
//
//  Created by Ray Amour on 12/9/13.
//  Copyright (c) 2013 Ray Amour. All rights reserved.
//

#import "GameTestViewController.h"

@interface GameTestViewController ()

@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation GameTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.stopButton setEnabled:NO];
    [self.playButton setEnabled:NO];
    
    NSError *error = [[NSError alloc]init];

    
    NSArray *pathComponent = [NSArray arrayWithObjects:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject],@"myAudioMemo.m4a",nil];
	
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponent];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc]init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    
    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:&error];
    self.audioRecorder.delegate = self;
    self.audioRecorder.meteringEnabled = YES;
    
    [self.audioRecorder prepareToRecord];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)recordPauseTapped:(UIButton *)sender {
    
    
    if(self.audioPlayer.playing) {
        [self.audioPlayer stop];
    }
    
    if (!self.audioRecorder.recording) {
        
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [self.audioRecorder record];
        [self.recordPauseButton setTitle:@"Pause" forState:UIControlStateNormal];

    }
    else {
        [self.audioRecorder pause];
        [self.recordPauseButton setTitle:@"Record" forState:UIControlStateNormal];
    }
    
    [self.stopButton setEnabled:YES];
    [self.playButton setEnabled:NO];

}

- (IBAction)stopTapped:(UIButton *)sender {
}

- (IBAction)playTapped:(UIButton *)sender {
}
@end





























