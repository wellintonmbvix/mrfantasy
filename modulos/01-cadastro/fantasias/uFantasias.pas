unit uFantasias;
interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ExtDlgs,
  Vcl.Mask,
  uControle,
  uCadPadrao,
  uGlobal,
  uClasseFantasias,
  uRotinas,
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
  TfFantasias = class(TfCadPadrao)
    ledt_idproduto: TLabeledEdit;
    ledt_nome: TLabeledEdit;
    Label1: TLabel;
    mem_descricao: TMemo;
    jvvedt_custo: TJvValidateEdit;
    JvLabel1: TJvLabel;
    jvvedt_venda: TJvValidateEdit;
    JvLabel2: TJvLabel;
    jvvedt_aluguel: TJvValidateEdit;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    jvvedt_estoque: TJvValidateEdit;
    JvLabel6: TJvLabel;
    jvvedt_estoquemin: TJvValidateEdit;
    cbox_tipo: TComboBox;
    JvLabel7: TJvLabel;
    cbox_status: TComboBox;
    Label2: TLabel;
    pnlImagem: TPanel;
    imgFoto: TImage;
    sbtAddImagem: TSpeedButton;
    opgImage: TOpenPictureDialog;
    cbox_itemvenda: TComboBox;
    JvLabel8: TJvLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtAddImagemClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure mem_descricaoEnter(Sender: TObject);
    procedure mem_descricaoExit(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure jvvedt_vendaChange(Sender: TObject);
    procedure jvvedt_aluguelChange(Sender: TObject);
    procedure jvvedt_vendaClick(Sender: TObject);
    procedure jvvedt_vendaEnter(Sender: TObject);
    procedure ledt_idprodutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fFantasias: TfFantasias;
  estoqueold: Integer = 0;

implementation

{$R *.dfm}

uses uPrincipal, uPesquisaFantasias;

procedure TfFantasias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fFantasias := Nil
end;

procedure TfFantasias.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfFantasias.jvvedt_aluguelChange(Sender: TObject);
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

procedure TfFantasias.jvvedt_vendaChange(Sender: TObject);
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

procedure TfFantasias.jvvedt_vendaClick(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfFantasias.jvvedt_vendaEnter(Sender: TObject);
begin
  inherited;
  TJvValidateEdit(Sender).SelStart := Length(TJvValidateEdit(Sender).Text);
end;

procedure TfFantasias.ledt_idprodutoExit(Sender: TObject);
var
//  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  if ledt_idproduto.Text <> EmptyStr then
  Begin
    Try
      vControle       := TControle.Create;
      ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);

      With ClasseFantasias Do
      Begin
        CarregaDados(StrToInt(ledt_idproduto.Text));

        if uPrincipal.vControle.SqlGeral.RecordCount < 1 then
          Exit;

        ledt_idproduto.Text := FormatFloat('00000', Fantasia);
        ledt_nome.Text := Nome;
        mem_descricao.Text := Descricao;
        jvvedt_custo.Value := VlCusto;
        jvvedt_venda.Value := VlVenda;
        jvvedt_aluguel.Value := VlAluguel;
        cbox_tipo.ItemIndex := Tipo;
        jvvedt_estoque.Value := Estoque;
        estoqueold := Estoque;
        jvvedt_estoquemin.Value := EstoqueMin;
        cbox_status.ItemIndex := Integer(Ativo);
        case AnsiIndexStr(UpperCase(ItemVenda), ['AL', 'VE', 'AM']) of
          0:
            cbox_itemvenda.ItemIndex := 0;
          1:
            cbox_itemvenda.ItemIndex := 1;
          2:
            cbox_itemvenda.ItemIndex := 2;
        end;
        ExibirImagem(vControle.SqlGeral, 'foto', imgFoto);
      End;
      operacao := 'alterar';
    Finally
      FreeAndNil(ClasseFantasias);
//      FreeAndNil(vControle);
    End;
  End
  else
    sbtnNovo.Click;
end;

procedure TfFantasias.mem_descricaoEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfFantasias.mem_descricaoExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfFantasias.sbtAddImagemClick(Sender: TObject);
begin
  inherited;
  if opgImage.Execute then
    imgFoto.Picture.LoadFromFile(opgImage.FileName);
end;

procedure TfFantasias.sbtnAnteriorClick(Sender: TObject);
var
  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  Try
//    vControle       := TControle.Create;
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);
    With ClasseFantasias Do
    Begin
      Query(uPrincipal.vControle.SqlGeral);
      CarregaDados(StrToInt(ledt_idproduto.Text) - 1);

      if uPrincipal.vControle.SqlGeral.RecordCount < 1 then
        Exit;

      ledt_idproduto.Text := FormatFloat('00000', Fantasia);
      ledt_nome.Text := Nome;
      mem_descricao.Text := Descricao;
      jvvedt_custo.Value := VlCusto;
      jvvedt_venda.Value := VlVenda;
      jvvedt_aluguel.Value := VlAluguel;
      cbox_tipo.ItemIndex := Tipo;
      jvvedt_estoque.Value := Estoque;
      estoqueold := Estoque;
      jvvedt_estoquemin.Value := EstoqueMin;
      cbox_status.ItemIndex := Integer(Ativo);
      case AnsiIndexStr(UpperCase(ItemVenda), ['AL', 'VE', 'AM']) of
        0:
          cbox_itemvenda.ItemIndex := 0;
        1:
          cbox_itemvenda.ItemIndex := 1;
        2:
          cbox_itemvenda.ItemIndex := 2;
      end;
      ExibirImagem(uPrincipal.vControle.SqlGeral, 'foto', imgFoto);
    End;
    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseFantasias);
//    FreeAndNil(vControle);
  End;
end;

procedure TfFantasias.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as altera  es?') then
    sbtnNovo.Click;
end;

procedure TfFantasias.sbtnDeletarClick(Sender: TObject);
var
  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  if operacao <> 'alterar' then
    Abort;
  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Abort;
  Try
//    vControle       := TControle.Create;
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);
    With ClasseFantasias Do
    Begin
      Fantasia := StrToInt(ledt_idproduto.Text);
      if ExcluiFantasias then
        sbtnNovo.Click;
    End;
  Finally
    FreeAndNil(ClasseFantasias);
//    FreeAndNil(vControle);
  End;
end;

procedure TfFantasias.sbtnDuplicarClick(Sender: TObject);
var
  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  if operacao = 'incluir' then
  Begin
    MsgAviso('Escolha uma fantasia para dublicar');
    Abort;
  End;
  Try
//    vControle       := vControle.Create;
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);
    ledt_idproduto.Text := FormatFloat('00000', ClasseFantasias.PegarRegistro);
    cbox_tipo.ItemIndex := 0; // 0-Reseta escolha de tipo
    cbox_status.ItemIndex := 1; // 1-Para sempre ativo
    operacao := 'incluir';
    jvvedt_custo.Value := 0;
    jvvedt_venda.Value := 0;
    jvvedt_aluguel.Value := 0;
    jvvedt_estoque.Value := 0;
    estoqueold := 0;
    jvvedt_estoquemin.Value := 0;
    imgFoto.Picture := Nil;
    ledt_nome.SetFocus;
  Finally
    FreeAndNil(ClasseFantasias);
//    FreeAndNil(vControle);
  End;
end;

procedure TfFantasias.sbtnNovoClick(Sender: TObject);
var
  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  Try
    LimpaCampos;
//    vControle       := TControle.Create;
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);
    ledt_idproduto.Text := FormatFloat('00000', ClasseFantasias.PegarRegistro);
    cbox_tipo.ItemIndex := 0; // 0-Reseta escolha de tipo
    cbox_status.ItemIndex := 1; // 1-Para sempre ativo
    imgFoto.Picture := Nil;
    jvvedt_custo.Value := 0;
    jvvedt_venda.Value := 0;
    jvvedt_aluguel.Value := 0;
    jvvedt_estoque.Value := 0;
    estoqueold := 0;
    jvvedt_estoquemin.Value := 0;
    operacao := 'incluir';
    cbox_itemvenda.ItemIndex := 0;
    // Apagando imagem temporária
    DeleteFile('./img.jpg');
    ledt_nome.SetFocus;
  Finally
    FreeAndNil(ClasseFantasias);
//    FreeAndNil(vControle);
  End;
end;

procedure TfFantasias.sbtnPesquisarClick(Sender: TObject);
var
//  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  Try
//    vControle       := TControle.Create;
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);
    With ClasseFantasias Do
    Begin
      nProduto := 0;
      OpenFormModal(TfPesquisaFantasias, fPesquisaFantasias);
      if nProduto > 0 then
      Begin

        CarregaDados(nProduto);
        ledt_idproduto.Text := FormatFloat('00000', Fantasia);
        ledt_nome.Text := Nome;
        mem_descricao.Text := Descricao;
        jvvedt_custo.Value := VlCusto;
        jvvedt_venda.Value := VlVenda;
        jvvedt_aluguel.Value := VlAluguel;
        cbox_tipo.ItemIndex := Tipo;
        jvvedt_estoque.Value := Estoque;
        estoqueold := Estoque;
        jvvedt_estoquemin.Value := EstoqueMin;
        cbox_status.ItemIndex := Integer(Ativo);
        case AnsiIndexStr(UpperCase(ItemVenda), ['AL', 'VE', 'AM']) of
          0:
            cbox_itemvenda.ItemIndex := 0;
          1:
            cbox_itemvenda.ItemIndex := 1;
          2:
            cbox_itemvenda.ItemIndex := 2;
        end;
        ExibirImagem(uPrincipal.vControle.SqlGeral, 'foto', imgFoto);
        operacao := 'alterar';
      End;
    End;
  Finally
    FreeAndNil(ClasseFantasias);
//    FreeAndNil(vControle);
  End;
end;

procedure TfFantasias.sbtnProximoClick(Sender: TObject);
var
//  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  Try
//    vControle       := TControle.Create;
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);
    With ClasseFantasias Do
    Begin
      Query(uPrincipal.vControle.SqlGeral);
      CarregaDados(StrToInt(ledt_idproduto.Text) + 1);

      if uPrincipal.vControle.SqlGeral.RecordCount < 1 then
        Exit;

      ledt_idproduto.Text := FormatFloat('00000', Fantasia);
      ledt_nome.Text := Nome;
      mem_descricao.Text := Descricao;
      jvvedt_custo.Value := VlCusto;
      jvvedt_venda.Value := VlVenda;
      jvvedt_aluguel.Value := VlAluguel;
      cbox_tipo.ItemIndex := Tipo;
      jvvedt_estoque.Value := Estoque;
      estoqueold := Estoque;
      jvvedt_estoquemin.Value := EstoqueMin;
      cbox_status.ItemIndex := Integer(Ativo);
      case AnsiIndexStr(UpperCase(ItemVenda), ['AL', 'VE', 'AM']) of
        0:
          cbox_itemvenda.ItemIndex := 0;
        1:
          cbox_itemvenda.ItemIndex := 1;
        2:
          cbox_itemvenda.ItemIndex := 2;
      end;
      ExibirImagem(uPrincipal.vControle.SqlGeral, 'foto', imgFoto);
    End;
    operacao := 'alterar';
  Finally
    FreeAndNil(ClasseFantasias);
//    FreeAndNil(VControle);
  End;
end;

procedure TfFantasias.sbtnSalvarClick(Sender: TObject);
var
//  vControle      : TControle;
  ClasseFantasias: TClasseFantasias;
begin
  inherited;
  Try
//    vControle       := TControle.Create;
    ClasseFantasias := TClasseFantasias.Create(uPrincipal.vControle.Conexao.GetConexao);
    // Se existir alguma imagem apaga no diret rio tempor rio
    if FileExists('./img.jpg') then
      DeleteFile('./img.jpg');
    // Se imagem foi escolhida salva no diret rio tempor rio
    if imgFoto.Picture <> nil then
      imgFoto.Picture.SaveToFile('./img.jpg');
    With ClasseFantasias Do
    Begin
      Fantasia := StrToInt(ledt_idproduto.Text);
      Nome := ledt_nome.Text;
      Descricao := mem_descricao.Text;
      VlCusto := jvvedt_custo.Value;
      VlVenda := jvvedt_venda.Value;
      VlAluguel := jvvedt_aluguel.Value;
      Tipo := cbox_tipo.ItemIndex;
      Estoque := jvvedt_estoque.Value;
      EstoqueMin := jvvedt_estoquemin.Value;
      Ativo := Boolean(cbox_status.ItemIndex);
      case AnsiIndexStr(cbox_itemvenda.Text, ['Aluguel', 'Venda', 'Ambos']) of
        0:
          ItemVenda := 'AL';
        1:
          ItemVenda := 'VE';
        2:
          ItemVenda := 'AM';
      end;
      UserCad := UserLog;
      UserAlt := UserLog;
      // Validando Campos
      if Not ValidaCampos then
        Exit;
      if operacao = 'incluir' then
      begin

        if Not InsereFantasias then
          Exit;

        With uPrincipal.vControle.SqlGeral Do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO tbkardex(');
          SQL.Add('idtbempresa,');
          SQL.Add('documento,');
          SQL.Add('idtbproduto,');
          SQL.Add('tipo,');
          SQL.Add('qtde,');
          SQL.Add('usercad');
          SQL.Add(')VALUES(');
          SQL.Add(':idtbempresa,');
          SQL.Add(':documento,');
          SQL.Add('(SELECT LAST_INSERT_ID()),');
          SQL.Add(':tipo,');
          SQL.Add(':qtde,');
          SQL.Add(':usercad)');
          ParamByName('idtbempresa').Value := EmpLog;
          ParamByName('documento').Value :=
            SomenteNumero('/: ', FormatDateTime('dd/mm/YYYY tt zzz', Now()));
          ParamByName('tipo').Value := 0;
          // 0-Inclus o,1-Ajuste (+),2-Ajuste (-),3-Saida,4-Anula  o Sa da,5-Reserva,6-Anula  o Reserva,7-Devolu  o,8-Anula  o Devolu  o
          ParamByName('qtde').Value := jvvedt_estoque.Value;
          ParamByName('usercad').Value := UserLog;
          ExecSQL;
        End;
      end
      else
      begin
        if Not AlteraFantasias then
          Exit;
        if jvvedt_estoque.Value <> estoqueold then
        Begin
          With uPrincipal.vControle.SqlGeral Do
          Begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO tbkardex(');
            SQL.Add('idtbempresa,');
            SQL.Add('documento,');
            SQL.Add('idtbproduto,');
            SQL.Add('tipo,');
            SQL.Add('qtde,');
            SQL.Add('usercad');
            SQL.Add(')VALUES(');
            SQL.Add(':idtbempresa,');
            SQL.Add(':documento,');
            SQL.Add(':idtbproduto,');
            SQL.Add(':tipo,');
            SQL.Add(':qtde,');
            SQL.Add(':usercad)');
            ParamByName('idtbempresa').Value := EmpLog;
            ParamByName('documento').Value :=
              SomenteNumero('/: ', FormatDateTime('dd/mm/YYYY tt zzz', Now()));
            ParamByName('idtbproduto').Value := StrToInt(ledt_idproduto.Text);
            if jvvedt_estoque.Value > estoqueold then
            Begin
              ParamByName('tipo').Value := 1;
              // 0-Inclus o,1-Ajuste (+),2-Ajuste (-),3-Saida,4-Anula  o Sa da,5-Reserva,6-Anula  o Reserva,7-Devolu  o,8-Anula  o Devolu  o
              ParamByName('qtde').Value := jvvedt_estoque.Value - estoqueold;
            End
            Else
            Begin
              ParamByName('tipo').Value := 2;
              // 0-Inclus o,1-Ajuste (+),2-Ajuste (-),3-Saida,4-Anula  o Sa da,5-Reserva,6-Anula  o Reserva,7-Devolu  o,8-Anula  o Devolu  o
              ParamByName('qtde').Value := jvvedt_estoque.Value - estoqueold;
            End;
            ParamByName('usercad').Value := UserLog;
            ExecSQL;
          End;
        End;
      end;
      sbtnNovo.Click;
    End;
  Finally
    FreeAndNil(ClasseFantasias);
//    FreeAndNil(vControle);
  End;
end;

end.
