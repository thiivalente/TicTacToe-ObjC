//
//  ViewController.m
//  ticTacToe
//
//  Created by Thiago Valente on 19/03/18.
//  Copyright © 2018 Thiago Valente. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;



@property (weak, nonatomic) IBOutlet UILabel *note1;
@property (weak, nonatomic) IBOutlet UILabel *note2;
// Will show the player turn
@property BOOL changePlayer;
// Increse total round
@property NSInteger count;
// Show if the game is over
@property BOOL gameOver;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _changePlayer = YES; // [ YES = First Player / NO = Second Player ]
    _count = 0; // Initialize in 0 - Increases every round
    _gameOver = NO; // Set gameOver is initialize false
}
- (IBAction)selectOption:(UIButton *)sender {
    
    // If game is over and try to play, restart to start again
    /*
    if(_gameOver){
        [self restartGame:(UIButton *)sender];
    }
    */
    // Check if button is empty [ X or O ]
    if([sender.currentTitle length] == 0 && !_gameOver){
        // If's player 1
        if(_changePlayer){
            [sender setTitle:@"X" forState:UIControlStateNormal];
        }
        // Else, is player 2
        else{
            [sender setTitle:@"O" forState:UIControlStateNormal];
        }
        // Increase total round
        _count++;
        // Show the round
        _note2.text = [NSString stringWithFormat:@"%ldº Round",(long)_count];
        
        // Needs at least 5 rounds to win
        if(_count >= 5){
            // Check if any player won or game over
            [self checkGame:[sender currentTitle]];
        }
        // If game dont over, run
        if(!_gameOver){
            // Show the player turn
            [self showNote];
            // Change player to next step
            _changePlayer = !_changePlayer;
        }
        
    }
}

-(void) playerWon{
    // Clear the first note
    _note1.text = @"";
    // Show which player won
    if(_changePlayer){
        _note2.text = @"Player 1 WON!";
    }else{
        _note2.text = @"Player 2 WON!";
    }
}

-(void) checkGame:(NSString*) value{
    // Will set game over here to dont repeat code, NOTE: else set NO again.
    _gameOver = YES;
    if([_btn1 currentTitle] == value && [_btn2 currentTitle] == value &&  [_btn3 currentTitle] == value){
        [self changeColor:@"green" button:_btn1];
        [self changeColor:@"green" button:_btn2];
        [self changeColor:@"green" button:_btn3];
    }
    else if([_btn4 currentTitle] == value && [_btn5 currentTitle] == value && [_btn6 currentTitle] == value){
        [self changeColor:@"green" button:_btn4];
        [self changeColor:@"green" button:_btn5];
        [self changeColor:@"green" button:_btn6];
    }else if([_btn7 currentTitle] == value && [_btn8 currentTitle] == value && [_btn9 currentTitle] == value){
        [self changeColor:@"green" button:_btn7];
        [self changeColor:@"green" button:_btn8];
        [self changeColor:@"green" button:_btn9];
    }
    else if([_btn1 currentTitle] == value && [_btn4 currentTitle] == value && [_btn7 currentTitle] == value){
        [self changeColor:@"green" button:_btn1];
        [self changeColor:@"green" button:_btn4];
        [self changeColor:@"green" button:_btn7];
    }else if([_btn2 currentTitle] == value && [_btn5 currentTitle] == value && [_btn8 currentTitle] == value){
        [self changeColor:@"green" button:_btn2];
        [self changeColor:@"green" button:_btn5];
        [self changeColor:@"green" button:_btn8];
    }else if([_btn3 currentTitle] == value && [_btn6 currentTitle] == value && [_btn9 currentTitle] == value){
        [self changeColor:@"green" button:_btn3];
        [self changeColor:@"green" button:_btn6];
        [self changeColor:@"green" button:_btn9];
    }else if([_btn1 currentTitle] == value && [_btn5 currentTitle] == value && [_btn9 currentTitle] == value){
        [self changeColor:@"green" button:_btn1];
        [self changeColor:@"green" button:_btn5];
        [self changeColor:@"green" button:_btn7];
    }else if([_btn3 currentTitle] == value && [_btn5 currentTitle] == value && [_btn7 currentTitle] == value){
        [self changeColor:@"green" button:_btn3];
        [self changeColor:@"green" button:_btn5];
        [self changeColor:@"green" button:_btn7];
    }
    else{
        _gameOver = NO;
    }
    // Check
    if(_gameOver){
        [self playerWon];
    }else if(_count == 9){
        // No one won
        _note1.text = @"";
        _note2.text = @"Game Over!";
        [self changeColor:@"red" button:_btn1];
        [self changeColor:@"red" button:_btn2];
        [self changeColor:@"red" button:_btn3];
        [self changeColor:@"red" button:_btn4];
        [self changeColor:@"red" button:_btn5];
        [self changeColor:@"red" button:_btn6];
        [self changeColor:@"red" button:_btn7];
        [self changeColor:@"red" button:_btn8];
        [self changeColor:@"red" button:_btn9];
    }
}


-(void) showNote{
    if(_changePlayer){
        _note1.text = @"Turn of the second player - (O)";
    }else{
        _note1.text = @"Turn of the first player - (X)";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Change color
- (void) changeColor:(NSString*) color button:(UIButton *) sender{
    if([color isEqualToString:@"green"]){
        [sender setTitleColor:[UIColor colorWithRed:0 green:255 blue:0 alpha:1.0] forState:UIControlStateNormal];
    }else if([color isEqualToString:@"red"]){
        [sender setTitleColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
    }else if([color isEqualToString:@"initial"]){
        [sender setTitleColor:[UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
}


- (IBAction)restartGame:(id)sender {
    
    // Set all default values
    _count = 0;
    _changePlayer = YES;
    [self showNote];
    _note2.text = @"";
    _gameOver = NO;
    
    // Clear buttons
    [_btn1 setTitle:@"" forState:UIControlStateNormal];
    [_btn2 setTitle:@"" forState:UIControlStateNormal];
    [_btn3 setTitle:@"" forState:UIControlStateNormal];
    [_btn4 setTitle:@"" forState:UIControlStateNormal];
    [_btn5 setTitle:@"" forState:UIControlStateNormal];
    [_btn6 setTitle:@"" forState:UIControlStateNormal];
    [_btn7 setTitle:@"" forState:UIControlStateNormal];
    [_btn8 setTitle:@"" forState:UIControlStateNormal];
    [_btn9 setTitle:@"" forState:UIControlStateNormal];
    
    // Initial color again
    [self changeColor:@"initial" button:_btn1];
    [self changeColor:@"initial" button:_btn2];
    [self changeColor:@"initial" button:_btn3];
    [self changeColor:@"initial" button:_btn4];
    [self changeColor:@"initial" button:_btn5];
    [self changeColor:@"initial" button:_btn6];
    [self changeColor:@"initial" button:_btn7];
    [self changeColor:@"initial" button:_btn8];
    [self changeColor:@"initial" button:_btn9];
}

@end
