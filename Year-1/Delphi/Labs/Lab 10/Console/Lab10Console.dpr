program Lab10Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  PNode = ^Node;
   Node = record
     data: Real;
     next: PNode;
   end;

var
  Stack: PNode;
  size,i,a,b,c,d,e,f,j,t: Integer;
  G: Real;


procedure Push(var S: PNode; Digit: Real);
var
  x: PNode;
begin
  New(x); {выделяем память под хранение нового элемента стека}
  x^.data := Digit; {заполняем поле данных элемента}
  x^.next := S; {новый элемент "связываем" со стеком}
  S := x;  {созданный элемент определяем как вершину стека}
end;


function Pull(var S: PNode): Real;
var
  X: PNode;
  tmp: Real;
begin
  tmp := S^.data; {считываем значение поля данных в переменную}
  X := S;         {запоминаем адрес вершины стека}
  S := S^.next;   {переносим вершину стека на следующий элемент}
  dispose(X);     {освобождаем память, занятую уже ненужным элементом стека}
end;


begin
  try
    Stack:= nil; {инициализация стека}

    writeln('Hello! It`s a Lab10Console.');
    writeln('--- --- ---');
    write('Enter stack`s size: '); readln(size);

    writeln('Generate random values for a,b,c,d,e,f,j,t and push them to stack:');
    writeln('a':5, 'b':5, 'c':5, 'd':5, 'e':5, 'f':5, 'j':5, 't':5);
    for i := 1 to size do begin
      a:= random(size)+1;  e:= random(size)+1;
      b:= random(size)+1;  f:= random(size)+1;
      c:= random(size)+1;  j:= random(size)+1;
      d:= random(size)+1;  t:= random(size)+1;

      writeln(a:5, b:5, c:5, d:5, e:5, f:5, j:5, t:5);
      G:= c*((d*f)/j) + a/c - (e*t)/(c-b+a);
      Push(Stack, G);
    end;

    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
