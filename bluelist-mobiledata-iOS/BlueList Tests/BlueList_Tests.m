//-------------------------------------------------------------------------------
// Copyright 2014 IBM Corp. All Rights Reserved
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-------------------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

// Test-subject headers

#import "IBM_AppDelegate.h"
#import "IBM_CreateEditItemViewController.h"
#import "IBM_ListViewController.h"

@interface BlueList_Tests : XCTestCase {
@private
    IBM_AppDelegate                     *app_delegate;
    IBM_ListViewController              *list_view_controller;
    UIView                              *list_view;
    IBM_CreateEditItemViewController    *create_edit_view_controller;
    UIView                              *create_edit_view;
}

@end

@implementation BlueList_Tests

- (void)setUp {
    app_delegate                = [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyboard    = [UIStoryboard storyboardWithName:@"main" bundle:nil];
    create_edit_view_controller = [storyboard instantiateViewControllerWithIdentifier:@"IBM_CreateEditItemViewController"];
    create_edit_view            = create_edit_view_controller.view;
    list_view_controller        = [storyboard instantiateViewControllerWithIdentifier:@"IBM_ListViewController"];
    list_view                   = list_view_controller.view;
    [list_view_controller loadView];
    [create_edit_view_controller loadView];
}

- (void)testAppDelegate {
    XCTAssertNotNil(app_delegate, @"NO APPLICATION DELEGATE");
}

- (void) testViewBindings {
    XCTAssertNotNil(list_view, @"Failed to load list view");
    XCTAssertNotNil(create_edit_view, @"Failed to load create edit view");
}

@end
