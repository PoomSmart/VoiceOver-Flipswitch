#import <Foundation/Foundation.h>
#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
#import <version.h>

@interface VoiceOverSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSVoiceOverTouchEnabled();
extern "C" void _AXSVoiceOverTouchSetEnabled(BOOL enabled);

@implementation VoiceOverSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return _AXSVoiceOverTouchEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSVoiceOverTouchSetEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier {
	NSURL *url = [NSURL URLWithString:IS_IOS_OR_NEWER(iOS_13_0) ? @"prefs:root=ACCESSIBILITY&path=VOICEOVER_TITLE#VoiceOverTouchEnabled" : @"prefs:root=General&path=ACCESSIBILITY/VOICEOVER_TITLE#VoiceOverTouchEnabled"];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end