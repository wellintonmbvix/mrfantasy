program mrconexao;

uses
  Vcl.Forms,
  uMisterConexao in 'uMisterConexao.pas' {fMisterConexao},
  uRotinas in 'rotinas\uRotinas.pas',
  uGlobal in 'rotinas\uGlobal.pas',
  uControle in 'rotinas\uControle.pas',
  uConexaoBD in 'rotinas\uConexaoBD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMisterConexao, fMisterConexao);
  Application.Run;
end.
