program Lab12Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Digits = [0..9]; // Множина цифр від 0 до 9

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

    // Просимо користувача ввести бажане число
    write('Please, enter number: '); readln(number);
    writeln('Ok, I`m parsing your number...');

    // Присвоюємо множинам початкові порожні значення
    Included:= []; Excluded:= []; Repeated:= [];

    while number <> 0 do begin  // Розбираємо число на цифри
      tmp:= number mod 10;      // Присвоюємо останню цифру змінній tmp
      if tmp in Included then   // Якщо число вже входить в Incluede,
        Include(Repeated, tmp); // включаємо його в Repeated

      Include(Included, tmp);   // Включаємо число в множину Included
      number:= number div 10;   // Переходимо до наступної цифри
    end;

    // Отримуємо множину цифр, що не входять в число
    Excluded:= Digits - Included;

    // Виводимо цифри, що входять в число
    writeln; writeln('Included digits:');
    for i := 0 to 9 do
      if i in Included then write(i:4);

    // Виводимо цифри, що не входять
    writeln; writeln('Excluded digits:');
    for i := 0 to 9 do
      if i in Excluded then write(i:4);

    // Виводимо цифри, що повторюються
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
