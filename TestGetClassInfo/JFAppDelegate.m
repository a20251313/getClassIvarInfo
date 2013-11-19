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
#error This file must be compiled with Non_ARC.
#endif


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self myMethod];
    //NSObject
   // Class  class = [self class];
    
   // struct objc_ivar_list  *list = class->ivars;
    
    // Insert code here to initialize your application
}



- (void)myMethod
{
  //  unsigned int outCount = 0, i = 0;
   // objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    const char *className = class_getName([self class]);
    NSString  *strClassName = [NSString stringWithCString:className encoding:[NSString defaultCStringEncoding]];
    NSLog(@"strClassName:%@",strClassName);
    m_strInfo = @"12345";
    self.ivar1 = 12;
    unsigned int   count = 0;
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
            NSLog(@"%@: %@",ivarName,value);
        }else
        {
            if ([ivarTye length] == 1)
            {
                switch (type[0])
                {
                    case 'c':
                    {
                        char c = (char)object_getIvar(self, ivar);
                        NSLog(@"%@: %c",ivarName,c);
                        
                    }
                       
                        break;
                    case 'i':
                    {
                        int c = (int)object_getIvar(self, ivar);
                        NSLog(@"%@: %i",ivarName,c);
                        
                    }
                        break;
                    case 's':
                    {
                        short c = (short)object_getIvar(self, ivar);
                        NSLog(@"%@: %i",ivarName,c);
                        
                    }
                        break;
                    case 'l':
                    {
                        long c = (long)object_getIvar(self, ivar);
                        NSLog(@"%@: %ld",ivarName,c);
                        
                    }
                        break;
                    case 'q':
                    {
                        long long c = (long long)object_getIvar(self, ivar);
                        NSLog(@"%@: %lld",ivarName,c);
                        
                    }
                        
                        break;
                    case 'C':
                    {
                        unsigned char c = (unsigned char)object_getIvar(self, ivar);
                        NSLog(@"%@: %c",ivarName,c);
                        
                    }
                        break;
                    case 'I':
                    {
                        unsigned int c = (unsigned int)object_getIvar(self, ivar);
                        NSLog(@"%@: %d",ivarName,c);
                        
                    }
                        break;
                    case 'S':
                    {
                        unsigned short c = (unsigned short)object_getIvar(self, ivar);
                        NSLog(@"%@: %d",ivarName,c);
                        
                    }
                        break;
                    case 'L':
                    {
                        unsigned long c = (unsigned long)object_getIvar(self, ivar);
                        NSLog(@"%@: %ld",ivarName,c);
                        
                    }
                        break;
                    case 'Q':
                    {
                        unsigned long long c = (unsigned long long)object_getIvar(self, ivar);
                        NSLog(@"%@: %lld",ivarName,c);
                        
                    }
                        break;
                    case 'f':
                    {
                      //  float c = (float)object_getIvar(self, ivar);
                      //  NSLog(@"%@: %f",ivarName,c);
                        
                    }
                        break;
                    case 'd':
                        break;
                    case 'B':
                    {
                        int c = (int)object_getIvar(self, ivar);
                        NSLog(@"%@: %d",ivarName,c);
                        
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
    
    /*
    
    for(i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName)
        {
            const char *propType = property_getAttributes(property);
            NSString *propertyName = [NSString stringWithCString:propName
                                                        encoding:[NSString defaultCStringEncoding]];
            NSString *propertyType = [NSString stringWithCString:propType
                                                        encoding:[NSString defaultCStringEncoding]];
            NSLog(@"propertyName:%@ propertyType:%@",propertyName,propertyType);
            
        }
    }
    free(properties);*/
}

@end
