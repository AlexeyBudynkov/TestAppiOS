//
//  WindowParser.m
//  TestApp
//
//  Created by Алан Максвелл on 04.10.2021.
//  Copyright © 2021 Алан Максвелл. All rights reserved.
//

#import "WindowsParser.h"

typedef enum {
  UIScriptASTDirectionTypeDescendant, UIScriptASTDirectionTypeParent, UIScriptASTDirectionTypeChild, UIScriptASTDirectionTypeSibling,
      UIScriptASTDirectionTypeAcc, UIScriptASTDirectionTypeAccParent
} UIScriptASTDirectionType;

typedef enum {
  UIScriptASTVisibilityTypeVisible, UIScriptASTVisibilityTypeAll
} UIScriptASTVisibilityType;

@interface UIScriptAST : NSObject

- (NSMutableArray *) evalWith:(NSArray *) views direction:(UIScriptASTDirectionType) dir visibility:(UIScriptASTVisibilityType) visibility;

@end

@interface UIScriptASTDirection : UIScriptAST {
  UIScriptASTDirectionType _directionType;
}

@property(nonatomic, assign) UIScriptASTDirectionType directionType;

- (id) initWithDirection:(UIScriptASTDirectionType) direction;


@end

//@implementation UIScriptASTDirection
//@synthesize directionType = _directionType;
//
//
//- (id) initWithDirection:(UIScriptASTDirectionType) direction {
//  self = [super init];
//  if (self) {
//    self.directionType = direction;
//  }
//
//  return self;
//}
//
//
//- (NSString *) description {
//  switch (self.directionType) {
//    case UIScriptASTDirectionTypeDescendant:return @"descendant";
//    case UIScriptASTDirectionTypeParent:return @"parent";
//    case UIScriptASTDirectionTypeChild:return @"child";
//    case UIScriptASTDirectionTypeSibling:return @"sibling";
//    case UIScriptASTDirectionTypeAcc:return @"acc";
//    case UIScriptASTDirectionTypeAccParent:return @"accParent";
//
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wunreachable-code"
//    default:return @"<UNKNOWNDIRECTION";
//#pragma clang diagnostic pop
//  }
//}
//
//@end


@interface UIScriptASTVisibility : UIScriptAST {
  UIScriptASTVisibilityType _visibilityType;
}

@property(nonatomic, assign) UIScriptASTVisibilityType visibilityType;

- (id) initWithVisibility:(UIScriptASTVisibilityType) visibility;


@end



//@implementation UIScriptASTVisibility
//@synthesize visibilityType = _visibilityType;
//
//
//- (id) initWithVisibility:(UIScriptASTVisibilityType) visibility {
//  self = [super init];
//  if (self) {
//    self.visibilityType = visibility;
//  }
//  return self;
//}
//
//
//- (NSString *) description {
//  switch (self.visibilityType) {
//    case UIScriptASTVisibilityTypeVisible:return @"visible";
//    case UIScriptASTVisibilityTypeAll:return @"all";
//
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wunreachable-code"
//    default:return @"<UNKNOWN_VISIBILITY>";
//#pragma clang diagnostic pop
//  }
//}
//
//
//@end





@implementation WindowsParser

NSMutableArray* res;

-(instancetype)init {
    res = [[NSMutableArray alloc] initWithCapacity:8];
    return self;
}

+ (NSArray *) applyOperation:(NSDictionary *) operation
                     toViews:(NSArray *) views
                       error:(NSError *__autoreleasing*) error {
  NSString *operationName = [operation objectForKey:@"method_name"];

  if (!operationName) {  return [views copy];  }

  LPOperation *op = [LPOperation operationFromDictionary:operation];
  NSMutableArray *finalRes = [NSMutableArray arrayWithCapacity:[views count]];

  if (!views) {
    id res = [op performWithTarget:nil error:error];
    if (res != nil) {
      [finalRes addObject:res];
    }
  } else {
    for (id view in views) {
      NSError *err = nil;
      // TODO: Do nothing on error?
      //
      // It is hard to capture the error with the current method signature
      // because nil is a valid response. How would you know if there was an
      // error?
      //
      // What should be done if one view generates and another does not?
      id val = [op performWithTarget:view error:&err];
      if (err) {continue;}
      if (val == nil) {
        [finalRes addObject:[NSNull null]];
      } else {
        [finalRes addObject:val];
      }
    }
  }
  return finalRes;
}

+(void)rotate{
    
    CGRect rect = CGRectMake(186.0f, 330.0f, 43.0f, 21.0f);
    
        UIScreen *mainScreen = [UIScreen mainScreen];
        CGSize screenSize = mainScreen.bounds.size;
    
    UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
    rect = [frontWindow convertRect:rect toCoordinateSpace:frontWindow];
    rect = CGRectMake(186.0f, 330.0f, 43.0f, 21.0f);
    rect = [frontWindow convertRect:rect toCoordinateSpace:mainScreen.fixedCoordinateSpace];
//    rect = CGRectMake(186.0f, 330.0f, 43.0f, 21.0f);
//    rect = [frontWindow convertRect:rect toCoordinateSpace:mainScreen.coordinateSpace];
    rect = CGRectMake(186.0f, 330.0f, 43.0f, 21.0f);
    rect = [frontWindow convertRect:rect toView:frontWindow.superview];
    rect = CGRectMake(186.0f, 330.0f, 43.0f, 21.0f);
    
//    frontWindow.transform = CGAffineTransformRotate(frontWindow.transform, -M_PI_2);
 
//    CGAffineTransform transform = primaryView.transform;
//
//    // Use the status bar frame to determine the center point of the window's content area.
//    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
//    CGRect bounds = CGRectMake(0, 0, statusBarFrame.size.height, statusBarFrame.origin.x);
//    CGPoint center = CGPointMake(60.0, bounds.size.height / 2.0);
//
//    // Set the center point of the view to the center point of the window's content area.
//    primaryView.center = center;
//
//    // Rotate the view 90 degrees around its new center point.
//    transform = CGAffineTransformRotate(transform, (M_PI / 2.0));
//    primaryView.transform = transform;
    
    
    

//        if (_moviePlayer.isFullScreen == NO) {
            if ([mainScreen respondsToSelector:@selector(fixedCoordinateSpace)]) {
                screenSize = [mainScreen.coordinateSpace convertRect:rect toCoordinateSpace:mainScreen.fixedCoordinateSpace].size;
            }
    
//            _moviePlayer.moviePlayer.view.frame = CGRectMake(0,0, screenSize.height, (screenSize.width - _toolBar.frame.size.height - k_status_bar_height - k_navigation_bar_height_in_iphone_landscape));
            
//        } else {
//            if ([mainScreen respondsToSelector:@selector(fixedCoordinateSpace)]) {
//                screenSize = [mainScreen.coordinateSpace convertRect:mainScreen.bounds toCoordinateSpace:mainScreen.fixedCoordinateSpace].size;
//            }
//            _moviePlayer.moviePlayer.view.frame = CGRectMake(0,0, screenSize.height, screenSize.width);
//
//        }
    
}
//
//- (NSArray *) applicationWindows {
//  // iOS flatdacted apparently doesn't list the "real" window containing alerts
//  // in the windows list, but stores it instead in the -keyWindow property. To
//  // fix that, check if the array of windows contains the key window, and
//  // explicitly add it if needed.
//  NSArray *appWindows = [[UIApplication sharedApplication] windows];
//  NSMutableArray *allWindows = [NSMutableArray arrayWithArray:appWindows];
//  UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
//  if (keyWindow && ![allWindows containsObject:keyWindow]) {
//    [allWindows addObject:keyWindow];
//  }
//
//  return allWindows;
//}
//
//- (NSArray *) evalWith:(NSArray *) views {
//  if ([res count] == 0) {return nil;}
//  UIScriptASTDirectionType dir = UIScriptASTDirectionTypeDescendant;
//  UIScriptASTVisibilityType visibility = UIScriptASTVisibilityTypeVisible;
//
//  //index and first match first = [res objectAtIndex:index];
//  //dir is direction or default direction
//  NSArray *res = views;
//
//  for (UIScriptAST *cur in res) {
//    if ([cur isKindOfClass:[UIScriptASTDirection class]]) {
//      dir = [(UIScriptASTDirection *) cur directionType];
//    } else if ([cur isKindOfClass:[UIScriptASTVisibility class]]) {
//      visibility = [(UIScriptASTVisibility *) cur visibilityType];
//    } else {
//      res = [cur evalWith:res direction:dir visibility:visibility];
//    }
//  }
//  return res;
//}

@end
