unit pasScreenSave;

interface

uses
{  Forms, Windows, Classes, Controls, ExtCtrls, Inifiles;	}
  Forms, Windows, Inifiles, Classes, Controls, ExtCtrls;


type
  TfrmScreenSaver = class(TForm)
    imZero_N: TImage;
    imZero_E: TImage;
    imZero_S: TImage;
    imZero_W: TImage;
    imZero_11_N: TImage;	{	‚P‚PŒ^	}
    imZero_11_E: TImage;
    imZero_11_S: TImage;
    imZero_11_W: TImage;
    imZero_21_N: TImage;	{	‚Q‚PŒ^	}
    imZero_21_E: TImage;
    imZero_21_S: TImage;
    imZero_21_W: TImage;
    imZero_32_N: TImage;	{	‚R‚QŒ^	}
    imZero_32_E: TImage;
    imZero_32_S: TImage;
    imZero_32_W: TImage;
    imZero_22_N: TImage;	{	‚Q‚QŒ^	}
    imZero_22_E: TImage;
    imZero_22_S: TImage;
    imZero_22_W: TImage;
    imZero_52_N: TImage;	{	‚T‚QŒ^	}
    imZero_52_E: TImage;
    imZero_52_S: TImage;
    imZero_52_W: TImage;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    								Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure AppIdle(Sender: TObject; var bDone: Boolean);
  private
    { Private éŒ¾ }
    bMouseMoveFlag: Boolean;
    xyMouse: TPoint;
	{	‚±‚Ì•Ó‚¿‚å‚Á‚ÆŽè”²‚«(ƒvƒƒgƒ^ƒCƒv‚È‚à‚ñ‚Å)	}
    m_imZero:     array[0..100] of TImage;
	m_nDirection: array[0..100] of integer;
	m_nSpeed:     array[0..100] of integer;
    m_nZeroCount : integer;
    m_nWait: integer;
  public
    { Public éŒ¾ }
  end;

var
  frmScreenSaver: TfrmScreenSaver;

implementation

{$R *.DFM}

procedure Delay(nDelay : integer);
var
	nFinishCount : integer;
begin
	nFinishCount := GetTickCount + nDelay;
    repeat
    	Application.ProcessMessages
    until GetTickCount > nFinishCount
end;


procedure TfrmScreenSaver.FormCreate(Sender: TObject);
var
	IniFile: TIniFile;
    iZeroIdx : integer;
    sType: string;
    nCount: integer;
    nBackColor: longint;
    nSpeed: longint;

begin
    Randomize;

    IniFile := TIniFile.Create(ParamStr(0) + '.ini');
	sType := IniFile.ReadString('Zero', 'Type', '11');
	nCount := IniFile.ReadInteger('Zero', 'Count', 30);
    nBackColor := IniFile.ReadInteger('Zero', 'BackColor', 255);
    nSpeed := IniFile.ReadInteger('Zero', 'Speed', 0);


	WindowState := wsMaximized;
    Color := nBackColor;
    m_nZeroCount := nCount;
	m_nWait := nSpeed;
	if (sType = '11') then
    begin
		imZero_N.Picture := imZero_11_N.Picture;
		imZero_E.Picture := imZero_11_E.Picture;
		imZero_S.Picture := imZero_11_S.Picture;
		imZero_W.Picture := imZero_11_W.Picture;
    end
    else if (sType = '21') then
    begin
		imZero_N.Picture := imZero_21_N.Picture;
		imZero_E.Picture := imZero_21_E.Picture;
		imZero_S.Picture := imZero_21_S.Picture;
		imZero_W.Picture := imZero_21_W.Picture;
    end
    else if (sType = '32') then
    begin
		imZero_N.Picture := imZero_32_N.Picture;
		imZero_E.Picture := imZero_32_E.Picture;
		imZero_S.Picture := imZero_32_S.Picture;
		imZero_W.Picture := imZero_32_W.Picture;
    end
    else if (sType = '22') then
    begin
		imZero_N.Picture := imZero_22_N.Picture;
		imZero_E.Picture := imZero_22_E.Picture;
		imZero_S.Picture := imZero_22_S.Picture;
		imZero_W.Picture := imZero_22_W.Picture;
    end
    else if (sType = '52') then
    begin
		imZero_N.Picture := imZero_52_N.Picture;
		imZero_E.Picture := imZero_52_E.Picture;
		imZero_S.Picture := imZero_52_S.Picture;
		imZero_W.Picture := imZero_52_W.Picture;
    end;

	for iZeroIdx := 0 to m_nZeroCount do
    Begin
		m_imZero[iZeroIdx] := TImage.Create(Self);
    	m_imZero[iZeroIdx].Parent := Self;
    	m_imZero[iZeroIdx].AutoSize := True;
	    m_imZero[iZeroIdx].Picture := imZero_S.Picture;	{ “ìŒü‚« }
	    m_imZero[iZeroIdx].Top := Random(0);
    	m_imZero[iZeroIdx].Left := Random(Screen.Width);
    	m_imZero[iZeroIdx].Show;

        m_nDirection[iZeroIdx] := 2;	{ “ìŒü‚« }
        m_nSpeed[iZeroIdx] := 16;
    end;
	ShowCursor(False);
    Application.OnIdle := AppIdle;
end;

procedure TfrmScreenSaver.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ShowCursor(True);      {–³‚­‚Ä‚à‚¢‚¢‚Ý‚½‚¢‚¾‚ª”O‚Ì‚½‚ß}

end;

procedure TfrmScreenSaver.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Close;
end;

procedure TfrmScreenSaver.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     Close;
end;

procedure TfrmScreenSaver.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if (bMouseMoveFlag = False) then
     begin
          {Å‰‚Ìˆê‰ñ–Ú‚ÌŒÄ‚Ño‚µ(ƒAƒvƒŠƒP[ƒVƒ‡ƒ“‹N“®’¼Œã)}
          bMouseMoveFlag := True;
          xyMouse.x := X;
          xyMouse.y := Y;
     end
     else if (Abs(xyMouse.x - X) > 2) or (Abs(xyMouse.y - Y) > 2) then
          Close;

end;
procedure TfrmScreenSaver.AppIdle(Sender: TObject; var bDone: Boolean);
var
    iZeroIdx : integer;
begin
     {ƒGƒtƒFƒNƒg•”}

	for iZeroIdx := 0 to m_nZeroCount do
    Begin
		if (Random(20) = 0) then
        begin
			m_nDirection[iZeroIdx] := m_nDirection[iZeroIdx] + Random(3) - 1;
			case m_nDirection[iZeroIdx] of
			-1:
            	begin
                	m_nDirection[iZeroIdx] := 3;
					m_imZero[iZeroIdx].Picture := imZero_W.Picture;
                end;

    	    0:
				m_imZero[iZeroIdx].Picture := imZero_N.Picture;
	        1:
				m_imZero[iZeroIdx].Picture := imZero_E.Picture;
        	2:
				m_imZero[iZeroIdx].Picture := imZero_S.Picture;
    	    3:
				m_imZero[iZeroIdx].Picture := imZero_W.Picture;
            4:
            	begin
                	m_nDirection[iZeroIdx] := 0;
    				m_imZero[iZeroIdx].Picture := imZero_N.Picture;
	            end;
	        end;
        end;
		if (Random(20) = 0) then
		begin
        	m_nSpeed[iZeroIdx] := Random(24) + 8;
        end;

		case m_nDirection[iZeroIdx] of
        0:
			m_imZero[iZeroIdx].Top := m_imZero[iZeroIdx].Top - m_nSpeed[iZeroIdx];
        1:
			m_imZero[iZeroIdx].Left := m_imZero[iZeroIdx].Left + m_nSpeed[iZeroIdx];
        2:
			m_imZero[iZeroIdx].Top := m_imZero[iZeroIdx].Top + m_nSpeed[iZeroIdx];
        3:
			m_imZero[iZeroIdx].Left := m_imZero[iZeroIdx].Left - m_nSpeed[iZeroIdx];
        end;

        if (m_imZero[iZeroIdx].Top > Self.Height) then
			m_imZero[iZeroIdx].Top := m_imZero[iZeroIdx].Top - Self.Height;
        if (m_imZero[iZeroIdx].Top + m_imZero[iZeroIdx].Height< 0) then
			m_imZero[iZeroIdx].Top := m_imZero[iZeroIdx].Top + Self.Height;
        if (m_imZero[iZeroIdx].Left > Self.Width) then
			m_imZero[iZeroIdx].Left := m_imZero[iZeroIdx].Left - Self.Width;
        if (m_imZero[iZeroIdx].Left + m_imZero[iZeroIdx].Width < 0) then
			m_imZero[iZeroIdx].Left := m_imZero[iZeroIdx].Left + Self.Width;
		m_imZero[iZeroIdx].repaint;
    End;
	if (m_nWait <> 0) then
		Delay(m_nWait);
    bDone := False;
end;

end.
