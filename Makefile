export ARCHS = armv7 arm64
export TARGET = iphone:clang:9.3:latest

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LSTapNotifications
LSTapNotifications_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
