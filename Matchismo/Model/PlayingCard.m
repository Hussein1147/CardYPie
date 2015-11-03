//
//  PlayingCard.m
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/24/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


-(int)match:(NSArray *)otherCards{
    
    int score =0;

        for (PlayingCard *otherCard in otherCards) {
            if  (otherCard.rank == self.rank){
                score +=4;
            }else if ([otherCard.suit isEqualToString:self.suit]){
                score=1;
            }
            
        }
    
    
    
    return score;

}

- (NSString *)contents{
    
    NSArray *rankStrings = [PlayingCard rankString];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit =_suit; // because I provided a setter a getter
+ (NSArray *)validSuits{
    return @[@"♣️",@"♠️",@"♦️",@"♥️"];

}
+ (NSArray *)rankString{
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];

}
+ (NSUInteger)maxRank{ return [[self rankString] count] -1;}


- (void)setSuit:(NSString *)suit{
    // protecting against setting to invalid suits
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit =suit;
    
    }
}
- (void)setRank:(NSUInteger)rank{
    if (rank <=[PlayingCard maxRank]){
        _rank =rank;
    }
    
}
- (NSString *)suit{

    return _suit ? _suit : @"?";

}



@end
