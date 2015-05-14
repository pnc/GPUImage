//
//  PCHandleView.m
//  SimpleVideoFilter
//
//  Created by Phil Calvin on 5/12/15.
//  Copyright (c) 2015 Red Queen Coder, LLC. All rights reserved.
//

#import "PCHandleView.h"

@implementation PCHandleView

- (void)drawRect:(NSRect)dirtyRect {  
  // Get the graphics context that we are currently executing under
  NSGraphicsContext* gc = [NSGraphicsContext currentContext];

  // Save the current graphics context settings
  [gc saveGraphicsState];

  // Set the color in the current graphics context for future draw operations
  [[NSColor blackColor] setStroke];
  [[NSColor redColor] setFill];

  // Create our circle path
  NSRect rect = NSMakeRect(10, 10, 10, 10);
  NSBezierPath* circlePath = [NSBezierPath bezierPath];
  [circlePath appendBezierPathWithOvalInRect: rect];

  // Outline and fill the path
  [circlePath stroke];
  [circlePath fill];

  // Restore the context to what it was before we messed with it
  [gc restoreGraphicsState];
}

@end
