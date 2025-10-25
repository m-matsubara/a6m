program A6M;

{$D SCRNSAVE: �뎮�͏�퓬�@ }

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
    'p', 'P':	{�v���r���[}
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
    	ShowMessage('���o�[�W�����ł͖��Ή��ł� : ' + ParamStr(1));
	end;
	Application.Title := '�뎮�͏�퓬�@';
  Application.Run;
end.
