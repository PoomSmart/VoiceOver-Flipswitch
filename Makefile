ARCHS = armv7 armv7s arm64
SDKVERSION = 7.0

include theos/makefiles/common.mk

BUNDLE_NAME = VoiceOver
VoiceOver_FILES = Switch.xm
VoiceOver_LIBRARIES = flipswitch
VoiceOver_INSTALL_PATH = /Library/Switches
VoiceOver_LDFLAGS = -lAccessibility

include $(THEOS_MAKE_PATH)/bundle.mk