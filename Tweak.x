%hook SBActionButtonMetric

- (void)handleEvent:(NSUInteger)event withContext:(id)context {
    %orig;

    id eventPayload = [context eventPayload];
    NSString *type = [eventPayload objectForKeyedSubscript:@"type"];

    if (![type isEqualToString:@"Pressed"]) return;
	
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [[UIApplication sharedApplication] takeScreenshot];
    }];
}

%end