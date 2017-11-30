program Lab2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  x,y,z:integer;
  p_str, q_str: string;
  p,q: boolean;

function min(a,b,c:integer):integer;
begin
  if (a<=b) and (a<=c) then
    min:= a
  else begin
    if  b<=c then
      min:= b
    else
      min:= c;
  end;
end;

begin
    write('int X: '); readln(x);
    write('int Y: '); readln(y);
    write('int Z: '); readln(z);
    write('bool P: '); readln(p_str);
    write('bool Q: '); readln(q_str);

    p:= strtobool(p_str);
    q:= strtobool(q_str);

    if min(abs(x), abs(y), abs(z)) > (x+y+z) then
      write(p)
    else
      write(q);

    readln; readln;
end.
