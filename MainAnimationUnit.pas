unit MainAnimationUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics, WaterAnimationUnit,
  WalkingHumanAnimationUnit;

type
  TMainAnimation = class(TInterfacedObject, IAnimation)
  private
    fWaterAnimation: TWaterAnimation;
    fWalkingHuman: TWalkingHumanAnimation;
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
  fWalkingHuman := TWalkingHumanAnimation.create;
end;

destructor TMainAnimation.destroy;
begin
  fWalkingHuman.Free;
  fWaterAnimation.Free;
  inherited;
end;

procedure TMainAnimation.draw(canvas: TCanvas; x, y, time: Integer);
begin
  fWaterAnimation.draw(canvas, x + 50, y + 50, time);

  fWalkingHuman.draw(canvas, x + 150, y + 150, time);
end;

end.
