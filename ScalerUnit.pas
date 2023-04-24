unit ScalerUnit;

interface

uses GraphicsInterfaces;

type
  TScaler<T: IScalable> = class
  private
    fScale: double;
    fValue: T;
    procedure setScale(scale: double);
    function getDistance: double;
    procedure setDistance(distance: double);

  public
    constructor create(value: T);
    property scale: double read fScale write setScale;
    // при расстоянии == 1, scale = 1; scale = 1/distance;
    property distance: double read getDistance write setDistance;
    property value: T read fValue;
  end;

implementation

constructor TScaler<T>.create(value: T);
begin
  fScale := 1;
  fValue := value;
end;

function TScaler<T>.getDistance: double;
begin
  if fScale = 0 then Exit(1e6);
  
  result := 1 / fScale;
end;

procedure TScaler<T>.setDistance(distance: double);
begin
  if distance = 0 then distance := 1e-6;

  scale := 1 / distance;
end;

procedure TScaler<T>.setScale(scale: double);
begin
  value.scaleBy(scale / fScale);
  fScale := scale;
end;

end.
