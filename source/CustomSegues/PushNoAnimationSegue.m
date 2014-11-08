//
//  PushNoAnimationSegue.m
//  source
//
//  Created by Zhiheng Zhang on 10/29/14.
//  Copyright (c) 2014 Zhiheng Zhang. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

-(void) perform{
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
