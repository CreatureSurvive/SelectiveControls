@interface SBApplication : NSObject
- (id)bundleIdentifier;
@end

@interface SBMediaController : NSObject
+ (id)sharedInstance;
- (SBApplication *)nowPlayingApplication;
@end

@interface SBLockScreenNowPlayingController : NSObject
- (void)setEnabled:(BOOL)enabled;
@end

@interface SBDashBoardNowPlayingController : SBLockScreenNowPlayingController
@end

%hook SBLockScreenNowPlayingController

- (void)setEnabled: (BOOL)enabled {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/User/Library/Preferences/com.creaturecoding.selectivecontrols.plist"];
    NSString *bundleID = [[NSClassFromString(@"SBMediaController") sharedInstance] nowPlayingApplication].bundleIdentifier;

    if ([prefs[@"kSCEnabled"] boolValue] && [prefs[bundleID] boolValue]) {
        enabled = NO;
    }
    %orig(enabled);
}

%end