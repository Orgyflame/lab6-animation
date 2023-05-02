
unit SwimmingHumanAnimationUnit;
interface
uses GraphicsInterfaces, Vcl.Graphics, HumanUnit, ScalerUnit;
const l = 2.9;
      r = 3.4;
      lsc = 1;
      rsc = 3;
type
  TSwimmingHumanAnimation = class(TInterfacedObject, IAnimation)
  private
    human: THuman;
    scaler: TScaler<THuman>;
  public
    constructor create();
    destructor destroy(); override;
    procedure draw(canvas: TCanvas; x, y: Integer; time: Integer);
  end;
var delta:double = 0.015;
    tdelta:double = 0.0015;
implementation
uses System.Math;
constructor TSwimmingHumanAnimation.create;
begin
  human := THuman.Create;
  human.angle := 2.9;
  human.leftArm.angleBetween := 3.7;
  human.rightArm.angleBetween := 3.7;
  human.leftLeg.angleBetween := 2.4;
  human.leftLeg.angle := l;
  human.rightLeg.angle := r;
  human.rightLeg.angleBetween := 2.4;
  scaler := TScaler<THuman>.create(human);
end;
destructor TSwimmingHumanAnimation.destroy;
begin
  scaler.Free;
  human.Free;
  inherited;
end;
procedure TSwimmingHumanAnimation.draw(canvas: TCanvas; x, y, time: Integer);
begin
  //human.angle := time / 1000;
  human.rightArm.angle := time / 500;
  human.leftArm.angle := time / 500 + pi;
  //human.scaleBy(time/1000);
  //scaler.distance := 0.5;
  //human.leftLeg.angle := 3.4;
  //human.rightLeg.angle := 2.9;
  if (human.leftLeg.angle > r) or (human.leftLeg.angle < l) then
    delta := -delta;
  human.leftLeg.angle := human.leftLeg.angle - delta;
  human.rightLeg.angle := human.rightLeg.angle + delta;
  if (scaler.distance > rsc) or (scaler.distance  < lsc) then
    tdelta := -tdelta;
  scaler.distance  := scaler.distance + tdelta;
  //scaler.distance := Abs(8000 - time mod 8000) / 1000 + 1;
  human.draw(canvas, x, y);
end;
end.

