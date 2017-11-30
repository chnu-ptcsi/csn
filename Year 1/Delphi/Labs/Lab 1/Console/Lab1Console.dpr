program Lab1Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a,b,c,d,e,f,j:integer;
  G:real;

begin
  try
    write('A = '); readln(a);
    write('B = '); readln(b);
    write('C = '); readln(c);
    write('D = '); readln(d);
    write('E = '); readln(e);
    write('F = '); readln(f);
    write('G = '); readln(g);

    G:= 0;
    G:= (c*d*f)/j + a/c - d*a/(c-b+a) + e;

    write('Result: G = ', G:2:1);

    readln;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
