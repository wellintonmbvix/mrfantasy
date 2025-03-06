unit view.cadastros.pesquisaPadrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.Rtti,

  uRotinas,
  uGlobal,
  classe.global,

  ormbr.types.nullable,

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

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPesquisaPadrao = class(TForm)
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
    dbg_dados: TDBGrid;
    fdmtb_dados: TFDMemTable;
    ds_dados: TDataSource;
    procedure dbg_dadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ledt_valorEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbg_dadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;
  currentrg, totalrg: Integer;
  currentpg, totalpg: Currency;
  direcao: String;

implementation

{$R *.dfm}

procedure TfrmPesquisaPadrao.dbg_dadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If odd(fdmtb_dados.RecNo) then
  begin
    dbg_dados.Canvas.Font.Color := clNone;
    dbg_dados.Canvas.Brush.Color := clWhite;
  end
  else
  begin
    dbg_dados.Canvas.Font.Color := clBlack;
    dbg_dados.Canvas.Brush.Color := clMenu;
  end;

  if (gdSelected in State) then
    dbg_dados.Canvas.Brush.Color := clSkyBlue
  else
    dbg_dados.Canvas.Font.Color := clBlack;

  dbg_dados.Canvas.FillRect(Rect);
  dbg_dados.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPesquisaPadrao.dbg_dadosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    TGlobal.entityId := 0;
    if fdmtb_dados.RecordCount > 0 then
    begin
      if fdmtb_dados.Fields[0].DataType = ftInteger then
        TGlobal.entityId := fdmtb_dados.Fields[0].AsInteger
      else
        TGlobal.entityGuid := fdmtb_dados.Fields[0].AsString;

      Self.Close;
    end;
  end;
end;

procedure TfrmPesquisaPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Self.Close;
end;

procedure TfrmPesquisaPadrao.FormShow(Sender: TObject);
begin
  TGlobal.entityId := 0;
  TGlobal.entityGuid := EmptyStr;
end;

procedure TfrmPesquisaPadrao.ledt_valorEnter(Sender: TObject);
begin
  ds_dados.Enabled := False;
end;

end.
