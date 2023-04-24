program lab6;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  GraphicsInterfaces in 'GraphicsInterfaces.pas',
  LineUnit in 'LineUnit.pas',
  TwoLinesUnit in 'TwoLinesUnit.pas',
  CircleUnit in 'CircleUnit.pas',
  HumanUnit in 'HumanUnit.pas',
  WaterUnit in 'WaterUnit.pas',
  RectangleUnit in 'RectangleUnit.pas',
  WaterAnimationUnit in 'WaterAnimationUnit.pas',
  MainAnimationUnit in 'MainAnimationUnit.pas',
  WalkingHumanAnimationUnit in 'WalkingHumanAnimationUnit.pas',
  ScalerUnit in 'ScalerUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
