#import "PCDistortFilter.h"

NSString *const kPCDistortFilterFragmentShaderString = SHADER_STRING
(
 varying vec2 textureCoordinate;

 uniform sampler2D inputImageTexture;

 uniform vec2 topLeft;
 uniform vec2 bottomLeft;
 uniform vec2 topRight;
 uniform vec2 bottomRight;

 void main()
 {
   vec2 top = mix(topLeft, topRight, textureCoordinate.x);
   vec2 bottom = mix(bottomLeft, bottomRight, textureCoordinate.x);
   vec2 textureCoordinateToUse = mix(top, bottom, textureCoordinate.y);
   gl_FragColor = texture2D(inputImageTexture, textureCoordinateToUse);
 }
 );


@implementation PCDistortFilter
- (id)init;
{
  if (!(self = [super initWithFragmentShaderFromString:kPCDistortFilterFragmentShaderString]))
  {
    return nil;
  }

  topLeft = [filterProgram uniformIndex:@"topLeft"];
  bottomLeft = [filterProgram uniformIndex:@"bottomLeft"];
  topRight = [filterProgram uniformIndex:@"topRight"];
  bottomRight = [filterProgram uniformIndex:@"bottomRight"];

  return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setSourcePolygon:(PCDistortPolygon)polygon {
  [self setPoint:polygon.topLeft forUniform:topLeft program:filterProgram];
  [self setPoint:polygon.bottomLeft forUniform:bottomLeft program:filterProgram];
  [self setPoint:polygon.topRight forUniform:topRight program:filterProgram];
  [self setPoint:polygon.bottomRight forUniform:bottomRight program:filterProgram];
}


@end
