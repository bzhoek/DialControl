#import <Foundation/Foundation.h>
#import <UIKit/UITouch.h>
#import <UIKit/UIView.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@protocol SwirlGestureRecognizerDelegate

@end

@interface SwirlGestureRecognizer : UIGestureRecognizer

@property CGFloat currentAngle;
@property CGFloat previousAngle;

@end
