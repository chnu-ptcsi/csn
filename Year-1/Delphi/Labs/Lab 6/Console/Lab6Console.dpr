program Lab6Console;

{$APPTYPE CONSOLE}

uses
  Classes,
  SysUtils;

var
   OutputList: TStringList;
   Arr: array[0..128] of string;
   str: string;
   i,j,k,len: integer;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter     := Delimiter;
   ListOfStrings.DelimitedText := Str;
end;

procedure Remove(id: integer; len: integer);
var i: integer;
begin
  for i := id to len do
    Arr[i]:=Arr[i+1];
end;

begin
   OutputList := TStringList.Create;
   try
//     Split(':', 'word:doc,txt,docx', OutPutList) ;
//     Writeln(OutPutList.Text);
//     Readln;
     writeln('Hello, it`s Lab6Console!');
     writeln(' --- --- --- ');
     writeln('Enter your string: '); readln(str);

     writeln(' --- --- --- ');
     Split(' ', str, OutputList);
     Writeln(OutputList.Text);
     writeln(' --- --- --- ');


     len:= OutputList.Count-1;
     for i := 0 to len do
       Arr[i]:= OutputList[i];

     for i := 0 to len do
       for j := 0 to len do
         if not(i = j) and (Arr[i] = Arr[j]) then begin
           Remove(i, len); Remove(j-1, len);
           len:= len-2;
         end;

     str:='';
     for i := 0 to len do
       str:= str + Arr[i] + ' ';

     writeln('Output: ' + str);

     readln; readln;
   finally
     OutPutList.Free;
   end;
end.
