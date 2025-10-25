program A6M;

{$D SCRNSAVE: 零式艦上戦闘機 }

uses
  Windows,
  Forms,
  Dialogs,
  pasScreenSave in 'pasScreenSave.pas' {frmScreenSaver},
  pasZeroSettings in 'pasZeroSettings.pas' {frmZeroSettings};

{$R *.RES}


var
	cMode : char;
    idThread : DWORD;
begin
{	ShowMessage(ParamStr(1));}
	Application.Initialize;
    cMode := ' ';
    if (length(ParamStr(1)) >= 2) then
        cMode := ParamStr(1)[2];
    case cMode of
    'p', 'P':	{プレビュー}
    	;
    ' ', 'c', 'C':
      Application.CreateForm(TfrmZeroSettings, frmZeroSettings);
    's', 'S':
    	begin
	    	frmScreenSaver.Caption := 'Zero-';
    	    if (FindWindow('TfrmScreenSaver', 'Zero') = 0) then
				Application.CreateForm(TfrmScreenSaver, frmScreenSaver);
		  	frmScreenSaver.Caption := 'Zero';
    	end;
	else
    	ShowMessage('現バージョンでは未対応です : ' + ParamStr(1));
	end;
	Application.Title := '零式艦上戦闘機';
  Application.Run;
end.
