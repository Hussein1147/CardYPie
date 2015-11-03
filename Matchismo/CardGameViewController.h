//
//  CardGameViewController.h
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/22/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//  Abstract class subclasses needs to overide protected method

#import <UIKit/UIKit.h>
#import "Deck.h"
@interface CardGameViewController : UIViewController

-(Deck *)createDeck;
@end
