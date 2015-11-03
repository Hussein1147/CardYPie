//
//  cardMatchingGame.h
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/25/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface cardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck
                     withCardSet:(NSInteger)cardSet;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property(nonatomic, readonly) NSInteger score;

@end
