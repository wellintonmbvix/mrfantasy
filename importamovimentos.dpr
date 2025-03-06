program importamovimentos;

uses
  Vcl.Forms,
  uImportaMovimentos in 'uImportaMovimentos.pas' {fImportaMovimentos},
  uControle in 'rotinas\uControle.pas',
  uConexaoBD in 'rotinas\uConexaoBD.pas',
  uRotinas in 'rotinas\uRotinas.pas',
  uGlobal in 'rotinas\uGlobal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfImportaMovimentos, fImportaMovimentos);
  Application.Run;
end.
