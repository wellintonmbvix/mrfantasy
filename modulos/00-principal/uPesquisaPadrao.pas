unit uPesquisaPadrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,

  uRotinas,
  uGlobal,

  Data.DB,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.Mask,
  Vcl.DBGrids,

  JvExDBGrids,
  JvDBGrid;

type
  TfPesquisaPadrao = class(TForm)
    cbox_campo: TComboBox;
    lbl_campo: TLabel;
    pnl_top: TPanel;
    ledt_valor: TLabeledEdit;
    pnl_bottom: TPanel;
    sbtn_anterior: TSpeedButton;
    sbtn_proximo: TSpeedButton;
    cbox_registros: TComboBox;
    lbl_capregistros: TLabel;
    sbtn_search: TSpeedButton;
    jvdb_dados: TJvDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fPesquisaPadrao: TfPesquisaPadrao;

implementation

{$R *.dfm}

end.
