//
//  TMFDocument.m
//  testMorph
//
//  Created by Greg on 2014-09-16.
//  Copyright (c) 2014 Tasty Morsels. All rights reserved.
//

#import "TMFDocument.h"
#import "TMFFrameView.h"



@interface TMFDocument ()
@property (weak) IBOutlet TMFFrameView *frameView;
@property (weak) IBOutlet NSButton *Start;
@property (weak) IBOutlet NSTextFieldCell *frameRateLabel;


@property (weak) NSNumber* framesPerSecond;
@property BOOL runningAnimation;




@end

@implementation TMFDocument

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        
        _framesPerSecond = [NSNumber numberWithInt:30];
        _runningAnimation = NO;

    }
    return self;
}

- (IBAction)setFrameRate:(id)sender {
    
    //Slider for frame rate changed
    //  update label
    //  adjust timer
    
    self.framesPerSecond = [NSNumber numberWithInt:[sender intValue]];
    [self.frameRateLabel setStringValue:[NSString stringWithFormat:@"%i",[sender intValue]]];
    if (self.runningAnimation){
        [self.animationTimer invalidate];
        self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / [self.framesPerSecond floatValue])
                                                               target:self
                                                             selector:@selector(updateDisplay)
                                                             userInfo:nil
                                                              repeats:YES];
    }
}







- (IBAction)play:(id)sender{
    if (self.runningAnimation != YES){
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / [self.framesPerSecond floatValue])
                                             target:self
                                           selector:@selector(updateDisplay)
                                           userInfo:nil
                                            repeats:YES];
        self.runningAnimation = YES;
    }
}




- (IBAction)stop:(id)sender{
    [self.animationTimer invalidate];
    self.runningAnimation = NO;
    
}

- (void) updateDisplay{
       [self.frameView setNeedsDisplay:YES];
}


- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"TMFDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return YES;
}

@end
