unit TwoLinesUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics, LineUnit;

type
  TTwoLines = class(TInterfacedObject, IDrawable, IScalable)
  private
  var
    fFirst, fSecond: TLine;
    function getAngleBetween: double;
    procedure setAngleBetween(const angleBetween: double);
    procedure setAngle(const angle: double);
    function getAngle: double;

  public
    constructor Create(length1, angle, length2, angleBetween: double);
    destructor Destroy(); override;
    procedure scaleBy(scale: double);
    procedure draw(canvas: TCanvas; x, y: Integer);
    property angleBetween: double read getAngleBetween write setAngleBetween;
    property angle: double read getAngle write setAngle;
  end;

implementation

constructor TTwoLines.Create(length1, angle, length2, angleBetween: double);
begin
  fFirst := TLine.Create(length1, angle);
  fSecond := TLine.Create(length2, angleBetween - (Pi - angle));
end;

destructor TTwoLines.Destroy;
begin
  fFirst.Free;
  fSecond.Free;
  inherited;
end;

procedure TTwoLines.draw(canvas: TCanvas; x, y: Integer);
begin
  fFirst.draw(canvas, x, y);
  x := x + round(fFirst.length * cos(fFirst.angle));
  y := y + round(fFirst.length * sin(fFirst.angle));
  fSecond.draw(canvas, x, y);
end;

function TTwoLines.getAngle: double;
begin
  result := fFirst.angle;
end;

function TTwoLines.getAngleBetween: double;
begin
  result := Pi - fFirst.angle + fSecond.angle;
end;

procedure TTwoLines.scaleBy(scale: double);
begin
  fFirst.scaleBy(scale);
  fSecond.scaleBy(scale);
end;

procedure TTwoLines.setAngle(const angle: double);
var
tmp : double;
begin
  tmp := angleBetween;
  fFirst.angle := angle;
  angleBetween := tmp;
end;

procedure TTwoLines.setAngleBetween(const angleBetween: double);
begin
  fSecond.angle := angleBetween - (Pi - fFirst.angle);
end;

end.
