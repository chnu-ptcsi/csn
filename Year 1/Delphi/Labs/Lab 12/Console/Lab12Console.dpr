program Lab12Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Digits = [0..9]; // ������� ���� �� 0 �� 9

var
  number, tmp, i: Integer;
  Included,
  Excluded,
  Repeated: Set of 0..9;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    writeln('Lab12Console!');
    writeln('---  ---  ---');

    // ������� ����������� ������ ������ �����
    write('Please, enter number: '); readln(number);
    writeln('Ok, I`m parsing your number...');

    // ���������� �������� �������� ������ ��������
    Included:= []; Excluded:= []; Repeated:= [];

    while number <> 0 do begin  // ��������� ����� �� �����
      tmp:= number mod 10;      // ���������� ������� ����� ����� tmp
      if tmp in Included then   // ���� ����� ��� ������� � Incluede,
        Include(Repeated, tmp); // �������� ���� � Repeated

      Include(Included, tmp);   // �������� ����� � ������� Included
      number:= number div 10;   // ���������� �� �������� �����
    end;

    // �������� ������� ����, �� �� ������� � �����
    Excluded:= Digits - Included;

    // �������� �����, �� ������� � �����
    writeln; writeln('Included digits:');
    for i := 0 to 9 do
      if i in Included then write(i:4);

    // �������� �����, �� �� �������
    writeln; writeln('Excluded digits:');
    for i := 0 to 9 do
      if i in Excluded then write(i:4);

    // �������� �����, �� ������������
    writeln; writeln('Repeated digits:');
    for i := 0 to 9 do
      if i in Repeated then write(i:4);


    readln;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
