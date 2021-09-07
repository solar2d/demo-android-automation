
local root = os.getenv('GITHUB_WORKSPACE') or os.getenv('WORKSPACE')

return {
	appName = "Solar2Demo",
	androidAppPackage = "com.solar2d.test",

	androidStore = "google", -- "none", "google", "amazon", "ouya", "gameStick"

	platform = "android",
	appVersion = os.getenv('APP_VERSION_NAME'),
	androidVersionCode = os.getenv('APP_VERSION_CODE'),
	projectPath = root .. "/Project",
	dstPath = root .. '/Output',
	certificatePath = root .. "/Util/android.keystore",
	keystorePassword = os.getenv('KEYSTORE_PASSWORD'),
	keystoreAlias = os.getenv('KEYSTORE_ALIAS'),
	keystoreAliasPassword = os.getenv('KEYSTORE_ALIAS_PASSWORD'),
}
