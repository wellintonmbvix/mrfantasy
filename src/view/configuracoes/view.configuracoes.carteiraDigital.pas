unit view.configuracoes.carteiraDigital;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Mask,
  Vcl.ExtDlgs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,

  uRotinas,

  classe.global,
  model.carteiraDigital,

  DataSetUtils,

  ormbr.types.blob,

  JvSpin,

  view.cadastros.padrao,

  FireDAC.Comp.Client, JvExMask;

type
  TfrmCarteiraDigital = class(TfrmCadPadrao)
    idtbwallet: TLabeledEdit;
    descricao: TLabeledEdit;
    Shape1: TShape;
    dias_dep: TJvSpinEdit;
    Label1: TLabel;
    pnlLogo: TPanel;
    imgLogo: TImage;
    SpeedButton1: TSpeedButton;
    opdImg: TOpenPictureDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNovoClick(Sender: TObject);
    procedure sbtnDuplicarClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sbtnDeletarClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure sbtnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure sbtnListaTodosClick(Sender: TObject);
  private
    { Private declarations }
    fdmtb_carteiras: TFDMemTable;
  public
    { Public declarations }
  end;

var
  frmCarteiraDigital: TfrmCarteiraDigital;

implementation

{$R *.dfm}

uses
  view.configuracoes.carteiraDigitalPesquisa,
  controller.dto.carteiraDigital.interfaces,
  controller.dto.carteiraDigital.interfaces.impl;

procedure TfrmCarteiraDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCarteiraDigital := Nil;
end;

procedure TfrmCarteiraDigital.FormCreate(Sender: TObject);
begin
  inherited;
  fdmtb_carteiras := TFDMemTable.Create(nil);
end;

procedure TfrmCarteiraDigital.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(fdmtb_carteiras);
end;

procedure TfrmCarteiraDigital.FormShow(Sender: TObject);
begin
  inherited;
  sbtnNovo.Click;
end;

procedure TfrmCarteiraDigital.sbtnAnteriorClick(Sender: TObject);
begin
  Try
    Self.Navegacao(fdmtb_carteiras, 2);
    Self.DataSetToFiels(fdmtb_carteiras);
    ExibirImagem(fdmtb_carteiras, 'imagem', imgLogo);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmCarteiraDigital.sbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgConfirmacao('Deseja descartar as alterações?') then
    sbtnNovo.Click;
end;

procedure TfrmCarteiraDigital.sbtnProximoClick(Sender: TObject);
begin
  Try
    Self.Navegacao(fdmtb_carteiras, 3);
    Self.DataSetToFiels(fdmtb_carteiras);
    ExibirImagem(fdmtb_carteiras, 'imagem', imgLogo);
  Except
    on e: Exception do
      MsgErro(e.Message);
  End;
  inherited;
end;

procedure TfrmCarteiraDigital.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if opdImg.Execute then
    imgLogo.Picture.LoadFromFile(opdImg.FileName);
end;

{$REGION 'Procedure de manipulação de "objetos"'}

procedure TfrmCarteiraDigital.sbtnDeletarClick(Sender: TObject);
begin
  if operacao <> 'alterar' then
    Exit;

  if Not MsgConfirmacao('Deseja realmente excluir este registro?') then
    Exit;

  Try
    var
    ICarteiraDigital := TICarteiraDigital.New;
    ICarteiraDigital.idtbwallet(fdmtb_carteiras.Fields[0].Value)
      .Build.Delete;
    sbtnNovo.Click;
  Except
    on e: Exception do
      raise Exception.Create('Erro: ' + e.Message);
  End;
  inherited;
end;

procedure TfrmCarteiraDigital.sbtnDuplicarClick(Sender: TObject);
var
  nextId: Integer;
begin
  inherited;
  if operacao = 'incluir' then
  Begin
    MsgAviso('Escolha um cadastro para dublicar');
    Abort;
  End;

  var
  ICarteiraDigital := TICarteiraDigital.New;
  ICarteiraDigital.Build.GetLastId('tbcfgwalletsdigital', '', 'idtbwallet', nextId);
  idtbwallet.Text := FormatFloat('00', (nextId + 1));
  operacao := 'incluir';
  descricao.SetFocus;
end;

procedure TfrmCarteiraDigital.sbtnListaTodosClick(Sender: TObject);
var
  listaCarteiras: TObjectList<TCarteiraDigital>;
begin
  inherited;
  var
  ICarteiraDigital := TICarteiraDigital.New;
  ICarteiraDigital.Build.ListAll('', listaCarteiras, 'idtbwallet');
  if fdmtb_carteiras.Active then
    fdmtb_carteiras.EmptyDataSet;
  TDataSetHelper.PreencheDataSet<TCarteiraDigital>(listaCarteiras,fdmtb_carteiras);
  listaCarteiras.Clear;
  FreeAndNil(listaCarteiras);
end;

procedure TfrmCarteiraDigital.sbtnNovoClick(Sender: TObject);
var
  nextId: Integer;
begin
  inherited;
  LimpaCampos;
  var
  ICarteiraDigital := TICarteiraDigital.New;
  ICarteiraDigital.Build.GetRecordsNumber('tbcfgwalletsdigital', '', nextId);
  idtbwallet.Text := FormatFloat('00', (nextId + 1));
  operacao := 'incluir';
  descricao.SetFocus;
end;

procedure TfrmCarteiraDigital.sbtnPesquisarClick(Sender: TObject);
var
  listaCarteiras: TObjectList<TCarteiraDigital>;
begin
  OpenFormModal(TfrmPesquisaCarteiraDigital, frmPesquisaCarteiraDigital);
  if TGlobal.entityId > 0 then
    Begin
      var
      ICarteiraDigital := TICarteiraDigital.New;
      ICarteiraDigital.Build.ListAll('tbcfgwalletsdigital = ' + TGlobal.entityId.ToString,
       listaCarteiras,'');
      TDataSetHelper.PreencheDataSet<TCarteiraDigital>(listaCarteiras, fdmtb_carteiras);
      Self.DataSetToFiels(fdmtb_carteiras);
      listaCarteiras.Clear;
      FreeAndNil(listaCarteiras);
      operacao := 'alterar';
      navegando := True;
    End;
  inherited;
end;

procedure TfrmCarteiraDigital.sbtnSalvarClick(Sender: TObject);
var
  imgCarteira: TBlob;
  caminho: String;
begin
  Try
    var
    ICarteiraDigital := TICarteiraDigital.New;
    if imgLogo.Picture.Graphic <> nil then
      begin
        caminho := ExtractFilePath(Application.ExeName) + 'img.jpg';
        var jpegImage := TJPEGImage.Create;
        jpegImage.Assign(imgLogo.Picture.Graphic);
        jpegImage.SaveToFile(caminho);
        FreeAndNil(jpegImage);
        imgCarteira.LoadFromFile(caminho);
      end;

      if operacao = 'incluir' then
        begin
          ICarteiraDigital
              .idtbwallet(StrToInt(idtbwallet.Text))
              .descricao(descricao.Text)
              .dias_dep(dias_dep.AsInteger)
              .imagem(imgCarteira)
              .usercad(TGlobal.userId)
              .useralt(TGlobal.userId)
            .Build
          .Insert;
        end
      else
        begin
          var
          listaCarteiras: TObjectList<TCarteiraDigital>;

          var
          objCarteira := ICarteiraDigital.Build.ListById('idtbwallet',
            StrToInt(idtbwallet.Text), listaCarteiras).This;
          ICarteiraDigital.Build.Modify(objCarteira);

          With objCarteira Do
            Begin
              idtbwallet := StrToInt(Self.idtbwallet.Text);
              descricao := Self.descricao.Text;
              dias_dep := Self.dias_dep.AsInteger;
              imagem := imgCarteira;
              useralt := TGlobal.userId;
            End;

          ICarteiraDigital.Build.Update;
          listaCarteiras.Clear;
          FreeAndNil(listaCarteiras);
        end;
    MsgInformacao('Informações salvas com sucesso!');
    sbtnNovo.Click;
  Except
    On E: Exception do
      MsgErro(E.Message);
  End;
  inherited;
end;

{$ENDREGION}

end.
