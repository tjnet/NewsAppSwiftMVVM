# NOTE: please install xcpretty
XCODEBUILD = xcodebuild
DEST = 'platform=iOS Simulator,name=iPhone 6'
WORKSPACE = NewsAppSwiftMVVM.xcworkspace
SCHEME = NewsAppSwiftMVVM
DEBUG = Debug
BUILDACTIONS = clean test
PIPECMD = | xcpretty -c

test:
	$(XCODEBUILD) $(BUILDACTIONS) -workspace $(WORKSPACE) -scheme $(SCHEME) -destination $(DEST) -configuration $(DEBUG) $(PIPECMD)
