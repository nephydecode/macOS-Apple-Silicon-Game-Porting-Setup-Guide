### For Gaming - Brew Config, Game Porting Toolkit

## MAIN PATH - TO BE CONFIGURED
export TOOLKIT_DMG_DIRECTORY="/Users/myaccountname/Downloads"
export ROOT_DIRECTORY="/Users/myaccountname"

## PATHS
export SAVED_GAME_PORTING_TOOLKIT_DMG="$TOOLKIT_DMG_DIRECTORY/Game_Porting_Toolkit_1.1.dmg"
export MOUNTED_GAME_PORTING_TOOLKIT="/Volumes/Game\ Porting\ Toolkit-1.1"
export GAME_PREFIX="$ROOT_DIRECTORY/my-game-prefix"
export STEAM_EXE="$ROOT_DIRECTORY/my-game-prefix/drive_c/Program\ Files\ \(x86\)/Steam/steam.exe"

## ALIAS COMMANDS
# Set up the two different homebrew architectures
alias setbrewgame='export HOMEBREW_ARCH=x86_64; eval "$(/usr/local/bin/brew shellenv)"; echo "Switched to x86_64 Homebrew"'
alias setbrewdefault='export HOMEBREW_ARCH=arm64; eval "$(/opt/homebrew/bin/brew shellenv)"; echo "Switched to arm64 Homebrew"'
# End all wine servers
alias killwineservers="pgrep -f 'wine64-preloader|wineserver' | xargs kill"
alias linkend="diskutil eject /dev/disk4 && killwineservers"
alias mountgameportingtoolkit='open $SAVED_GAME_PORTING_TOOLKIT_DMG'
# Start Steam with HUD
alias steamstart="mountgameportingtoolkit && setbrewgame && killwineservers; ${MOUNTED_GAME_PORTING_TOOLKIT}/gameportingtoolkit ${GAME_PREFIX} ${STEAM_EXE}"
# Alias for starting Steam with no HUD
#alias linkstart="mountgameportingtoolkit && setbrewgame; ${MOUNTED_GAME_PORTING_TOOLKIT}/gameportingtoolkit-no-hud ${GAME_PREFIX} ${STEAM_EXE}"
alias linkstart="if [ -d '/Volumes/Game Porting Toolkit-1.1' ]; then setbrewgame && ${MOUNTED_GAME_PORTING_TOOLKIT}/gameportingtoolkit-no-hud ${GAME_PREFIX} ${STEAM_EXE}; else mountgameportingtoolkit && setbrewgame && ${MOUNTED_GAME_PORTING_TOOLKIT}/gameportingtoolkit-no-hud ${GAME_PREFIX} ${STEAM_EXE}; fi"