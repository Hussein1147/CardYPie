//
//  Deck.h
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/24/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;


@end
