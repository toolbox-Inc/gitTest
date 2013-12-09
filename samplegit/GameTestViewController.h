//
//  GameTestViewController.h
//  samplegit
//
//  Created by Ray Amour on 12/9/13.
//  Copyright (c) 2013 Ray Amour. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameTestViewController : UIViewController <AVAudioPlayerDelegate, AVAudioRecorderDelegate>


@property (weak, nonatomic) IBOutlet UIButton *recordPauseButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;


- (IBAction)recordPauseTapped:(UIButton *)sender;
- (IBAction)stopTapped:(UIButton *)sender;
- (IBAction)playTapped:(UIButton *)sender;




@end
