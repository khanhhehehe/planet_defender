FLUTTER ?=fvm flutter


.PHONY: gen-code
gen-code:
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs

.PHONY: clean
clean:
	$(FLUTTER) clean
	pod cache clean  --all
	rm -rf ios/Flutter/Flutter.framework
	make init

.PHONY: init
init:
	make git-hook
	git submodule update --init
	git submodule update --recursive --remote
	git pull --recurse-submodules
	$(FLUTTER) pub get
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs

.PHONY: build-apk
build-apk:
	$(FLUTTER) pub get
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs
	$(FLUTTER) build apk

.PHONY: build-ipa
build-ipa:
	$(FLUTTER) pub get
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs
	$(FLUTTER) build ipa --release

.PHONY: git-hook
git-hook:
	# Allow bash script execute
	chmod -R 777 .githooks
	# Authorize system can run all script in scripts folder
	chmod -R 777 scripts
	# Distinct the case sensitive file name
	git config core.ignorecase false
	git config core.hooksPath .githooks
	# Append git env
	bash scripts/appendGitEnvs.sh