unit view.cadastros.produto;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ExtDlgs,
  Vcl.Mask,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,

  view.cadastros.padrao,
  uRotinas,

  DataSetUtils,
  Data.DB,

  classe.global,
  model.produto,

  ormbr.types.blob,

  FireDAC.Comp.Client,
  FireDAC.Stan.Param,

  JvExStdCtrls,
  JvEdit,
  JvExControls,
  JvLabel,
  JvValidateEdit,
  JvExMask,
  JvToolEdit;

type
  TfrmFantasias = class(TfrmCadPadrao)
    idtbproduto: TLabeledEdit;
    nome: TLabeledEdit;
    Label1: TLabel;
    descricao: TMemo;
    vlrcusto: TJvValidateEdit;
    JvLabel1: TJvLabel;
    vlrvenda: TJvValidateEdit;
    JvLabel2: TJvLabel;
    vlraluguel: TJvValidateEdit;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    estoque: TJvValidateEdit;
    JvLabel6: TJvLabel;
    estoquemin: TJvValidateEdit;
    tipo: TComboBox;
    Label2: TLabel;
    pnlImagem: TPanel;
    imgFoto: TImage;
    sbtAddImagem: TSpeedButton;
    opgImage: TOpenPictureDialog;
    itemvenda: TComboBox;
    JvLabel8: TJvLabel;
    ativo: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtAddImagemClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure descricaoEnter(Sender: TObject);
    procedure descricaoExit(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure vlrvendaChange(Sender: TObject);
    procedure vlraluguelChange(Sender: TObject);
    procedure vlrvendaClick(Sender: TObject);
    procedure vlrvendaEnter(Sender: TObject);
    procedure idtbprodutoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fdmtb_produtos: TFDMemTable;
    estoque_old: Integer;
  public
    { Public declarations }
  end;

var
  frmFantasias: TfrmFantasias;

implementation

{$R *.dfm}

uses
  view.cadastros.produtoPesquisa,
  controller.dto.produto.interfaces,
  controller.dto.produto.interfaces.impl;

procedure TfrmFantasias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmFantasias := Nil
end;

procedure TfrmFantasias.FormCreate(Sender: TObject);
begin
  inherited;
  fdmtb_produtos := TFDMemTable.Create(nil);
end;

procedure TfrmFantasias.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_produtos);
end;

procedure TfrmFantasias.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfrmFantasias.vlraluguelChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);
  if Length(valor) = 0 then
    valor := '0';
  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmFantasias.vlrvendaChange(Sender: TObject);
var
  valor: String;
begin
  valor := SomenteNumero('R$ .,', TJvValidateEdit(Sender).Text);
  if Length(valor) = 0 then
    valor := '0';
  TJvValidateEdit(Sender).Text := FormatCurr('R$ ###,##0.00',
    StrToCurr(valor) / 100);
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmFantasias.vlrvendaClick(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmFantasias.vlrvendaEnter(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfrmFantasias.descricaoEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmFantasias.descricaoExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmFantasias.sbtAddImagemClick(Sender: TObject);
begin
  inherited;
  if opgImage.Execute then
      imgFoto.Picture.LoadFromFile(opgImage.FileName);
end;

procedure TfrmFantasias.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

{$REGION 'Procedures de manipulação de "objetos"'}

procedure TfrmFantasias.sbtnAnteriorClick(Sender: TObject);
var
  listaProdutos: TObjectList<TProduto>;
begin
  Try
    var
    IProduto := TIProduto.New;
    if operacao = 'incluir' then
      begin
        IProduto.Build.GetRecordsNumber('tbprodutos','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      if recordAtual > 0 then
        recordAtual := recordAtual - 1;

    IProduto.Build.ListPaginate('', listaProdutos, 'idtbproduto',
      1, recordAtual);
    if listaProdutos.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TProduto>(listaProdutos, fdmtb_produtos);
      Self.Navegacao(fdmtb_produtos, 2);
      Self.DataSetToFiels(fdmtb_produtos);
      ExibirImagem(fdmtb_produtos, 'foto', imgFoto);
      tipo.ItemIndex := fdmtb_produtos.FieldByName('tipo').Value;
      case AnsiIndexStr(UpperCase(fdmtb_produtos.FieldByName('itemvenda').AsString),['AL','VE','AM']) of
        0:
          itemvenda.ItemIndex := 0;
        1:
          itemvenda.ItemIndex := 1;
        2:
          itemvenda.ItemIndex := 2;
      end;
      if fdmtb_produtos.FieldByName('ativo').AsString = 'Sim' then
        ativo.Checked := false
      else
        ativo.Checked := true;
      operacao := 'alterar';
    end;
    listaProdutos.Clear;
    FreeAndNil(listaProdutos);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmFantasias.sbtnProximoClick(Sender: TObject);
var
  listaProdutos: TObjectList<TProduto>;
begin
  Try
    var
    IProduto := TIProduto.New;
    if operacao = 'incluir' then
      begin
        IProduto.Build.GetRecordsNumber('tbprodutos','',recordAtual);
        recordAtual := recordAtual - 1;
      end
    else
      recordAtual := recordAtual + 1;

    IProduto.Build.ListPaginate('', listaProdutos, 'idtbproduto',
      1, recordAtual);
    if listaProdutos.Count > 0 then
    begin
      TDataSetHelper.PreencheDataSet<TProduto>(listaProdutos, fdmtb_produtos);
      Self.Navegacao(fdmtb_produtos, 3);
      Self.DataSetToFiels(fdmtb_produtos);
      ExibirImagem(fdmtb_produtos, 'foto', imgFoto);
      tipo.ItemIndex := fdmtb_produtos.FieldByName('idtipo').Value;
      case AnsiIndexStr(UpperCase(fdmtb_produtos.FieldByName('itemvenda').AsString),['AL','VE','AM']) of
        0:
          itemvenda.ItemIndex := 0;
        1:
          itemvenda.ItemIndex := 1;
        2:
          itemvenda.ItemIndex := 2;
      end;
      if fdmtb_produtos.FieldByName('ativo').AsString = 'Sim' then
        ativo.Checked := false
      else
        ativo.Checked := true;
      operacao := 'alterar';
    end
    else
      recordAtual := recordAtual - 1;
    listaProdutos.Clear;
    FreeAndNil(listaProdutos);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmFantasias.idtbprodutoExit(Sender: TObject);
var
  listaProdutos: TObjectList<TProduto>;
begin
  inherited;
  if idtbproduto.Text <> EmptyStr then
    begin
      var
      IProduto := TIProduto.New;
      IProduto.Build.ListAll('idtbproduto = ' + idtbproduto.Text, listaProdutos,'');
      if listaProdutos.Count > 0 then
        begin
          TDataSetHelper.PreencheDataSet<TProduto>(listaProdutos,fdmtb_produtos);
          Self.DataSetToFiels(fdmtb_produtos);
          tipo.ItemIndex := fdmtb_produtos.FieldByName('tipo').Value;
          case AnsiIndexStr(UpperCase(fdmtb_produtos.FieldByName('itemvenda').AsString),['AL','VE','AM']) of
            0:
              itemvenda.ItemIndex := 0;
            1:
              itemvenda.ItemIndex := 1;
            2:
              itemvenda.ItemIndex := 2;
          end;
          ExibirImagem(fdmtb_produtos, 'foto', imgFoto);
          operacao := 'alterar';
        end;
      listaProdutos.Clear;
      FreeAndNil(listaProdutos);
    end
  else
    sbtnNovo.Click;
end;

procedure TfrmFantasias.sbtnDeletarClick(Sender: TObject);
begin
  inherited;
  if operacao <> 'alterar' then
    Exit;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Exit;

  Try
    var
    IProduto := TIProduto.New;
    IProduto.idtbproduto(fdmtb_produtos.Fields[0].Value)
      .Build.Delete;
    sbtnNovo.Click;
  Except
    on e: Exception do
      MsgErro(E.Message);
  End;
end;

procedure TfrmFantasias.sbtnDuplicarClick(Sender: TObject);
var
  nextId: Integer;
begin
  inherited;
  if operacao = 'incluir' then
    begin
      MsgAviso('Escolha uma fantasia para dublicar');
      Exit;
    end;

  var
  IProduto := TIProduto.New;
  IProduto.Build.GetLastId('tbprodutos','','idtbproduto',nextId);
  idtbproduto.Text := FormatFloat('000000', (nextId + 1));
  tipo.ItemIndex := 0; // 0-Reseta escolha de tipo
  ativo.Checked := false; // Para sempre ativo
  operacao := 'incluir';
  vlrcusto.Value := 0;
  vlrvenda.Value := 0;
  vlraluguel.Value := 0;
  estoque.Value := 0;
  estoque_old := 0;
  estoquemin.Value := 0;
  imgFoto.Picture := Nil;
  nome.SetFocus;
end;

procedure TfrmFantasias.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  LimpaCampos;
  var
  IProduto := TIProduto.New;
  IProduto.Build.GetLastId('tbprodutos','','idtbproduto',nextId);
  idtbproduto.Text := FormatFloat('00000', (nextId + 1));
  imgFoto.Picture := Nil;
  estoque_old := 0;
  nome.SetFocus;
  // Apagando imagem temporária
  DeleteFile('.\img.jpg');
  inherited;
end;

procedure TfrmFantasias.sbtnPesquisarClick(Sender: TObject);
var
  listaProdutos: TObjectList<TProduto>;
begin
  OpenFormModal(TfrmPesquisaProdutos, frmPesquisaProdutos);
  if TGlobal.entityId > 0 then
    Begin
      var
      IProduto := TIProduto.New;
      IProduto.Build.ListAll('idtbproduto = ' + TGlobal.entityId.ToString,
       listaProdutos,'');
      TDataSetHelper.PreencheDataSet<TProduto>(listaProdutos, fdmtb_produtos);
      Self.DataSetToFiels(fdmtb_produtos);
      listaProdutos.Clear;
      FreeAndNil(listaProdutos);
      ExibirImagem(fdmtb_produtos, 'foto', imgFoto);
      tipo.ItemIndex := fdmtb_produtos.FieldByName('tipo').Value;
      case AnsiIndexStr(UpperCase(fdmtb_produtos.FieldByName('itemvenda').AsString),['AL','VE','AM']) of
        0:
          itemvenda.ItemIndex := 0;
        1:
          itemvenda.ItemIndex := 1;
        2:
          itemvenda.ItemIndex := 2;
      end;
      if fdmtb_produtos.FieldByName('ativo').AsString = 'Sim' then
        ativo.Checked := false
      else
        ativo.Checked := true;
      operacao := 'alterar';
      navegando := True;
    End;
  inherited;
end;

procedure TfrmFantasias.sbtnSalvarClick(Sender: TObject);
var
  imgProduto: TBlob;
  tipoItem: String;
begin
  inherited;
  try
    var
    IProduto := TIProduto.New;
    if imgFoto.Picture.Graphic <> nil then
      begin
        var
        caminho := ExtractFilePath(Application.ExeName) + 'img.jpg';

        var jpegImage := TJPEGImage.Create;

        jpegImage.Assign(imgFoto.Picture.Graphic);
        jpegImage.SaveToFile(caminho);
        FreeAndNil(jpegImage);

        imgProduto.LoadFromFile(caminho);
      end;

    case AnsiIndexStr(UpperCase(itemvenda.Text),['ALUGUEL','VENDA','AMBOS']) of
      0: tipoItem := 'AL';
      1: tipoItem := 'VE';
      2: tipoItem := 'AM';
    end;

    if operacao = 'incluir' then
      begin
        IProduto
            .idtbproduto(StrToInt(idtbproduto.Text))
            .nome(nome.Text)
            .descricao(descricao.Text)
            .foto(imgProduto)
            .vlrcusto(vlrcusto.Value)
            .vlrvenda(vlrvenda.Value)
            .vlraluguel(vlraluguel.Value)
            .Settipo(TEnumTipoProduto(tipo.ItemIndex))
            .estoque(estoque.Value)
            .Setestoquemin(estoquemin.Value)
            .ativo(not ativo.Checked)
            .itemvenda(tipoItem)
            .usercad(TGlobal.userId)
            .useralt(TGlobal.userId)
           .Build
         .Insert;
      end
    else
      begin
        var
        listaProdutos: TObjectList<TProduto>;

        var
        objProduto := IProduto.Build.ListById('idtbproduto',
          StrToInt(idtbproduto.Text), listaProdutos).This;
        IProduto.Build.Modify(objProduto);

        With objProduto do
          Begin
            idtbproduto := StrToInt(Self.idtbproduto.Text);
            nome := Self.nome.Text;
            descricao := Self.descricao.Text;
            foto := imgProduto;
            vlrcusto := Self.vlrcusto.Value;
            vlrvenda := Self.vlrvenda.Value;
            vlraluguel := Self.vlraluguel.Value;
            tipo := TEnumTipoProduto(Self.tipo.ItemIndex);
            estoque := Self.estoque.Value;
            estoquemin := Self.estoquemin.Value;
            ativo := not Self.ativo.checked;
            itemvenda := tipoItem;
            useralt := TGlobal.userId;
          End;
          IProduto.Build.Update;
          listaProdutos.Clear;
          FreeAndNil(listaProdutos);
      end;
    MsgInformacao('Informações salvas com sucesso!');
    sbtnNovo.Click;
  except
    on e: Exception do
      MsgErro(e.Message);
  end;
end;

{$ENDREGION}

end.
