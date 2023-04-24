unit WalkingHumanAnimationUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics, HumanUnit, ScalerUnit;

type
  TWalkingHumanAnimation = class(TInterfacedObject, IAnimation)
  private
    human: THuman;
    scaler: TScaler<THuman>;
  public
    constructor create();
    destructor destroy(); override;
    procedure draw(canvas: TCanvas; x, y: Integer; time: Integer);
  end;

implementation

uses System.Math;

constructor TWalkingHumanAnimation.create;
begin
  human := THuman.Create;
  scaler := TScaler<THuman>.create(human);
end;

destructor TWalkingHumanAnimation.destroy;
begin
  scaler.Free;
  human.Free;
  inherited;
end;

procedure TWalkingHumanAnimation.draw(canvas: TCanvas; x, y, time: Integer);
begin
  human.angle := time / 1000;
  human.rightArm.angle := time / 333;
  human.rightArm.angleBetween := time / 117;
  scaler.distance := Abs(8000 - time) / 1000;
  human.draw(canvas, x, y);
end;

end.
