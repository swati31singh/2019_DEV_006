
#import "TicTacToeViewController.h"
#import "TicTacToePresenter.h"
#import "UIButton + TicTacToeAdditions.h"
#import "Constants.h"


NSInteger const kFirstPlayer = 1;
NSInteger const kSecondPlayer = 2;

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

/* Selector for resetting the game */
- (IBAction)resetGame;


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

#pragma  Protocol methods

- (void)finishGameWithWinner {
    // To-Do: Handle the game over condition here.
}

- (void)proceedGame {
   // To-Do: Handle the condition to proceed the game here.
}


@end
