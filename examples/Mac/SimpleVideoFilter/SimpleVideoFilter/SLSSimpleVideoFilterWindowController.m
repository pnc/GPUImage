#import "SLSSimpleVideoFilterWindowController.h"
#import "PCDistortFilter.h"

@interface SLSSimpleVideoFilterWindowController ()
@property GPUImageFilter *noopFilter;
@property PCDistortFilter *distortFilter;
@end

@implementation SLSSimpleVideoFilterWindowController


- (void)windowDidLoad {
  [super windowDidLoad];
  // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

  // Instantiate video camera
  videoCamera = [[GPUImageAVCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraDevice:nil];
  videoCamera.runBenchmark = YES;

  filter = [PCDistortFilter new];
  PCDistortPolygon polygon;
  polygon.topLeft = CGPointMake(0.3, 0.1);
  polygon.topRight = CGPointMake(0.4, 0.1);
  polygon.bottomLeft = CGPointMake(0.1, 0.8);
  polygon.bottomRight = CGPointMake(0.6, 0.8);
  [(PCDistortFilter *)filter setSourcePolygon:polygon];
  [videoCamera addTarget:filter];
  [videoCamera addTarget:self.videoView];

  self.distortedView.fillMode = kGPUImageFillModePreserveAspectRatio;
  self.videoView.fillMode = kGPUImageFillModePreserveAspectRatio;

  [filter addTarget:self.distortedView];

  // Start capturing
  [videoCamera startCameraCapture];

  // Stupid workaround to capture one image
  //  [videoCamera addTarget:_noopFilter];
  //    double delayToStartRecording = 2.5;
  //    dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, delayToStartRecording * NSEC_PER_SEC);
  //    dispatch_after(startTime, dispatch_get_main_queue(), ^(void){
  //      [_noopFilter useNextFrameForImageCapture];
  //
  //      dispatch_time_t startTime2 = dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC);
  //      dispatch_after(startTime2, dispatch_get_main_queue(), ^(void){
  //        NSImage *image = [_noopFilter imageFromCurrentFramebuffer];
  //        self.videoView.image = image;
  //      });

  //        videoCamera.audioEncodingTarget = movieWriter;
  //        [movieWriter startRecording];
  //
  //        double delayInSeconds = 10.0;
  //        dispatch_time_t stopTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  //        dispatch_after(stopTime, dispatch_get_main_queue(), ^(void){
  //
  //            [filter removeTarget:movieWriter];
  //            videoCamera.audioEncodingTarget = nil;
  //            [movieWriter finishRecording];
  //            NSLog(@"Movie completed");
  //
  //        });
  //});

}

@end
