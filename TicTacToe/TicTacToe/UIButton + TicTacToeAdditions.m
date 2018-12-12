
#import "UIButton + TicTacToeAdditions.h"
#import "Constants.h"

@implementation UIButton (TicTacToeAddition)

- (void)updateForPlayer1 {
    [self setTitle:Player_1_TITLE_STRING forState:UIControlStateNormal];
    self.backgroundColor = [UIColor blueColor];
    self.enabled = false;
}

- (void)updateForPlayer2 {
    [self setTitle:Player_2_TITLE_STRING forState:UIControlStateNormal];
    self.backgroundColor = [UIColor redColor];
    self.enabled = false;
}

- (void)reset {
    self.backgroundColor = [UIColor lightGrayColor];
    [self setTitle:EMPTY_TITLE_STRING forState:UIControlStateNormal];
    self.enabled = true;
}

@end
