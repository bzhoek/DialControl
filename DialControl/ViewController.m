#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
  SwirlGestureRecognizer *_recognizer;
  float _value;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  _recognizer = [[SwirlGestureRecognizer alloc]initWithTarget:self action:@selector(rotateAction:)];
  [_recognizer setDelegate:self];
  [self.view addGestureRecognizer:_recognizer];
}

- (void) rotateAction:(SwirlGestureRecognizer *)sender {
  if([sender state] == UIGestureRecognizerStateEnded) {
    return;
  }
  
//  2017-08-03 23:10:37.031 DialControl[35736:4338107] current 1.347900 previous 359.189270 18.117157 Δ -357.841370
//  2017-08-03 23:10:37.410 DialControl[35736:4338107] current 359.866119 previous 0.669312 -340.402802 Δ 359.196808

  
  CGFloat direction = sender.currentAngle - sender.previousAngle;
  if( fabs(direction) > 180 ) {
    direction += direction < 0 ? 360 : -360;
//    direction = direction < 0 ? 360 - sender.previousAngle + sender.currentAngle : -(360 - sender.currentAngle + sender.previousAngle);
  }
  NSLog(@"current %f previous %f %f Δ %f", sender.currentAngle, sender.previousAngle, _value, fmod(direction, 360));
  _value += direction;
}

@end
