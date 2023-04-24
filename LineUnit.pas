unit LineUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics;

type
  TLine = class(TInterfacedObject, IDrawable, IScalable)
  private
  var
    fLength, fAngle: double;

  public
    constructor Create(length, angle: double);
    procedure scaleBy(scale: double);
    procedure draw(canvas: TCanvas; x, y: Integer);
    property length: double read fLength write fLength;
    property angle: double read fAngle write fAngle;
  end;

implementation

constructor TLine.Create(length, angle: double);
begin
  fLength := length;
  fAngle := angle;
end;

procedure TLine.draw(canvas: TCanvas; x, y: Integer);
begin
  canvas.MoveTo(x, y);
  x := x + round(fLength * cos(fAngle));
  y := y + round(fLength * sin(fAngle));
  canvas.LineTo(x, y);
end;

procedure TLine.scaleBy(scale: double);
begin
  fLength := fLength * scale;
end;

end.
