
#import "TicTacToeViewController.h"
#import "TicTacToePresenter.h"
#import "UIButton + TicTacToeAdditions.h"
#import "Constants.h"


NSInteger const kFirstPlayer = 1;
NSInteger const kSecondPlayer = 2;
NSString *const kPlayer1WinsMessage = @"Player 1 wins!";
NSString *const kPlayer2WinsMessage = @"Player 2 wins!";
NSString *const kGameDrawMessage = @"Its a draw!";

@interface TicTacToeViewController () <TicTacToeGameProtocol>

/* Outlets for game slot buttons */
@property(weak, nonatomic) IBOutlet UIButton *slot0button;
@property(weak, nonatomic) IBOutlet UIButton *slot1button;
@property(weak, nonatomic) IBOutlet UIButton *slot2button;
@property(weak, nonatomic) IBOutlet UIButton *slot3button;
@property(weak, nonatomic) IBOutlet UIButton *slot4button;
@property(weak, nonatomic) IBOutlet UIButton *slot5button;
@property(weak, nonatomic) IBOutlet UIButton *slot6button;
@property(weak, nonatomic) IBOutlet UIButton *slot7button;
@property(weak, nonatomic) IBOutlet UIButton *slot8button;
@property(weak, nonatomic) IBOutlet UIButton *playAgainButton;
@property(weak, nonatomic) IBOutlet UIButton *resetButton;
@property(weak, nonatomic) IBOutlet UILabel *winningTextLabel;
@property(strong, nonatomic) NSMutableArray *gameSlotButtons;
/* Outlets for boundayView of the board */
@property(weak, nonatomic) IBOutlet UIView *leftBoundary;
@property(weak, nonatomic) IBOutlet UIView *rightBoundary;
@property(weak, nonatomic) IBOutlet UIView *topBounbary;
@property(weak, nonatomic) IBOutlet UIView *bottomBounbary;
@property(strong, nonatomic) TicTacToePresenter *presenter;
@property(nonatomic) NSInteger currentPlayer;

/* Selector for handling the player`s click on each slot */
- (IBAction)updateSlot:(id)button;

/* This method does the initial setting for the game */
- (void)initialSetup;

/* Selector for resetting the game */
- (IBAction)resetGame;

/* This method reads the values from the slots and return them in an array */
- (NSArray *)getValueFromBoard;

/* This method updates UI when game gets over */
- (void)gameOverWithWinner:(BOOL)isWinner;

/* This method checks if there are more slots available to play and returns Bool */
- (BOOL)areMoreMovesLeftToPlay;

/* This methods highlights the game board boundary on game over */
- (void)highlightBoundary:(BOOL)isHighlight;

@end

@implementation TicTacToeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialSetup];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initialSetup {
    self.presenter = [[TicTacToePresenter alloc] initWithDelegate:(id <TicTacToeGameProtocol>) self];
    self.gameSlotButtons = [[NSMutableArray alloc] initWithObjects:self.slot0button, self.slot1button, self.slot2button, self.slot3button, self.slot4button, self.slot5button, self.slot6button, self.slot7button, self.slot8button, nil];
    self.playAgainButton.backgroundColor = [UIColor blackColor];
    self.currentPlayer = kFirstPlayer;
    for (UIButton *button in self.gameSlotButtons) {
        [button reset];
    }
}

#pragma IBActions

- (IBAction)updateSlot:(id)button {
    if (self.currentPlayer == kFirstPlayer) {
        [button updateForPlayer1];
        self.currentPlayer = kSecondPlayer;
    } else {
        [button updateForPlayer2];
        self.currentPlayer = kFirstPlayer;
    }

    [self.presenter analyzeRowsColumnsAndDigonals:[self getValueFromBoard]];
}

- (IBAction)resetGame {
    for (UIButton *button in self.gameSlotButtons) {
        [button reset];
    }
    self.winningTextLabel.text = EMPTY_TITLE_STRING;
    self.currentPlayer = kFirstPlayer;
    self.playAgainButton.hidden = YES;
    self.resetButton.hidden = NO;
    [self highlightBoundary:NO];
}

#pragma Private methods

- (NSArray *)getValueFromBoard {
    NSMutableArray *valueArray = [[NSMutableArray alloc] init];
    for (UIButton *button in self.gameSlotButtons) {
        if (button.currentTitle) {
            [valueArray addObject:button.currentTitle];
        }
    }
    return valueArray;
}

- (void)gameOverWithWinner:(BOOL)isWinner {
    NSString *endMessage;
    if (isWinner) {
        if (self.currentPlayer == kFirstPlayer) {
            endMessage = kPlayer2WinsMessage;
        } else {

            endMessage = kPlayer1WinsMessage;
        }
    } else {
        endMessage = kGameDrawMessage;
    }
    [self highlightBoundary:YES];
    self.winningTextLabel.text = endMessage;
    [self enableButtons:NO];
    self.resetButton.hidden = YES;
    self.playAgainButton.hidden = NO;
}

- (void)enableButtons:(BOOL)enabled {
    for (UIButton *button in self.gameSlotButtons) {
        button.enabled = enabled;
    }
}

- (BOOL)areMoreMovesLeftToPlay {
    BOOL flag = NO;
    for (UIButton *button in self.gameSlotButtons) {
        if (button.enabled) {
            flag = YES;
        }
    }
    return flag;
}

- (void)highlightBoundary:(BOOL)isHighlight {
    if (isHighlight) {
        self.leftBoundary.backgroundColor = [UIColor blackColor];
        self.rightBoundary.backgroundColor = [UIColor blackColor];
        self.topBounbary.backgroundColor = [UIColor blackColor];
        self.bottomBounbary.backgroundColor = [UIColor blackColor];
    } else {
        self.leftBoundary.backgroundColor = [UIColor whiteColor];
        self.rightBoundary.backgroundColor = [UIColor whiteColor];
        self.topBounbary.backgroundColor = [UIColor whiteColor];
        self.bottomBounbary.backgroundColor = [UIColor whiteColor];
    }
}

#pragma  Protocol methods

- (void)finishGameWithWinner {
    [self gameOverWithWinner:YES];
}

- (void)proceedGame {
    if (![self areMoreMovesLeftToPlay]) {
        [self gameOverWithWinner:NO];
    }
}


@end
