#import "SwirlGestureRecognizer.h"


@interface SwirlGestureRecognizer()

@property (strong, nonatomic) id target;
@property (nonatomic) SEL action;

@end

@implementation SwirlGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)action {
  if(self = [super initWithTarget:target action:action]) {
    self.target = target;
    self.action = action;
  }
  return self;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [super touchesBegan:touches withEvent:event];
  
  if(touches.count > 1) {
    self.state = UIGestureRecognizerStateFailed;
  }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [super touchesMoved:touches withEvent:event];
  
  UITouch *touch = [touches anyObject];

  self.currentAngle = [self getTouchAngle:[touch locationInView:touch.view] in:touch.view.frame.size];
  self.previousAngle = [self getTouchAngle:[touch previousLocationInView:touch.view] in:touch.view.frame.size];
  
  if([self.target respondsToSelector:self.action]) {
    [self.target performSelector:self.action withObject:self];
  }
  
}

- (float)getTouchAngle:(CGPoint)touch in:(CGSize)frame {
  float x = touch.x - frame.width / 2;
  float y = -(touch.y - frame.height / 2);

  return fmodf(270 - atan2f(y, x) / M_PI * 180 + 180, 360);
}

@end
