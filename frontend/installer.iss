[Setup]
AppName=DAN
AppVersion=1.0.0
DefaultDirName={autopf}\DAN
DefaultGroupName=DAN
OutputDir=build\installer
OutputBaseFilename=DAN-setup
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\DAN"; Filename: "{app}\dan_chat.exe"
Name: "{autodesktop}\DAN"; Filename: "{app}\dan_chat.exe"

[Run]
Filename: "{app}\dan_chat.exe"; Description: "Launch DAN"; Flags: nowait postinstall skipifsilent