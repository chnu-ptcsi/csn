program Lab8Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  Vector = record
    x: integer;
    y: integer;
    z: integer;
    p: integer;
  end;

var
  x,y,z,p: Vector;
  a: boolean;

function Scalar(a,b:Vector):integer;
begin
  Scalar:= a.x*b.x + a.y*b.y + a.z*b.z + a.p*b.p;
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    writeln('Hello! Its Lab8Console');
    writeln('--- --- ---');

    write('Enter coordinates X [x y z p]: '); readln(X.x, X.y, X.z, X.p);
    write('Enter coordinates Y [x y z p]: '); readln(Y.x, Y.y, Y.z, Y.p);
    write('Enter coordinates Z [x y z p]: '); readln(Z.x, Z.y, Z.z, Z.p);
    write('Enter coordinates P [x y z p]: '); readln(P.x, P.y, P.z, P.p);

    if Scalar(X,Y) > Scalar(Z,P) then
      a:= true
    else
      a:= false;

    writeln('Result X*Y > Z*P: ',a);

    readln;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
