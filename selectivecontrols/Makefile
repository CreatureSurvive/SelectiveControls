include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = selectiveControls
selectiveControls_FILES = SCRootListController.m
selectiveControls_INSTALL_PATH = /Library/PreferenceBundles
selectiveControls_FRAMEWORKS = UIKit
selectiveControls_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/selectiveControls.plist$(ECHO_END)
