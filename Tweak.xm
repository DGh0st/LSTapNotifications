@interface NCNotificationViewController : UIViewController
@end

@interface NCNotificationShortLookViewController : NCNotificationViewController
@end

%hook NCNotificationShortLookViewController
-(void)_loadLookView {
	%orig();

	if (MSHookIvar<UITapGestureRecognizer *>(self, "_tapGesture") == nil) {
		UITapGestureRecognizer *customTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_handleTapOnView:)];
		[self.view addGestureRecognizer:customTapGesture];
		MSHookIvar<UITapGestureRecognizer *>(self, "_tapGesture") = customTapGesture;
	}
}
%end