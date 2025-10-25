unit pasA6M;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
	TZero = Class
	private
        m_nState: integer;
        m_nSpeed: integer;
		m_xy: TPoint;
        m_bDraw: Boolean;
        m_Canvas: TCanvas;
    public
		m_pGraph : array[0..4] of ^TGraphic;
        Procedure Draw(var Canvas : TCanvas);
        Procedure Hide;
		Procedure Move(x, y, nState : integer);
		Procedure Shift(cx, cy, nState : integer);
        Procedure AutoShift;
	end;

implementation

{$RESOURCE A6M.res}


procedure TZero.Draw(var Canvas: TCanvas);
Begin
	if (m_bDraw <> False) then
    	Hide();
    Canvas.Draw(m_xy.x, m_xy.y, m_pGraph[m_nState]^);
    m_bDraw := True;
    m_Canvas := Canvas;
End;

procedure TZero.Hide;
var
	Rect: TRect;
Begin
	if (m_bDraw = False) then
    	exit;
	Rect.Left := m_xy.x;
    Rect.Top := m_xy.y;
    Rect.Right := m_xy.x + 32;
    Rect.Bottom := m_xy.y + 32;

{    Canvas.StretchDraw(Rect);}
    m_bDraw := False;
End;

procedure TZero.Move(x, y, nState : integer);
var
	Rect: TRect;
Begin
	Rect.Left := m_xy.x;
    Rect.Top := m_xy.y;
    Rect.Right := m_xy.x + 32;
    Rect.Bottom := m_xy.y + 32;

    {Canvas.StretchDraw(Rect, );}
    m_bDraw := True;
End;

procedure TZero.Shift(cx, cy, nState : integer);
var
	Rect: TRect;
Begin
	Rect.Left := m_xy.x;
    Rect.Top := m_xy.y;
    Rect.Right := m_xy.x + 32;
    Rect.Bottom := m_xy.y + 32;

    {Canvas.StretchDraw(Rect, );}
    m_bDraw := True;
End;

procedure TZero.AutoShift;
var
	Rect: TRect;
Begin
	Rect.Left := m_xy.x;
    Rect.Top := m_xy.y;
    Rect.Right := m_xy.x + 32;
    Rect.Bottom := m_xy.y + 32;

    {Canvas.StretchDraw(Rect, );}
    m_bDraw := True;
End;


end.
