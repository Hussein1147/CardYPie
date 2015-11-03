//
//  Card.m
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/24/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import "Card.h"

@implementation Card


- (int)match:(NSArray *)otherCards
{

    int score =0;
    
    for (Card *card in  otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score =1;
        }
    }
    
    
    
    
    return score;
    

}


@end
