//
//  PlayingCard.h
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/24/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
