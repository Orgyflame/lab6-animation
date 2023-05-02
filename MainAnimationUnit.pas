unit MainAnimationUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics, WaterAnimationUnit,
  SwimmingHumanAnimationUnit;

type
  TMainAnimation = class(TInterfacedObject, IAnimation)
  private
    fWaterAnimation: TWaterAnimation;
    fSwimmingHuman: TSwimmingHumanAnimation;
  public
    constructor create();
    destructor destroy(); override;
    procedure draw(canvas: TCanvas; x, y: Integer; time: Integer);
  end;

implementation

{ TMainAnimation }

constructor TMainAnimation.create;
begin
  fWaterAnimation := TWaterAnimation.create;
  fSwimmingHuman := TSwimmingHumanAnimation.create;
end;

destructor TMainAnimation.destroy;
begin
  fSwimmingHuman.Free;
  fWaterAnimation.Free;
  inherited;
end;

procedure TMainAnimation.draw(canvas: TCanvas; x, y, time: Integer);
begin

  fSwimmingHuman.draw(canvas, x + 200, y + 110, time);
  fSwimmingHuman.draw(canvas, x + 300, y + 110, time);
  fSwimmingHuman.draw(canvas, x + 100, y + 110, time);
  fSwimmingHuman.draw(canvas, x + 400, y + 110, time);
  fWaterAnimation.draw(canvas, x, y + 100, time);
  canvas.Rectangle(0,115,500,201);
end;

end.
