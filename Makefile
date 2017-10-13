TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64

GO_EASY_ON_ME = 1
FINALPACKAGE = 1
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = selectiveControls
selectiveControls_FILES = $(wildcard *.xm)
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += selectivecontrols
include $(THEOS_MAKE_PATH)/aggregate.mk
