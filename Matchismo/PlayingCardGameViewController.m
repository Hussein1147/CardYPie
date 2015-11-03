//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by DJIBRIL KEITA on 9/10/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController
-(Deck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}

@end
