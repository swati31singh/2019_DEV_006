
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton (TicTacToeAddition)

/* Update the button display for player 1 "X" */
- (void)updateForPlayer1;

/* Update the button display for player 2 "O" */
- (void)updateForPlayer2;

/* set up the button for new game */
- (void)reset;

@end
