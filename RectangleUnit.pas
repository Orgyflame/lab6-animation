unit RectangleUnit;

interface

uses GraphicsInterfaces, Vcl.Graphics;

type
  TRectangle = class(TInterfacedObject, IDrawable, IScalable)
  private
  var
    fLength, fHeight: double;
    fColor: TColor;

  public
    constructor Create();
    destructor Destroy();

    procedure scaleBy(scale: double);
    procedure draw(canvas: TCanvas; x, y: Integer);
    property length: double read fLength write fLength;
    property height: double read fHeight write fHeight;
    property color: TColor read fColor write fColor;
  end;

implementation

{ TRectangle }

constructor TRectangle.Create;
begin
end;

destructor TRectangle.Destroy;
begin

end;

procedure TRectangle.draw(canvas: TCanvas; x, y: Integer);
begin

end;

procedure TRectangle.scaleBy(scale: double);
begin

end;

end.
