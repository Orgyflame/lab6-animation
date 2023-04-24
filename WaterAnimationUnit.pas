unit WaterAnimationUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics, WaterUnit;

type
  TWaterAnimation = class(TInterfacedObject, IAnimation)
  private
    fWater: TWater;
  public
    constructor create();
    destructor destroy(); override;
    procedure draw(canvas: TCanvas; x, y: Integer; time: Integer);
  end;

implementation

{ TWaterAnimation }

procedure TWaterAnimation.draw(canvas: TCanvas; x, y, time: Integer);
begin
  fWater.wavePhase := time / 1000;
  fWater.draw(canvas, x, y);
end;

constructor TWaterAnimation.create;
begin
  fWater := TWater.Create;
end;

destructor TWaterAnimation.destroy;
begin
  fWater.Free;
  inherited;
end;

end.
