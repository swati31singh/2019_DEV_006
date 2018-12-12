
#import <Foundation/Foundation.h>

/* protocol for communicating with the controller */
@protocol TicTacToeGameProtocol <NSObject>

- (void)finishGameWithWinner;

- (void)proceedGame;

@end

@interface TicTacToePresenter : NSObject

/* Controller delegates reference */
@property(weak, nonatomic) id <TicTacToeGameProtocol> delegate;

/*This method checks out for the winning combination */
- (BOOL)isWinningCombination:(NSArray *)boardValuesArray;

/* initiate the class with Controllers delegate */
- (instancetype)initWithDelegate:(id <TicTacToeGameProtocol>)delegate;

/* Check for all the same values in an array */
- (BOOL)ifIdenticalValuesInArray:(NSArray *)array;

/*This method do the analysis for winning combination in the given board values*/
- (void)analyzeRowsColumnsAndDigonals:(NSArray *)boardValues;

@end


