unit pasZeroSettings;

interface

uses
{  Inifiles, ExtCtrls, Forms, Dialogs, StdCtrls, Spin, Controls, Classes;}
  Forms, Inifiles, Dialogs, StdCtrls, Spin, Controls, ExtCtrls, Classes;

type
  TfrmZeroSettings = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    rgType: TRadioGroup;
    txCount: TSpinEdit;
    Label1: TLabel;
    scSpeed: TScrollBar;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btColor: TButton;
    dlgColor: TColorDialog;
    shColor: TShape;
    imZero: TImage;
    Panel1: TPanel;
    imZero_11_N: TImage;
    imZero_21_N: TImage;
    imZero_32_N: TImage;
    imZero_22_N: TImage;
    imZero_52_N: TImage;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btColorClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
  private
    { Private êÈåæ }
	m_Inifile: TInifile;
  public
    { Public êÈåæ }
  end;

var
  frmZeroSettings: TfrmZeroSettings;

implementation

{$R *.DFM}

procedure TfrmZeroSettings.btCancelClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmZeroSettings.btOkClick(Sender: TObject);
var
    sType: string;
    nCount: integer;
    nBackColor: longint;
    nSpeed: integer;
begin
	case rgType.ItemIndex of
	0:
		sType := '11';
	1:
		sType := '21';
	2:
		sType := '32';
	3:
		sType := '22';
	4:
		sType := '52';
    end;
    nCount := txCount.Value;
    nBackColor := shColor.Brush.Color;
    nSpeed := scSpeed.Position;

	m_Inifile.WriteString('Zero', 'Type', sType);
	m_Inifile.WriteInteger('Zero', 'Count', nCount);
	m_Inifile.WriteInteger('Zero', 'BackColor', nBackColor);
	m_Inifile.WriteInteger('Zero', 'Speed', nSpeed);
	Close;
end;

procedure TfrmZeroSettings.FormCreate(Sender: TObject);
var
    sType: string;
    nCount: integer;
    nBackColor: longint;
    nSpeed: integer;
begin
	Top := (Screen.Height - Height) div 2;
    Left := (Screen.Width - Width) div 2;


	m_Inifile := TInifile.Create(ParamStr(0) + '.ini');
	sType := m_IniFile.ReadString('Zero', 'Type', '11');
	nCount := m_IniFile.ReadInteger('Zero', 'Count', 30);
    nBackColor := m_IniFile.ReadInteger('Zero', 'BackColor', 0);
    nSpeed := m_IniFile.ReadInteger('Zero', 'Speed', 0);
	if (sType = '11') then
		rgType.ItemIndex := 0
	else if (sType = '21') then
		rgType.ItemIndex := 1
	else if (sType = '32') then
		rgType.ItemIndex := 2
	else if (sType = '22') then
		rgType.ItemIndex := 3
	else if (sType = '52') then
		rgType.ItemIndex := 4;
	rgTypeClick(Sender);
	txCount.Value := nCount;
    shColor.Brush.Color := nBackColor;
    dlgColor.Color := nBackColor;
    scSpeed.Position := nSpeed;
end;

procedure TfrmZeroSettings.btColorClick(Sender: TObject);
begin
	dlgColor.Execute;
    shColor.Brush.Color := dlgColor.Color;
end;

procedure TfrmZeroSettings.rgTypeClick(Sender: TObject);
begin
	case rgType.ItemIndex of
	0:
		imZero.Picture := imZero_11_N.Picture;
	1:
		imZero.Picture := imZero_21_N.Picture;
	2:
		imZero.Picture := imZero_32_N.Picture;
	3:
		imZero.Picture := imZero_22_N.Picture;
	4:
		imZero.Picture := imZero_52_N.Picture;
    end;
end;

end.
