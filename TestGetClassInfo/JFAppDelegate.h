//
//  JFAppDelegate.h
//  TestGetClassInfo
//
//  Created by ran on 13-11-19.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JFTestObject.h"

@interface JFAppDelegate : NSObject <NSApplicationDelegate>
{
    NSString    *m_strInfo;
}

@property (assign) IBOutlet NSWindow *window;
@property(nonatomic)int  ivar1;
@property(nonatomic)float  ivar2;
@property(nonatomic)CGFloat  ivar3;
@property(nonatomic)double  ivar4;
@property(nonatomic)long  ivar5;
@property(nonatomic)long int  ivar6;
@property(nonatomic)CGRect  ivar7;
@property(nonatomic)CGPoint  ivar8;
@property(nonatomic)long long  ivar9;
@property(nonatomic)int  ivar10;
@property(nonatomic)int  ivar11;
@property(nonatomic)int  ivar12;
@property(nonatomic,retain)JFTestObject  *ivar13;

@end
