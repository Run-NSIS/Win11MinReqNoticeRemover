/* GSolone 22/2/23
   Credits:
    https://nsis-dev.github.io/NSIS-Forums/html/t-262613.html (Write DWORD)
    https://nsis.sourceforge.io/NsRestartExplorer_plug-in (Restart plugin)
   Icon:
    https://www.flaticon.com/free-icon/windows_5969316 Logo icons created by Freepik - Flaticon
   Modifiche:
    -
*/

!define PRODUCT_NAME "Windows 11 Minimum Requirements Notice Remover"
!define PRODUCT_VERSION "0.1"
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

Section "Remove notice SV1" REM_SV1
 ReadRegDword $0 HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV1"
 IfErrors SV1DoesntExist SV1Exists
  SV1DoesntExist:
   ClearErrors
   DetailPrint "SV1 not found, I'll write in registry now."
   WriteRegDword HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV1" 0x00000000
   Return
  SV1Exists:
   DetailPrint "SV1 already found, skip."
   Return
SectionEnd

Section "Remove notice SV2" REM_SV2
 ReadRegDword $0 HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV2"
 IfErrors SV2DoesntExist SV2Exists
  SV2DoesntExist:
   ClearErrors
   DetailPrint "SV2 not found, I'll write in registry now."
   WriteRegDword HKCU "Control Panel\UnsupportedHardwareNotificationCache" "SV2" 0x00000000
   Return
  SV2Exists:
   DetailPrint "SV2 already found, skip."
   Return
SectionEnd