
#import <XCTest/XCTest.h>
#import "TicTacToePresenter.h"

@interface TicTacToeTests : XCTestCase <TicTacToeGameProtocol>
{
    TicTacToePresenter *presenter;
    BOOL successCallBackInvoked;
    BOOL failureCallBackInvoked;
}
@end

@implementation TicTacToeTests

- (void)setUp {
    presenter = [[TicTacToePresenter alloc] init];
    presenter.delegate = self;
}

- (void)tearDown {
    presenter = nil;
}

- (void)testWinningCombinationFirtColumn {
    // " represents empty slots
    //     X O O
    //     X " "
    //     X " "
    
    NSArray *array = [NSArray arrayWithObjects:@"X", @"O", @"O", @"X", @"", @"", @"X", @"", @"", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
}

- (void)testWinningCombinationSecondColumn {
    // " represents empty slots
    //     X O X
    //     X O "
    //     " O "
    
    NSArray *array = [NSArray arrayWithObjects:@"X", @"O", @"X", @"X", @"O", @"", @"", @"O", @"", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
    
}

- (void)testWinningCombinationThirdColumn {
    // " represents empty slots
    //     O O X
    //     " " X
    //     " " X
    
    NSArray *array = [NSArray arrayWithObjects:@"O", @"O", @"X", @"", @"", @"X", @"", @"", @"X", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
}

- (void)testWinningCombinationFirstRow {
    //     X X X
    //     O O X
    //     X O O
    
    NSArray *array = [NSArray arrayWithObjects:@"X", @"X", @"X", @"O", @"O", @"X", @"X", @"O", @"O", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
    
}

- (void)testWinningCombinationSecondRow {
    // " represents empty slots
    //     O O "
    //     X X X
    //     " " "
    
    NSArray *array = [NSArray arrayWithObjects:@"O", @"O", @"", @"X", @"X", @"X", @"", @"", @"", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
}

- (void)testWinningCombinationThirdRow {
    // " represents empty slots
    //     " " "
    //     O O "
    //     X X X
    
    NSArray *array = [NSArray arrayWithObjects:@"", @"", @"", @"O", @"O", @"", @"X", @"X", @"X", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
}

- (void)testWinningCombinationLeftDigonal {
    // " represents empty slots
    //     X O O
    //     " X "
    //     " " X
    
    NSArray *array = [NSArray arrayWithObjects:@"X", @"O", @"O", @"", @"X", @"", @"", @"", @"X", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
}

- (void)testWinningCombinationRightDigonal {
    // " represents empty slots
    //     O O X
    //     " X "
    //     X " "
    
    NSArray *array = [NSArray arrayWithObjects:@"O", @"O", @"X", @"", @"X", @"", @"X", @"", @"", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertTrue(isWinner);
}

- (void)testDrawCondition1 {
    //     O X X
    //     X O O
    //     O X X
    
    NSArray *array = [NSArray arrayWithObjects:@"O", @"X", @"X", @"X", @"O", @"O", @"O", @"X", @"X", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertFalse(isWinner);
}

- (void)testDrawCondition2 {
    //     X O X
    //     X O X
    //     O X O
    
    NSArray *array = [NSArray arrayWithObjects:@"X", @"O", @"X", @"X", @"O", @"X", @"O", @"X", @"0", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertFalse(isWinner);
}

- (void)testDrawCondition3 {
    //     X X O
    //     O O X
    //     X O X
    NSArray *array = [NSArray arrayWithObjects:@"X", @"X", @"O", @"O", @"O", @"X", @"X", @"O", @"X", nil];
    BOOL isWinner = [presenter isWinningCombination:array];
    XCTAssertFalse(isWinner);
}

- (void)testIdenticalStringInArray {
    NSArray *array = [NSArray arrayWithObjects:@"O", @"O", @"O", nil];
    BOOL isIdentical = [presenter ifIdenticalValuesInArray:array];
    XCTAssertTrue(isIdentical);
}

- (void)testNotIdenticalStringInArray {
    NSArray *array = [NSArray arrayWithObjects:@"X", @"O", @"X", nil];
    BOOL isIdentical = [presenter ifIdenticalValuesInArray:array];
    XCTAssertFalse(isIdentical);
}

- (void)testDelegateCallForSuccess
{
    NSArray *array = [NSArray arrayWithObjects:@"O", @"O", @"X", @"", @"X", @"", @"X", @"", @"", nil];
    [presenter analyzeRowsColumnsAndDigonals:array];
    XCTAssertTrue(successCallBackInvoked,@"Success Delegate called");
}
- (void)testDelegateCallForFailure
{
    NSArray *array = [NSArray arrayWithObjects:@"X", @"O", @"X", @"X", @"O", @"X", @"O", @"X", @"0", nil];
    [presenter analyzeRowsColumnsAndDigonals:array];
    XCTAssertTrue(failureCallBackInvoked,@"Failuer Delegate called");
}

#pragma Protocol methods

- (void)finishGameWithWinner {
    successCallBackInvoked = YES;
}
- (void)proceedGame {
    failureCallBackInvoked = YES;
}

@end
