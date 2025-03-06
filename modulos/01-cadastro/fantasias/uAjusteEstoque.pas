unit uAjusteEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, JvExStdCtrls,
  JvEdit, JvValidateEdit;

type
  TfAjuste = class(TForm)
    jvvedt_stock_old: TJvValidateEdit;
    lbl_capestoque: TLabel;
    jvvedt_stock_new: TJvValidateEdit;
    lbl_capestoquenovo: TLabel;
    sbtn_confirmar: TSpeedButton;
    sbtn_cancelar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAjuste: TfAjuste;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfAjuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  := caFree;
    fAjuste := Nil;
end;

procedure TfAjuste.FormKeyPress(Sender: TObject; var Key: Char);
begin
    //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
    If key = #13 then
    Begin
      Key := #0;
      Perform(Wm_NextDlgCtl,0,0);
    End;
end;

end.
