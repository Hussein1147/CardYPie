//
//  cardMatchingGame.m
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/25/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import "cardMatchingGame.h"

@interface cardMatchingGame()
@property(nonatomic,strong) NSMutableArray *cards;
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic) NSInteger cardSet;
@property (nonatomic,strong) NSMutableArray *currentChosenCard;
@property(nonatomic)NSInteger matchscore;

@end

@implementation cardMatchingGame
-(NSMutableArray *)currentChosenCard{
    if (!_currentChosenCard) _currentChosenCard = [[NSMutableArray alloc]init];
    return _currentChosenCard;
}

-(NSMutableArray *)cards{
    if (!_cards) _cards =[[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck withCardSet:(NSInteger)cardSet{

    self =[super init];
    if (self){
        
        self.cardSet =cardSet;
        for (int i =0; i<count; i++) {
            Card *card =[deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
            
                self =nil;
                break;
            }
        }
    }
return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{

    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MATCH_BONUS = 4;
static const int UNMATCHED_PENALTY = 2;
static const int COST_TO_CHOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        if (card.isChosen) {
            card.chosen =NO;
        
        }else{
            self.currentChosenCard =nil;
            // going to match against another card
            for (Card *otherCard in self.cards ) {
                if (otherCard.isChosen && !otherCard.isMatched){
                                            
                
                    [self.currentChosenCard addObject:otherCard];
                }
            }
            
            
        self.matchscore= 0;
                if ([self.currentChosenCard count] == self.cardSet-1){
                    self.matchscore = [card match:self.currentChosenCard];
                    if (self.matchscore){
                        self.score += self.matchscore * MATCH_BONUS;
                        self.score += self.matchscore;
                        for (Card *otherCard in self.currentChosenCard) {
                            otherCard.matched =YES;

                        }
                        card.matched =YES;

                    
                    }else{
                        self.matchscore -=UNMATCHED_PENALTY;
                        self.score -= UNMATCHED_PENALTY;
                        for (Card *otherCard in self.currentChosenCard) {
                            otherCard.chosen = NO;

                        }
                        
                    }
                  }
            self.score -= COST_TO_CHOSE;
            card.chosen =YES;
        
        }
    
    
    }

}






























@end
