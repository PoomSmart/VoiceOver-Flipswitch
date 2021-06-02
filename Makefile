PACKAGE_VERSION = 1.0.0
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = VoiceOverFS
VoiceOverFS_FILES = Switch.xm
VoiceOverFS_LIBRARIES = flipswitch
VoiceOverFS_INSTALL_PATH = /Library/Switches
VoiceOverFS_LDFLAGS = -lAccessibility

include $(THEOS_MAKE_PATH)/bundle.mk
