
#import "TicTacToePresenter.h"
#import "Constants.h"

NSInteger const kLeftDiagonalFirstElementIndex = 0;
NSInteger const kDiagonalSecondElementIndex = 4;
NSInteger const kLeftDiagonalThirdElementIndex = 8;
NSInteger const kRightDiagonalFirstElementIndex = 2;
NSInteger const kRightDiagonalThirdElementIndex = 6;
NSInteger const kMaxRowsAndColumns = 3;

@interface TicTacToePresenter ()

@end

@implementation TicTacToePresenter

- (instancetype)initWithDelegate:(id <TicTacToeGameProtocol>)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}

- (void)analyzeRowsColumnsAndDigonals:(NSArray *)boardValues {
    if ([self isWinningCombination:boardValues]) {
        [self.delegate finishGameWithWinner];
    } else {
        [self.delegate proceedGame];
    }
}

- (BOOL)isWinningCombination:(NSArray *)boardValuesArray {
    NSArray *rows;
    NSArray *columns;
    for (int i = 0; i < kMaxRowsAndColumns; i++) {
        // Fetching rows value one by one from the given boardValues
        rows = [NSArray arrayWithObjects:[boardValuesArray objectAtIndex:kMaxRowsAndColumns * i], [boardValuesArray objectAtIndex:kMaxRowsAndColumns * i + 1], [boardValuesArray objectAtIndex:kMaxRowsAndColumns * i + 2], nil];
        
        // Fetching column value one by one from the given boardValues
        columns = [NSArray arrayWithObjects:[boardValuesArray objectAtIndex:i], [boardValuesArray objectAtIndex:i + kMaxRowsAndColumns], [boardValuesArray objectAtIndex:i + kMaxRowsAndColumns * 2], nil];
        
        // checking rows and column array for identical values
        if ([self ifIdenticalValuesInArray:rows] || [self ifIdenticalValuesInArray:columns]) {
            return YES;
        }
    }
    /* if previous checks did not return then check for digonals */
    NSArray *leftDiagnol = [NSArray arrayWithObjects:[boardValuesArray objectAtIndex:kLeftDiagonalFirstElementIndex], [boardValuesArray objectAtIndex:kDiagonalSecondElementIndex], [boardValuesArray objectAtIndex:kLeftDiagonalThirdElementIndex], nil];
    NSArray *rightDiagnol = [NSArray arrayWithObjects:[boardValuesArray objectAtIndex:kRightDiagonalThirdElementIndex], [boardValuesArray objectAtIndex:kDiagonalSecondElementIndex], [boardValuesArray objectAtIndex:kRightDiagonalFirstElementIndex], nil];
    
    // Check for left and right Digonal
    if ([self ifIdenticalValuesInArray:leftDiagnol] || [self ifIdenticalValuesInArray:rightDiagnol]) {
        return YES;
    }
    return NO;
}

- (BOOL)ifIdenticalValuesInArray:(NSArray *)array {
    BOOL flag = NO;
    NSSet *set = [NSSet setWithArray:array];
    if ([set count] == 0) {
        flag = NO;
    } else if ([set containsObject:EMPTY_TITLE_STRING]) {
        flag = NO;
        
    } else if ([set count] == 1) {
        flag = YES;
    } else {
        flag = NO;
    }
    return flag;
}
@end

