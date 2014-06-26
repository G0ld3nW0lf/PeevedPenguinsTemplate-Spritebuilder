//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by Shashank Guduru on 6/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay{
    CCPhysicsNode *_physicsNode;
    CCNode *_levelNode;
    CCNode *_catapultArm;
    CCNode *_contentNode;
}

-(void)didLoadFromCCB{
    
    
    CCScene *level = [CCBReader loadAsScene:@"Levels/Level1"];
    [_levelNode addChild:level];
    
    self.userInteractionEnabled = YES;
    
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    [self launchPenguin];
}

-(void)launchPenguin{
    CCNode *penguin = [CCBReader load:@"Penguin"];
    penguin.position = ccpAdd(_catapultArm.position, ccp(42,140));
    
    [_physicsNode addChild:penguin];
    
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applyForce:force];
    
    self.position = ccp(0, 0);
    CCActionFollow *follow = [CCActionFollow actionWithTarget:penguin worldBoundary:self.boundingBox];
    [_contentNode runAction:follow];
}

-(void)retry{
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"Gameplay"]];
}

@end
