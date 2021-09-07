#!/usr/bin/env bash
(
set -e
cd "$(dirname "$0")/.."
WORKSPACE=${GITHUB_WORKSPACE:="$(pwd)"}
export WORKSPACE

function err {
    echo "$1" 1>&2
    return 1
}

echo "Verifying input parameters"
S2D_BUILD_NUMBER="$(echo "$S2D_BUILD_NAME." | cut -d. -f2 )"
[ "${S2D_BUILD_NAME}" ] || err "Solar2DBuild, required action parameter is not set"
[ "${S2D_BUILD_NUMBER}" ] || err "Solar2DBuild, required action parameter has invalid format (i.e. 2021.3653)"
[ "${APP_VERSION_NAME}" ] || err "AppVersion, required Action parameter is not set"
[ "${APP_VERSION_CODE}" ] || err "AppVersionCode, required action parameter is not set"
[ "${KEYSTORE_PASSWORD}" ] || err "keystorePassword secret is required"
[ "${KEYSTORE_ALIAS}" ] || err "keystoreAlias secret is required"
[ "${KEYSTORE_ALIAS_PASSWORD}" ] || err "aliasPassword secret is required"


S2D_DMG="Util/S2D-${S2D_BUILD_NUMBER}.dmg"
if [ ! -f "${S2D_DMG}" ]
then
    echo "Downloading Solar2D"
    curl -L "https://github.com/coronalabs/corona/releases/download/${S2D_BUILD_NUMBER}/Solar2D-macOS-${S2D_BUILD_NAME}.dmg" -o "${S2D_DMG}"
fi

hdiutil attach "${S2D_DMG}" -noautoopen -mount required -mountpoint Util/S2D

echo "Building the app"
mkdir -p "$WORKSPACE/Output"
BUILDER="Util/S2D/Corona-${S2D_BUILD_NUMBER}/Native/Corona/mac/bin/CoronaBuilder.app/Contents/MacOS/CoronaBuilder"
"$BUILDER" build --lua "Util/recipe.lua"

hdiutil detach Util/S2D

)
