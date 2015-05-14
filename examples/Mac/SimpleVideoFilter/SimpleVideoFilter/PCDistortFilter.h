#import <GPUImage/GPUImage.h>

typedef struct PCDistortPolygon {
  CGPoint topLeft;
  CGPoint bottomLeft;
  CGPoint topRight;
  CGPoint bottomRight;
} PCDistortPolygon;

@interface PCDistortFilter : GPUImageFilter {
  GLint topLeft;
  GLint bottomLeft;
  GLint topRight;
  GLint bottomRight;
}
- (void)setSourcePolygon:(PCDistortPolygon)polygon;
@end
