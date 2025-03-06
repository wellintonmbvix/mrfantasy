unit view.cadastros.padrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.Rtti,
  System.TypInfo,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Mask,

  JvCombobox,
  JvToolEdit,
  JvValidateEdit,
  JvStaticText,
  JvExMask,
  JvExExtCtrls,
  JvExtComponent,
  JvPanel,
  JvDatePickerEdit,
  JvSpin,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  classe.global,
  model.usuario,
  uRotinas, Data.DB;

type
  TfrmCadPadrao = class(TForm)
    pnlBotoes: TPanel;
    sbtnNovo: TSpeedButton;
    sbtnDuplicar: TSpeedButton;
    sbtnCancelar: TSpeedButton;
    sbtnSalvar: TSpeedButton;
    sbtnDeletar: TSpeedButton;
    sbtnPesquisar: TSpeedButton;
    sbtnAnterior: TSpeedButton;
    sbtnProximo: TSpeedButton;
    sbtnSair: TSpeedButton;
    shp1: TShape;
    pnlDados: TPanel;
    shp2: TShape;
    shp3: TShape;
    sbtnListaTodos: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnSairClick(Sender: TObject);
    procedure jvpnlTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnListaTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos; Virtual;
    procedure DataSetToFiels(ADataSet: TFDMemTable);
    procedure Navegacao(ADataSet: TFDMemTable; action: SmallInt);
  end;

var
  frmCadPadrao: TfrmCadPadrao;
  operacao: String;
  recordAtual: Integer;
  navegando: Boolean;

implementation

{$R *.dfm}

procedure TfrmCadPadrao.DataSetToFiels(ADataSet: TFDMemTable);
begin
  for var i := 0 to Self.ComponentCount - 1 do
  Begin
    if Components[i] is TEdit then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TEdit(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TEdit(Components[i]).Text := ADataSet.Fields[j].AsString;
          break;
        end;
      end;
    End;
    if Components[i] is TMemo then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        begin
        if TMemo(Components[i]).Name = ADataSet.Fields[j].FieldName then
          TMemo(Components[i]).Text := ADataSet.Fields[j].AsString;
          break;
        end;
      end;
    End;
    if Components[i] is TLabeledEdit then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TLabeledEdit(Components[i]).Name = ADataSet.Fields[j].FieldName then
          begin
            TLabeledEdit(Components[i]).Text := ADataSet.Fields[j].AsString;
            break;
          end;
      end;
    End;
    if Components[i] is TComboBox then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TComboBox(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TComboBox(Components[i]).ItemIndex := TComboBox(Components[i])
            .Items.IndexOf(ADataSet.Fields[j].Value);
          break;
        end;
      end;
    End;
    if Components[i] is TComboBoxEx then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TComboBoxEx(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TComboBoxEx(Components[i]).ItemIndex := TComboBoxEx(Components[i])
            .Items.IndexOf(ADataSet.Fields[j].Value);
          break;
        end;
      end;
    End;
    if Components[i] is TCheckBox then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TCheckBox(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TCheckBox(Components[i]).Checked := ADataSet.Fields[j].AsBoolean;
          break;
        end;
      end;
    End;
    if Components[i] is TJvDateEdit then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TJvDateEdit(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TJvDateEdit(Components[i]).Text := ADataSet.Fields[j].AsString;
          break;
        end;
      end;
    End;
    if Components[i] is TJvComboEdit then
    Begin
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TJvComboEdit(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TJvComboEdit(Components[i]).Text := ADataSet.Fields[j].AsString;
          break;
        end;
      end;
    End;
    if Components[i] is TJvValidateEdit then
    Begin
      TJvValidateEdit(Components[i]).Value := 0;
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TJvValidateEdit(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TJvValidateEdit(Components[i]).Value := ADataSet.Fields[j].Value;
          break;
        end;
      end;
    End;
    if Components[i] is TJvSpinEdit then
    Begin
      TJvSpinEdit(Components[i]).Value := 0;
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TJvSpinEdit(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TJvSpinEdit(Components[i]).Value := ADataSet.Fields[j].Value;
          break;
        end;
      end;
    End;
    if Components[i] is TJvDatePickerEdit then
    Begin
      TJvDatePickerEdit(Components[i]).Date := 0;
      for var j := 0 to Pred(ADataSet.FieldCount) do
      begin
        if TJvDatePickerEdit(Components[i]).Name = ADataSet.Fields[j].FieldName then
        begin
          TJvDatePickerEdit(Components[i]).Date := ADataSet.Fields[j].Value;
          break;
        end;
      end;
    End;
  End;
end;

procedure TfrmCadPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If Key = #13 then
  Begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;

procedure TfrmCadPadrao.FormResize(Sender: TObject);
begin
  Self.WindowState := wsNormal;
end;

procedure TfrmCadPadrao.jvpnlTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmCadPadrao.LimpaCampos;
begin
  for var i := 0 to Self.ComponentCount - 1 do
  Begin
    if Components[i] is TEdit then
    Begin
      TEdit(Components[i]).Text := '';
    End;
    if Components[i] is TMemo then
    Begin
      TMemo(Components[i]).Clear;
    End;
    if Components[i] is TButtonedEdit then
    Begin
      TButtonedEdit(Components[i]).Text := '';
    End;
    if Components[i] is TLabeledEdit then
    Begin
      TLabeledEdit(Components[i]).Text := '';
    End;
    if Components[i] is TComboBox then
    Begin
      TComboBox(Components[i]).Text := '';
      TComboBox(Components[i]).ItemIndex := -1;
    End;
    if Components[i] is TComboBoxEx then
    Begin
      TComboBoxEx(Components[i]).Text := '';
      TComboBoxEx(Components[i]).ItemIndex := -1;
    End;
    if Components[i] is TCheckBox then
    Begin
      TCheckBox(Components[i]).Checked := False;
    End;
    if Components[i] is TJvDateEdit then
    Begin
      TJvDateEdit(Components[i]).Text := '  /  /    ';
    End;
    if Components[i] is TJvComboEdit then
    Begin
      TJvComboEdit(Components[i]).Text := '';
    End;
    if Components[i] is TJvValidateEdit then
    Begin
      TJvValidateEdit(Components[i]).Value := 0;
    End;
    if Components[i] is TJvStaticText then
    Begin
      TJvStaticText(Components[i]).Caption := '';
    End;
    if Components[i] is TJvDatePickerEdit then
    Begin
      TJvDatePickerEdit(Components[i]).Date := Now();
    End;
  End;
end;

procedure TfrmCadPadrao.Navegacao(ADataSet: TFDMemTable; action: SmallInt);
begin
  if (ADataSet.RecordCount > 0) And (navegando) then
  begin
    case action of
      1:
        ADataSet.First;
      2:
        begin
          if (ADataSet.RecNo > 1) then
            ADataSet.Prior;
        end;
      3:
        begin
          if (ADataSet.RecNo >= 1) And (ADataSet.RecNo < ADataSet.RecordCount)
          then
          begin
            ADataSet.Next;
          end;
        end;
      4:
        ADataSet.Last;
    end;
  end;
end;

procedure TfrmCadPadrao.sbtnAnteriorClick(Sender: TObject);
begin
  operacao := 'alterar';
  navegando := True;
end;

procedure TfrmCadPadrao.sbtnListaTodosClick(Sender: TObject);
begin
  sbtnListaTodos.Enabled := False;
  sbtnAnterior.Enabled := True;
  sbtnProximo.Enabled := True;
end;

procedure TfrmCadPadrao.sbtnNovoClick(Sender: TObject);
begin
  operacao := 'incluir';
  navegando := False;
  sbtnListaTodos.Enabled := True;
  sbtnAnterior.Enabled := False;
  sbtnProximo.Enabled := False;
end;

procedure TfrmCadPadrao.sbtnProximoClick(Sender: TObject);
begin
  operacao := 'alterar';
  navegando := True;
end;

procedure TfrmCadPadrao.sbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
