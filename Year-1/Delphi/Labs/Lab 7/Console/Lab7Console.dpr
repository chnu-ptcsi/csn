program Lab7Console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  student = record
      name: string[15];
      group: integer;
      faculty: integer;
      mark: integer;
    end;

var
  students: array of student;
  s: student;
  i,j: integer;

begin
  try
    writeln('Hello! Its Lab7Console.');
    writeln('--- --- ---');

    i:=0;
    while not(s.name = 'n') do begin
      write('Enter student`s name or `n` to continue: ');
      readln(s.name);
      if s.name = 'n' then continue; // If first argument = n, then skip to sort
      write('His group: '); readln(s.group);
      write('His faculty: '); readln(s.faculty);
      write('His mark: '); readln(s.mark);

      SetLength(students, i+1); // Set length
      students[i]:= s;
      inc(i);
    end;


    // Order by faculty
    for i := Low(students) to High(students) do
      for j := Low(students) to High(students) do
        if (students[i].faculty < students[j].faculty) and not(i=j) then begin
          s:= students[i];
          students[i]:= students[j];
          students[j]:= s;
        end;


    // Order by groups
    for i := Low(students) to High(students) do
      for j := Low(students) to High(students) do
        if  (students[i].group < students[j].group)
        and (students[i].faculty = students[j].faculty)
        and not(i=j) then begin
          s:= students[i];
          students[i]:= students[j];
          students[j]:= s;
        end;


    // Order by marks
    for i := Low(students) to High(students) do
      for j := Low(students) to High(students) do
        if  (students[i].mark < students[j].mark)
        and (students[i].group = students[j].group)
        and (students[i].faculty = students[j].faculty)
        and not(i=j) then begin
          s:= students[i];
          students[i]:= students[j];
          students[j]:= s;
        end;


    // Write list
    writeln('Name':16, 'Fac':10, 'Group':12, 'Mark':11);
    for i := Low(students) to High(students) do
      writeln(students[i].name:16,
              students[i].faculty:10,
              students[i].group:12,
              students[i].mark:11);

    readln;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
