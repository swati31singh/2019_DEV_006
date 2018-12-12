
#import <Foundation/Foundation.h>

@interface TicTacToePresenter : NSObject

/*This method checks out for the winning combination */
- (BOOL)isWinningCombination:(NSArray *)boardValuesArray;

/* Check for all the same values in an array */
- (BOOL)ifIdenticalValuesInArray:(NSArray *)array;

@end


