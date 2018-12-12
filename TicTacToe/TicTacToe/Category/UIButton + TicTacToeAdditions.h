
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton (TicTacToeAddition)

/*This method updates the button display for player 1 "X" */
- (void)updateForPlayer1;

/* This method updates the button display for player 2 "O" */
- (void)updateForPlayer2;

/* This methods sets up the button for new game */
- (void)reset;

@end
