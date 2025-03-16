#import <UIKit/UIKit.h>

%hook SBActionButtonMetric

- (void)handleEvent:(NSUInteger)event withContext:(id)context {
    %orig;
    id eventPayload = [context valueForKey:@"eventPayload"];
    NSString *type = [eventPayload objectForKeyedSubscript:@"type"];
    if (![type isEqualToString:@"Pressed"]) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] performSelector:@selector(takeScreenshot)];
    });
}

%end
