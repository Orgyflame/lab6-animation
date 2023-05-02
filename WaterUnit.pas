unit WaterUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics, RectangleUnit;

type
  TWater = class(TInterfacedObject, IDrawable, IScalable)
  private
    fWaveHeight: double;
    fWavePhase: double;
    fColor: TColor;
    fLength: double;

    function waveFunc(x: Integer): Integer;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure scaleBy(scale: double);
    procedure draw(canvas: TCanvas; x, y: Integer);
    property waveHeight: double read fWaveHeight write fWaveHeight;
    property wavePhase: double read fWavePhase write fWavePhase;
    property color: TColor read fColor write fColor;
    property length: double read fLength write fLength;
  end;

implementation

uses Winapi.Windows;

{ TWater }

constructor TWater.Create;
begin
  fWaveHeight := 15;
  fWavePhase := 0;
  fColor := clBlue;
  fLength := 500;
end;

destructor TWater.Destroy;
begin

  inherited;
end;

procedure TWater.draw(canvas: TCanvas; x, y: Integer);
var
  px, py: Integer;
begin
  canvas.brush.color := fColor;
  canvas.pen.color := fColor;

  canvas.moveTo(x, y + waveFunc(x));
  canvas.lineTo(x, y + round(waveHeight));
  canvas.lineTo(round(x + fLength), y + round(waveHeight));
  canvas.lineTo(round(x + fLength), y + waveFunc(round(x + fLength)));

  for px := x to round(x + fLength) do
  begin
    py := y + waveFunc(px);
    canvas.pixels[px, py] := fColor;
  end;

  for px := x to round(x + fLength) do
  begin
    py := y + waveFunc(px);

    if py <> y + round(fWaveHeight) then
      canvas.floodFill(px, py + 1, fColor, fsBorder);
  end;

end;

procedure TWater.scaleBy(scale: double);
begin
  fWaveHeight := fWaveHeight * scale;
  fLength := fLength * scale;
end;

function TWater.waveFunc(x: Integer): Integer;
begin
  result := round(fWaveHeight / 2 + sin(x / 2 * Pi / fWaveHeight + fWavePhase) *
    fWaveHeight / 2);
end;

end.
