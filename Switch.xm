#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface VoiceOverSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSVoiceOverTouchEnabled();
extern "C" void _AXSVoiceOverTouchSetEnabled(BOOL enabled);

@implementation VoiceOverSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSVoiceOverTouchEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSVoiceOverTouchSetEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSURL *url = [NSURL URLWithString:(kCFCoreFoundationVersionNumber > 1665.0f ? @"prefs:root=ACCESSIBILITY&path=VOICEOVER_TITLE#VoiceOverTouchEnabled" : @"prefs:root=General&path=ACCESSIBILITY/VOICEOVER_TITLE#VoiceOverTouchEnabled")];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end