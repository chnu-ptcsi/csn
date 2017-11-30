program Lab5Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  DArr = array of integer;

var
  A,B: DArr;
  n,m,i,j,last_greater: integer;

procedure WriteArr(Arr: DArr);
begin
   for i := Low(Arr) to High(Arr) do begin
     write(Arr[i]:4);
     if (i mod 15 = 0) and not (i=0) then writeln;
   end;
   writeln;
end;

function BubbleSort(Arr: DArr): DArr;
var i,j,temp: integer;
begin
  for i := Low(Arr) to High(Arr) do
    for j := Low(Arr) to High(Arr) do begin
      if (Arr[i] > Arr[j]) and not(i=j) then begin
        temp  := Arr[j];
        Arr[j]:= Arr[i];
        Arr[i]:= temp;
      end;
    end;
    BubbleSort:= Arr;
end;

function InsertAfter(Arr: DArr; number, id: integer): DArr;
var i: integer;
begin
  for i := High(Arr) downto id do
    Arr[i+1]:= Arr[i];
  Arr[id]:= number;
  InsertAfter:= Arr;
end;

begin
  try
    writeln('Hello! Its Lab5Console.');
    writeln('--- --- ---');

    // Enter N and M - arrays length
    repeat
      write('Insert N: '); readln(n);
    until n<=300;
    SetLength(A,n);
    repeat
      write('Insert M: '); readln(m);
    until m<=200;
    SetLength(B, m);

    // Generate A
    writeln('Array A:');
    for i := Low(A) to High(A)-1 do
      A[i]:=random(10);
    WriteArr(A);

    writeln('Array A after sort:');
    A:= BubbleSort(A); // Sort A
    WriteArr(A);

    // Generate B
    writeln('Array B:');
    for i := Low(B) to High(B)-1 do
      B[i]:=random(10);
    WriteArr(B);

    SetLength(A, n+m);

    for i := Low(B) to High(B) do begin
      last_greater:=0;
      for j := Low(A) to High(A) do
        if A[j] >= B[i] then last_greater:= j+1;
      A:= InsertAfter(A, B[i], last_greater);
    end;

    writeln('Result array:');
    WriteArr(A);

    readln;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
