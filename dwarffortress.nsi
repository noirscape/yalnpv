; See LICENSE for licensing data
; Current version 0.4-alpha
; Compiled on 25-2-2016

; Defines compression
SetCompressor lzma

!define PRODUCT_NAME "Dwarf Fortress"
!define PRODUCT_VERSION "0.42.06"
!define PRODUCT_PUBLISHER "Ev1l0rd"
!define PRODUCT_WEB_SITE "http://www.ev1l0rd.github.io"
!include "MUI.nsh"

; Variables
Var fullscreen
Var mouse
Var nomusic
Var cgraphics
Var fps
; Var compress
Var nodots

; Used plugins
!include "TextReplace.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "df_icon.ico"

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "df.txt"
!insertmacro MUI_PAGE_LICENSE "dt.txt"
!insertmacro MUI_PAGE_LICENSE "soundsense.txt"
!insertmacro MUI_PAGE_LICENSE "LICENSE"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "DF.exe"
InstallDir "$EXEDIR\Dwarf Fortress"
ShowInstDetails show
RequestExecutionLevel user
BrandingText "Ev1l0rd. Dwarf Fortress is made by Bay12Games."
Section "Dwarf Fortress 0.42.06" SEC01
		SetOutPath "$INSTDIR"
        SectionIn RO
        File /r "df_42_06_win\*"
SectionEnd

SectionGroup "Tools & Utilities" G01
Section /o "DFHack (Non-Existent)" SEC02
        SetOverwrite on
        ;File /r "dfhack\*"
        SetOverwrite off
SectionEnd

Section /o "Dwarf Therapist" SEC03
	SetOutPath "$INSTDIR\Dwarf Therapist"
	File /r "Dwarf-Therapist\*"
	SetOutPath "$INSTDIR"
SectionEnd

Section /o "Soundsense" SEC05
	SetOutPath "$INSTDIR\soundsense"
	File /r "soundsense\*"
	SetOutPath "$INSTDIR"
SectionEnd

SectionGroupEnd

SectionGroup "Graphic Packs" G02

Section "ASCII" SEC12
	SectionIn RO
SectionEnd

Section /o "Dotted floor" SEC13
	${textreplace::ReplaceInFile} "$INSTDIR\data\init\d_init.txt" "$INSTDIR\data\init\d_init.txt" "[VARIED_GROUND_TILES:YES]" "[VARIED_GROUND_TILES:NO]" "/S=0" $nodots
SectionEnd

SectionGroupEnd

SectionGroup "Settings" G03

Section /o "No Music" SEC04
		${textreplace::ReplaceInFile} "$INSTDIR\data\init\init.txt" "$INSTDIR\data\init\init.txt" "[SOUND:YES]" "[SOUND:NO]" "/S=0" $nomusic
SectionEnd

Section /o "Fullscreen" SEC06
		${textreplace::ReplaceInFile} "$INSTDIR\data\init\init.txt" "$INSTDIR\data\init\init.txt" "[WINDOWED:YES]" "[WINDOWED:NO]" "/S=0" $fullscreen
SectionEnd

Section /o "Creature graphics" SEC07
		${textreplace::ReplaceInFile} "$INSTDIR\data\init\init.txt" "$INSTDIR\data\init\init.txt" "[GRAPHICS:YES]" "[GRAPHICS:NO]" "/S=0" $cgraphics
SectionEnd

Section /o "Show FPS" SEC09
		${textreplace::ReplaceInFile} "$INSTDIR\data\init\init.txt" "$INSTDIR\data\init\init.txt" "[FPS:NO]" "[FPS:YES]" "/S=0" $fps
SectionEnd

Section /o "Don't use the mouse" SEC10
		${textreplace::ReplaceInFile} "$INSTDIR\data\init\init.txt" "$INSTDIR\data\init\init.txt" "[MOUSE:YES]" "[MOUSE:NO]" "/S=0" $mouse
SectionEnd

;Section /o "Don't compress saves" SEC11
;		SetOutPath "$INSTDIR" 
;		${textreplace::ReplaceInFile} "$INSTDIR\data\init\init.txt" "$INSTDIR\data\init\init.txt" "[COMPRESSED_SAVES:YES]" "[COMPRESSED_SAVES:NO]" "/S=0" $compress
;SectionEnd

SectionGroupEnd

Section -Post
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "The base game."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "Powerful Lua Scripting Library."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "Makes managing dwarves easier."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "Turns sound off."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC05} "Plays sounds and adds additional music (No music setting recommended)."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC06} "Runs game in fullscreen."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC07} "Enables creature graphics (may impact FPS)."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC09} "Show FPS in top left corner."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC10} "Completely disable the mouse."
 ; !insertmacro MUI_DESCRIPTION_TEXT ${SEC11} "Disable save compression. (useful if you are experiencing corruption."
 ; Disabled for now, as it gives issues.
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC12} "Default ASCII graphics."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC13} "Disable the commas and devaries the ground. Could be better on the eyes."
  !insertmacro MUI_DESCRIPTION_TEXT ${G01} "Install various utilities and tools that make managing a fortress easier."
  !insertmacro MUI_DESCRIPTION_TEXT ${G02} "Choose to install a graphics pack."
  !insertmacro MUI_DESCRIPTION_TEXT ${G03} "Edit various settings of the game."
!insertmacro MUI_FUNCTION_DESCRIPTION_END