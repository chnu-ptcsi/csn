program PracticeProject;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm} ,
  ViewBuildingsUnit in 'ViewBuildingsUnit.pas' {ViewBuildingsForm} ,
  AddBuildingsUnit in 'AddBuildingsUnit.pas' {AddBuildingsForm} ,
  CycleProgramUnit in 'CycleProgramUnit.pas' {CycleProgramForm} ,
  SymbolProgramUnit in 'SymbolProgramUnit.pas' {SymbolProgramForm} ,
  ProceduresAndFunctionsUnit
    in 'ProceduresAndFunctionsUnit.pas' {ProceduresAndFunctionsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TViewBuildingsForm, ViewBuildingsForm);
  Application.CreateForm(TAddBuildingsForm, AddBuildingsForm);
  Application.CreateForm(TCycleProgramForm, CycleProgramForm);
  Application.CreateForm(TSymbolProgramForm, SymbolProgramForm);
  Application.CreateForm(TProceduresAndFunctionsForm,
    ProceduresAndFunctionsForm);
  Application.Run;

end.
