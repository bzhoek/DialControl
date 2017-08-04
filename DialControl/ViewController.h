#import <UIKit/UIKit.h>
#import "SwirlGestureRecognizer.h"

@interface ViewController : UIViewController <SwirlGestureRecognizerDelegate, UIGestureRecognizerDelegate>

- (void) rotateAction:(id)sender;

@end

