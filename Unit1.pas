unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Diagnostics, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts,
  MainAnimationUnit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormPaint(Sender: TObject);
  private
    fWatch: TStopWatch;
    fAnimation: TMainAnimation;
  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

uses WaterUnit;

{$R *.dfm}

constructor TForm1.Create(owner: TComponent);
begin
  inherited;
  DoubleBuffered := true;
  fWatch := TStopWatch.StartNew;
  fAnimation := TMainAnimation.create;
end;

destructor TForm1.Destroy;
begin
  fAnimation.free;
  inherited;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  PX, PY, i: longint;
  time: Integer;
begin
  time := fWatch.ElapsedMilliseconds;
  fAnimation.draw(canvas, 0, 0, time);
  Invalidate;
  label1.Caption := 'fps: ' + IntToStr(round(1000 / (fWatch.ElapsedMilliseconds - time)));
end;

end.
