//
//  JFAppDelegate.m
//  TestGetClassInfo
//
//  Created by ran on 13-11-19.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFAppDelegate.h"
#import <objc/runtime.h>
@implementation JFAppDelegate
@synthesize ivar1;
@synthesize ivar2;
@synthesize ivar3;
@synthesize ivar4;
@synthesize ivar5;
@synthesize ivar6;
@synthesize ivar7;
@synthesize ivar8;
@synthesize ivar9;
@synthesize ivar10;
@synthesize ivar11;
@synthesize ivar12;
@synthesize ivar13;


#if __has_feature(objc_arc)
#error This file must be compiled with Non_ARC. or will cased crash
#endif


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self myMethod];
    //NSObject
   // Class  class = [self class];
    
   // struct objc_ivar_list  *list = class->ivars;
    
    // Insert code here to initialize your application
}



-(NSString *)description
{
    NSString  *strInfo = nil;
    const char *className = class_getName([self class]);
    NSString  *strClassName = [NSString stringWithCString:className encoding:[NSString defaultCStringEncoding]];
    
    strInfo = [NSString stringWithFormat:@"baseclass:%@ <<%p>> ",strClassName,self];
    
    
    unsigned int  count = 0;
    Ivar *list  =   class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = list[i];
        
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSString  *ivarName = [NSString stringWithCString:name encoding:[NSString defaultCStringEncoding]];
        NSString  *ivarTye = [NSString stringWithCString:type encoding:[NSString defaultCStringEncoding]];
        //id realType = nil; //id object_getIvar(id obj, Ivar ivar)
        //id value = object_getIvar(self, ivar);
        
        if ([ivarTye rangeOfString:@"@"].location != NSNotFound)
        {
            id value = object_getIvar(self, ivar);
            strInfo = [strInfo stringByAppendingFormat:@" %@: %@",ivarName,value];
          //  NSLog();
        }else
        {
            if ([ivarTye length] == 1)
            {
                switch (type[0])
                {
                    case 'c':
                    {
                        char c = (char)object_getIvar(self, ivar);
                      //  NSLog(@"%@: %c",ivarName,c);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %c",ivarName,c];
                        
                    }
                        
                        break;
                    case 'i':
                    {
                        int c = (int)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %i",ivarName,c];
                       // NSLog(@"%@: %i",ivarName,c);
                        
                    }
                        break;
                    case 's':
                    {
                        short c = (short)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %i",ivarName,c];
                       // NSLog(@"%@: %i",ivarName,c);
                        
                    }
                        break;
                    case 'l':
                    {
                        long c = (long)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %ld",ivarName,c];
                       // NSLog(@"%@: %ld",ivarName,c);
                        
                    }
                        break;
                    case 'q':
                    {
                        long long c = (long long)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %lld",ivarName,c];
                     //   NSLog(@"%@: %lld",ivarName,c);
                        
                    }
                        
                        break;
                    case 'C':
                    {
                        unsigned char c = (unsigned char)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %c",ivarName,c];
                      //  NSLog(@"%@: %c",ivarName,c);
                        
                    }
                        break;
                    case 'I':
                    {
                        unsigned int c = (unsigned int)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %d",ivarName,c];
                      //  NSLog(@"%@: %d",ivarName,c);
                        
                    }
                        break;
                    case 'S':
                    {
                        unsigned short c = (unsigned short)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %d",ivarName,c];
                      //  NSLog(@"%@: %d",ivarName,c);
                        
                    }
                        break;
                    case 'L':
                    {
                        unsigned long c = (unsigned long)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %ld",ivarName,c];
                       // NSLog(@"%@: %ld",ivarName,c);
                        
                    }
                        break;
                    case 'Q':
                    {
                        unsigned long long c = (unsigned long long)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %lld",ivarName,c];
                       // NSLog(@"%@: %lld",ivarName,c);
                        
                    }
                        break;
                    case 'f':
                    {
                        float  value = 0;
                        self.ivar2 = 10;
                        object_getInstanceVariable(self,name,(void*)&value);
                        NSLog(@"value:%f",value);
                        //  float c = (float)object_getIvar(self, ivar);
                        //  NSLog(@"%@: %f",ivarName,c);
                        
                    }
                        break;
                    case 'd':
                        break;
                    case 'B':
                    {
                        int c = (int)object_getIvar(self, ivar);
                        strInfo = [strInfo stringByAppendingFormat:@" %@: %d",ivarName,c];
                        //NSLog(@"%@: %d",ivarName,c);
                        
                    }
                        break;
                    default:
                        break;
                }
            }
        }
        
        // NSLog(@"name:%@ type:%@",ivarName,ivarTye);
    }
    
    
    
    free(list);

    
    return strInfo;
}

- (void)myMethod
{
    NSLog(@"self desprition:%@",self);
}

@end
