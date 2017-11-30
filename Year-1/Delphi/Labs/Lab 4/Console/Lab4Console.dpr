program Lab4Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  A: array[1..400] of integer;
  n,max,i,j: integer;
  f: boolean;

begin
  try
    writeln('Hello!');
    repeat
      write('Enter N: '); read(n);
    until (n>=1) and (n<=400);

    writeln('Generated array...');
    for i := 1 to n do begin
      A[i]:= random(100);
      write(A[i]:5);
      if i mod 15 = 0 then writeln;
    end;
    writeln;
    writeln('Done!');

    writeln('Search max number...');
    for i := 1 to n do begin
      f:= true;
      for j := 1 to n do
        if (i<>j) and (A[i] = A[j]) then begin
          f:=false;
          break;
        end;

      if f and (A[i] > max) then max:= A[i];
    end;




    writeln('Done! Max number is ', max);

    readln; readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
