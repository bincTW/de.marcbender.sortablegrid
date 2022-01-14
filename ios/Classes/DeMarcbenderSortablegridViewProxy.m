/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2010 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "DeMarcbenderSortablegridViewProxy.h"
#import "DeMarcbenderSortablegridView.h"
#import "DeMarcbenderSortablegridItemProxy.h"


@interface DeMarcbenderSortablegridViewProxy ()
@property (nonatomic, readwrite) DeMarcbenderSortablegridViewProxy *gridView;
@end

@implementation DeMarcbenderSortablegridViewProxy

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)_initWithProperties:(NSDictionary *)properties
{
    [super _initWithProperties:properties];
}




- (void)windowDidOpen
{
    if (self){
        [super windowDidOpen];
        [self reposition];
        [(DeMarcbenderSortablegridView *)[self view] initData];
    }
}


- (NSArray *)keySequence
{
    static dispatch_once_t onceToken;
    static NSArray *keySequence = nil;
    dispatch_once(&onceToken, ^{
        keySequence = [[NSArray alloc] initWithObjects:@"columnCount", @"minHorizontalSpacing", @"minVerticalSpacing", @"cellWidth", @"scrollIndicatorInsets",@"waterFallLayout",@"pagingEnabled",@"pagerEnabled",@"pagerFollowsBottomInset",@"scrollType",@"lazyLoadingEnabled",@"showVerticalScrollIndicator",@"showHorizontalScrollIndicator",@"disableBounce",@"pageIndicatorTintColor",@"currentPageIndicatorTintColor",@"itemsBadgeEnabled",@"showDeleteButton",@"deleteButtonImage",nil];
    });
    return keySequence;
}

- (NSString *)apiName
{
  return @"de.marcbender.sortablegridView";
}

- (void)startEditing:(id)args
{
  [self makeViewPerformSelector:@selector(startEditing) withObject:nil createIfNeeded:YES waitUntilDone:NO];
}

- (void)stopEditing:(id)args
{
  [self makeViewPerformSelector:@selector(stopEditing) withObject:nil createIfNeeded:YES waitUntilDone:NO];
}

- (void)initData:(id)args
{
  [self makeViewPerformSelector:@selector(initData) withObject:nil createIfNeeded:YES waitUntilDone:NO];
}



- (void)setDeleteButtonImage:(id)value
{
  closeButtonImage = [TiUtils image:value proxy:self];
}

- (UIImage *)deleteButtonImage
{
    if (closeButtonImage != nil){
        return closeButtonImage;
    }
    else {
        return nil;
    }
}

/*
- (UIImage *)badgeViewImage
{
    if (badgeImage != nil){
        return badgeImage;
    }
    else {
        return nil;
    }
}


- (void)setBadgeViewImage:(id)value
{
  badgeImage = [TiUtils image:value proxy:self];
}
*/



- (id)setCurrentPage:(id)value
{
    [(DeMarcbenderSortablegridView *)[self view] setCurrentPageOfLauncher:[TiUtils intValue:value]];
}

- (id)currentPage
{
    return [(DeMarcbenderSortablegridView *)[self view] currentPageOfLauncher];
}

- (id)pageCount
{
    return [(DeMarcbenderSortablegridView *)[self view] pagesCount];
}


- (void)setVerticalSpacing:(id)value
{
    verticalSpacing = [TiUtils intValue:value];
}
- (int)verticalSpacing
{
    return verticalSpacing;
}


- (void)setData:(id)data
{
  for (DeMarcbenderSortablegridItemProxy *proxy in data) {
    ENSURE_TYPE(proxy, DeMarcbenderSortablegridItemProxy)
        [self rememberProxy:proxy];
  }

  [self replaceValue:data forKey:@"data" notification:NO];
  [self replaceValue:data forKey:@"viewData" notification:YES];
}


- (void)setContentInsets:(id)args
{
  ENSURE_UI_THREAD(setContentInsets, args);
  [(DeMarcbenderSortablegridView *)[self view] setContentInsets:args];
}


#pragma mark Public Methods


- (void)insertItemAtIndex:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    
    [(DeMarcbenderSortablegridView *)[self view] addItem:(DeMarcbenderSortablegridItemProxy*)[args valueForKey:@"item"] atIndex:[TiUtils intValue:@"index" properties:args]];
}



- (void)deleteItemAtIndex:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);

    
    //NSLog(@"[INFO] deleteItemInData %i ",[TiUtils intValue:@"index" properties:args]);

    
    [(DeMarcbenderSortablegridView *)[self view] deleteItemAtIndex:[TiUtils intValue:@"index" properties:args]];
}



- (void)scrollToItemAtIndex:(id)args
{
    ENSURE_ARG_COUNT(args, 2);

    [(DeMarcbenderSortablegridView *)[self view] scrollToItemAtIndex:args];
}


-(void)scrollToBottom:(id)args
{
    //TiThreadPerformOnMainThread(^{
        [(DeMarcbenderSortablegridView *)[self view] scrollToBottom:args];
   // }, NO);
}



@end

