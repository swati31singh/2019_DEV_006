
#import "TicTacToeViewController.h"
#import "TicTacToePresenter.h"


@interface TicTacToeViewController ()

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
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma IBActions

- (IBAction)updateSlot:(id)button {
  // TO-DO - Action to be handled
}

- (IBAction)resetGame {
  // TO-DO - Action to be handled
}


@end
