/* GSolone 22/2/23
   Credits:
    https://nsis-dev.github.io/NSIS-Forums/html/t-262613.html (Write DWORD)
    https://nsis.sourceforge.io/NsRestartExplorer_plug-in (Restart plugin)
    https://documentation.help/CTRE-NSIS/Section4.4.html (Relative Jumps)
   Icon:
    https://www.flaticon.com/free-icon/windows_5969316 Logo icons created by Freepik - Flaticon
   Modifiche:
    22/2/23- Improve: prevedo anche la cartella Cached che ho trovato su un sistema Win11 aggiornato.
             Improve: cambio il metodo di lavoro del programma per intervenire su un problema già esistente e non "prevenirlo".
*/

!define PRODUCT_NAME "Windows 11 Minimum Requirements Notice Remover"
!define PRODUCT_VERSION "0.2"
!define PRODUCT_VERSION_MINOR "0.0"
!define PRODUCT_PUBLISHER "Emmelibri S.r.l."
!define PRODUCT_WEB_SITE "https://www.emmelibri.it"
!define PRODUCT_BUILD "${PRODUCT_NAME} ${PRODUCT_VERSION}.${PRODUCT_VERSION_MINOR} (build ${MyTIMESTAMP})"

!include "MUI.nsh"
!include "FileFunc.nsh"
;!addplugindir "Plugins\nsRestartExplorer-1.4\binaries\Release Ansi"

!define MUI_ABORTWARNING
!define MUI_ICON "include\icon-windows.ico"
!define /date MYTIMESTAMP "%Y%m%d-%H%M%S"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE "Italian"
!define /date MyTIMESTAMP_Yr "%Y"

!define MUI_PAGE_HEADER_TEXT "${PRODUCT_BUILD}"
!define MUI_INSTFILESPAGE_FINISHHEADER_TEXT "${PRODUCT_BUILD}"
!define MUI_INSTFILESPAGE_FINISHHEADER_SUBTEXT "Operations completed."
!define MUI_FINISHPAGE_TITLE "${PRODUCT_BUILD}"
!define MUI_FINISHPAGE_TEXT "Operations ended."

VIProductVersion "${PRODUCT_VERSION}.${PRODUCT_VERSION_MINOR}"
VIAddVersionKey ProductName "${PRODUCT_NAME}"
VIAddVersionKey Comments "${PRODUCT_NAME}"
VIAddVersionKey CompanyName "Emmelibri S.r.l."
VIAddVersionKey LegalCopyright GSolone
VIAddVersionKey FileDescription "Remove minimum requirements notice from Windows 11 desktop."
VIAddVersionKey FileVersion ${PRODUCT_VERSION}
VIAddVersionKey ProductVersion ${PRODUCT_VERSION}
VIAddVersionKey InternalName "${PRODUCT_VERSION}"
VIAddVersionKey LegalTrademarks "GSolone, ${MyTIMESTAMP_Yr}"
VIAddVersionKey OriginalFilename "MinReqNoticeRemover-${PRODUCT_VERSION}.exe"

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Win11MinReqNoticeRemover_${PRODUCT_VERSION}.exe"
InstallDir "$TEMP"
ShowInstDetails show
BrandingText "Emmelibri S.r.l. - GSolone ${MyTIMESTAMP_Yr}"

RequestExecutionLevel User
SpaceTexts none
Caption "${PRODUCT_BUILD}"

Section "Remove notice SV1" REM_SV1
 ReadRegDword $0 HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV1"
 IfErrors SV1DoesntExist SV1Exists
  SV1DoesntExist:
   ClearErrors
   DetailPrint "SV1 not found, skip."
   Goto +8
  SV1Exists:
   DetailPrint "SV1 found, value $0."
   StrCmp $0 1 0 +3
    DetailPrint "I'm changing the value of the key to 0."
    WriteRegDword HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV1" 0x00000000
    Goto +2
   DetailPrint "SV1 value: $0"
SectionEnd

Section "Remove notice SV1 (Cached)" REM_SV1C
 ReadRegDword $0 HKCU "Control Panel\UnsupportedHardwareNotificationCache\Cached" "SV1"
 IfErrors SV1CDoesntExist SV1CExists
  SV1CDoesntExist:
   ClearErrors
   DetailPrint "SV1 (Cached) not found, skip."
   Goto +8
  SV1CExists:
   DetailPrint "SV1 (Cached) found, value $0."
   StrCmp $0 1 0 +3
    DetailPrint "I'm changing the value of the key to 0."
    WriteRegDword HKCU "Control Panel\UnsupportedHardwareNotificationCache\Cached" "SV1" 0x00000000
    Goto +2
   DetailPrint "SV1 (Cached) value: $0"
SectionEnd

Section "Remove notice SV2" REM_SV2
 ReadRegDword $0 HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV2"
 IfErrors SV2DoesntExist SV2Exists
  SV2DoesntExist:
   ClearErrors
   DetailPrint "SV2 not found, skip."
   Goto +8
  SV2Exists:
   DetailPrint "SV2 found, value $0."
   StrCmp $0 1 0 +3
    DetailPrint "I'm changing the value of the key to 0."
    WriteRegDword HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV2" 0x00000000
    Goto +2
   DetailPrint "SV2 value: $0"
SectionEnd

Section "Remove notice SV2 (Cached)" REM_SV2C
 ReadRegDword $0 HKCU "Control Panel\UnsupportedHardwareNotificationCache\Cached" "SV2"
 IfErrors SV2CDoesntExist SV2CExists
  SV2CDoesntExist:
   ClearErrors
   DetailPrint "SV2 (Cached) not found, skip."
   Goto +8
  SV2CExists:
   DetailPrint "SV2 (Cached) found, value $0."
   StrCmp $0 1 0 +3
    DetailPrint "I'm changing the value of the key to 0."
    WriteRegDword HKCU "Control Panel\UnsupportedHardwareNotificationCache\Cached" "SV2" 0x00000000
    Goto +2
   DetailPrint "SV2 (Cached) value: $0"
SectionEnd