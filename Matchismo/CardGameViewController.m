//
//  CardGameViewController.m
//  Matchismo
//
//  Created by DJIBRIL KEITA on 5/22/14.
//  Copyright (c) 2014 DJIBRILKEITA. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "cardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property(strong, nonatomic) cardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) NSInteger cardSet;
@end

@implementation CardGameViewController



- (IBAction)gameSwitch:(id)sender {
    
    if ([sender isOn]){
        self.cardSet =2;
        
    }else{
    
        NSLog(@"switch is off");
        self.cardSet =3;
    }
}
- (NSInteger)cardSet
{
    if (!_cardSet) _cardSet = 2;
    return _cardSet;
}

-(cardMatchingGame *)game{

    if (!_game)_game = [[cardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                        usingDeck:[self createDeck] withCardSet:self.cardSet];
    return _game;


}

                        
                        
-(Deck *)createDeck{
    return nil;}

    
- (IBAction)resetButton:(UIButton *)sender {
    self.game =nil;
    [self updateUI];
}



- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}
-(void)updateUI{
    
    
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForButton:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self imageForButton:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %ld", (long)self.game.score];
    }
}
- (NSString *)titleForButton:(Card *)card{
    return card.isChosen ? card.contents :@"";
}

-(UIImage *)imageForButton:(Card *)card{
    
    return [UIImage imageNamed:card.isChosen ? @"cardface" : @"cardback"];
    
}




@end
