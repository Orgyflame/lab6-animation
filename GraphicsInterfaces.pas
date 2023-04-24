unit GraphicsInterfaces;


interface
uses Vcl.Graphics;

type
IScalable = interface
  procedure scaleBy(scale: double);
end;

IDrawable = interface
  procedure draw(canvas: TCanvas; x, y: Integer);
end;

IAnimation = interface
  procedure draw(canvas: TCanvas; x, y: Integer; time: Integer);
end;

implementation

end.
