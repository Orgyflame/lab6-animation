unit HumanUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics, CircleUnit, LineUnit, TwoLinesUnit;

type
  THuman = class(TInterfacedObject, IDrawable, IScalable)
  private
  var
    fHead: TCircle;
    fBody: TLine;
    fLeftArm, fRightArm, fLeftLeg, fRightLeg: TTwoLines;
    function getAngle: double;
    procedure setAngle(const angle: double);

  public
    constructor Create();
    destructor Destroy(); override;
    procedure scaleBy(scale: double);
    procedure draw(canvas: TCanvas; x, y: Integer);
    property angle: double read getAngle write setAngle;
    property leftArm: TTwoLines read fLeftArm;
    property rightArm: TTwoLines read fRightArm;
    property leftLeg: TTwoLines read fLeftLeg;
    property rightLeg: TTwoLines read fRightLeg;
  end;

implementation

{ THuman }

constructor THuman.Create;
begin
  fHead := TCircle.Create(5);
  fBody := TLine.Create(25, Pi);
  fLeftArm := TTwoLines.Create(25, Pi * 31/18, 7, Pi * 23/18);
  fRightArm := TTwoLines.Create(25, Pi * 5/18, 7, Pi * 13/18);
  fLeftLeg := TTwoLines.Create(35, Pi * 19/18, 10, Pi * 13/18);
  fRightLeg := TTwoLines.Create(35, Pi * 17/18, 10, Pi * 13/18);
  setAngle(Pi / 2);
end;

destructor THuman.Destroy;
begin
  fHead.free;
  fBody.free;
  fLeftArm.free;
  fRightArm.free;
  fLeftLeg.free;
  fRightLeg.free;

  inherited;
end;

//x, y - место крепления рук
procedure THuman.draw(canvas: TCanvas; x, y: Integer);
var
px, py: Integer;
begin
  canvas.pen.color := clBlack;
  canvas.brush.color := clWhite;

  fLeftArm.draw(canvas, x, y);
  fRightArm.draw(canvas, x, y);

  px := x - round((fBody.length * 0.2 + fHead.radius) * cos(angle));
  py := y - round((fBody.length * 0.2 + fHead.radius) * sin(angle));
  fHead.draw(canvas, px, py);

  px := px + round(fHead.radius * cos(angle));
  py := py + round(fHead.radius * sin(angle));
  fBody.draw(canvas, px, py);

  px := x + round(fBody.length * 0.8 * cos(angle));
  py := y + round(fBody.length * 0.8 * sin(angle));
  fLeftLeg.draw(canvas, px, py);
  fRightLeg.draw(canvas, px, py);
end;

function THuman.getAngle: double;
begin
  result := fBody.angle;
end;

procedure THuman.scaleBy(scale: double);
begin
  fHead.scaleBy(scale);
  fBody.scaleBy(scale);
  fLeftArm.scaleBy(scale);
  fRightArm.scaleBy(scale);
  fLeftLeg.scaleBy(scale);
  fRightLeg.scaleBy(scale);
end;

procedure THuman.setAngle(const angle: double);
var
  delta: double;
begin
  delta := angle - fBody.angle;

  fBody.angle := angle;
  fRightArm.angle := fRightArm.angle + delta;
  fLeftArm.angle := fLeftArm.angle + delta;
  fRightLeg.angle := fRightLeg.angle + delta;
  fLeftLeg.angle := fLeftLeg.angle + delta;
end;

end.
