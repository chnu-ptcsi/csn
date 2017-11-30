program Lab9Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  inf: text;
  outf: file of char;
  str, tmp: string;
  i: byte;

begin
  try
    writeln('Hello! Its Lab9Console');
    writeln('--- --- ---');

    assign(inf,'in.dat'); assign(outf, 'out.dat');
    reset(inf);           rewrite(outf);

    str:='';
    while not eof(inf) do begin
      Readln(inf, tmp);
      str:= str + tmp;
    end;

    writeln('Input string: '); writeln(str);
    writeln('Vowels:');
    for i:=1 to Length(str) do begin
      if str[i] in ['a','e','i',
                    'o','y','u',
                    'A','E','I',
                    'O','Y','U'] then begin write(str[i]); continue; end;
      if str[i] in ['b','c','d','f','g',
                    'h','j','k','l','h',
                    'n','p','q','r','s',
                    't','v','w','x','z',
                    'B','C','D','F','G',
                    'H','J','K','L','H',
                    'N','P','Q','R','S',
                    'T','V','W','X','Z'] then write(outf, str[i]);
    end;

    close(inf); close(outf);
    readln;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
