#import "PCPolygonEditor.h"
#import "PCHandleView.h"

@interface PCPolygonEditor ()
@property NSView *picker;
@end

@implementation PCPolygonEditor

- (void)awakeFromNib {
  [super awakeFromNib];
  PCHandleView *boxView = [[PCHandleView alloc] initWithFrame:NSMakeRect(20, 20, 20, 20)];
  // Uncomment these lines to show overlay, but break distorted view
//  [[self superview] setWantsLayer:YES];
//  [self setWantsLayer:YES];
  [self addSubview:boxView];
  self.picker = boxView;
}

@end
