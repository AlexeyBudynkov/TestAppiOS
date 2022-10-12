//
//  WIndowParser.h
//  TestApp
//
//  Created by Алан Максвелл on 04.10.2021.
//  Copyright © 2021 Алан Максвелл. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WindowsParser : NSObject
-(instancetype)init;
//- (NSArray *) applicationWindows;
//- (NSArray *) evalWith:(NSArray *) views;

+ (NSArray *) applyOperation:(NSDictionary *) operation
                     toViews:(NSArray *) views
                       error:(NSError *__autoreleasing*) error;

+(void)rotate;
@end


@interface UIScriptParser : NSObject

@property(nonatomic, strong) NSMutableArray *res;
@property(nonatomic, copy) NSString *script;
@property(nonatomic, copy) NSArray *arrayQuery;

+ (UIScriptParser *) scriptParserWithObject:(id) obj;
+ (UIView *) findViewByClass:(NSString *) className fromView:(UIView *) parent;
- (id) initWithUIScript:(NSString *) script;
- (id) initWithQuery:(NSArray *) aq;
- (void) parse;
- (NSArray *) parsedTokens;
- (NSArray *) evalWith:(NSArray *) views;

@end


@interface LPTouchUtils : NSObject

+ (CGFloat) xOffsetFor4inchLetterBox:(UIInterfaceOrientation) orientation;
+ (CGFloat) yOffsetFor4inchLetterBox:(UIInterfaceOrientation) orientation;
+ (CGFloat) xOffsetForIPhone10LetterBox:(UIInterfaceOrientation) orientation;
+ (CGFloat) yOffsetForIPhone10LetterBox:(UIInterfaceOrientation) orientation;
+ (CGRect) rectByApplyingLetterBoxAndSampleFactorToRect:(CGRect) rect;
+ (CGPoint) centerOfView:(UIView *) view;
+ (BOOL) canFindView:(UIView *) viewToFind
     asSubViewInView:(UIView *) viewToSearch;
+ (CGPoint) centerOfFrame:(CGRect) frame
          shouldTranslate:(BOOL) shouldTranslate;
+ (NSArray *) applicationWindows;
+ (UIWindow *) windowForView:(UIView *) view;
+ (UIWindow *) appDelegateWindow;
+ (BOOL) isViewVisible:(UIView *) view;
+ (NSArray *) accessibilityChildrenFor:(id) view;
+ (void) flashView:(id) viewOrDom forDuration:(NSUInteger) duration;

@end


extern CGFloat LP_MAX_FLOAT;
extern CGFloat LP_MIN_FLOAT;

@interface LPJSONUtils : NSObject

+ (NSString *) serializeDictionary:(NSDictionary *) dictionary;

+ (NSDictionary *) deserializeDictionary:(NSString *) string;

+ (NSString *) serializeArray:(NSArray *) array;

+ (NSArray *) deserializeArray:(NSString *) string;

+ (NSString *) serializeObject:(id) obj;

+ (id) jsonifyObject:(id) obj;

+(id)jsonifyObject:(id)obj fullDump:(BOOL)dump;

@end



@interface LPOperation : NSObject

@property(nonatomic, assign, readonly) SEL selector;
@property(nonatomic, copy, readonly) NSArray *arguments;
@property(nonatomic, assign) BOOL done;

+ (id) operationFromDictionary:(NSDictionary *) dictionary;

+ (NSArray *) performQuery:(id) query;

- (id) initWithOperation:(NSDictionary *) operation;

- (id) performWithTarget:(id) target error:(NSError **) error;

@end


//keyboard visibility

@class LPHTTPConnection;

@protocol LPRoute <NSObject>

@optional
- (void) setParameters:(NSDictionary *) parameters;

- (void) setConnection:(LPHTTPConnection *) connection;

- (BOOL) supportsMethod:(NSString *) method atPath:(NSString *) path;

- (NSDictionary *) JSONResponseForMethod:(NSString *) method
                                     URI:(NSString *) path
                                    data:(NSDictionary *) data;

@end


@interface LPKeyboardLanguageRoute : NSObject <LPRoute>

@end


@interface LPKeyboardLanguageRoute (LPXCTEST)

- (BOOL) canHandlePostForPath:(NSArray *) path;
- (UIWindow *) findKeyboardWindow;
- (UIView *) findKeyboardViewWithWindow:(UIWindow *) window;
- (NSString *) primaryLanguageFromKeyboardView:(UIView *) keyboardView;

@end
