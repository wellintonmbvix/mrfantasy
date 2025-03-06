unit uImprimeComprovante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfImprimeComprovante = class(TForm)
    RadioGroup1: TRadioGroup;
    rdbtn_bobina: TRadioButton;
    rdbtn_a4: TRadioButton;
    procedure Seleciona_TpImpressao(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeComprovante: TfImprimeComprovante;

implementation

uses uReservas;

{$R *.dfm}

procedure TfImprimeComprovante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action              := caFree;
  fImprimeComprovante := Nil;
end;

procedure TfImprimeComprovante.Seleciona_TpImpressao(Sender: TObject);
begin
  if rdbtn_bobina.Checked then
    fReservas.FTpBobina := tpBobina
  else
    fReservas.FTpBobina := tpA4;

  Self.Close;
end;

end.
