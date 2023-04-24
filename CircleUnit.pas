unit CircleUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics;

type
  TCircle = class(TInterfacedObject, IDrawable, IScalable)
  private
    fRadius: double;

  public
    constructor Create(radius: double);
    procedure scaleBy(scale: double);
    procedure draw(canvas: TCanvas; x, y: Integer);
    property radius: double read fRadius write fRadius;
  end;

implementation

{ TCircle }

constructor TCircle.Create(radius: double);
begin
  fRadius := radius;
end;

procedure TCircle.draw(canvas: TCanvas; x, y: Integer);
var
r: Integer;
begin
  r :=  round(fRadius);
  canvas.ellipse(x - r, y - r, x + r, y + r);
end;

procedure TCircle.scaleBy(scale: double);
begin
  fRadius := fRadius * scale;
end;

end.
