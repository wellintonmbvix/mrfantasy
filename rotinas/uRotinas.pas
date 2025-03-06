unit uRotinas;

interface

uses

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Dialogs,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Imaging.jpeg,
  Vcl.DBGrids,

  System.SysUtils,
  System.Classes,
  System.Variants,
  System.UITypes,
  System.RegularExpressions,
  System.MaskUtils,
  System.StrUtils,
  System.Win.Registry,
  System.zip,
  System.Generics.Collections,

  JVDBGrid,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,

  Data.DB,
  Winapi.ActiveX;

const
  OffsetMemoryStream: Int64 = 0;

  // Funções
function MascaraInscricao(Inscricao, Estado: String): String;
function MascaraCpfCnpj(Valor: String): String;
function ValidaCpfCnpj(Valor: String): Boolean;
function SomenteNumero(Valor, Campo: String): String;
function MascaraData(Campo: TLabeledEdit; Tecla: Char): String;
function MascaraFone(Campo: TLabeledEdit; Tecla: Char): String;
function ValidateEmail(const emailAddress: string): Boolean;
function FNUMD(Objeto: TLabeledEdit; Texto, VKey: String;
  Espaco, Decimal: Integer): String;
function MsgConfirmacao(Texto: String): Boolean;
function Crypt(Action, Src: String): String;
function fncAlturaBarraTarefas: Integer;
function RetornaIBGE(Tabela: TFDQuery; Municipio, Uf: String): String;
function GetEnvVarValue(const VarName: string): string;
function ValidaCST(Tabela: TFDQuery; Valor: String): Boolean;
function ValidaCFOP(Tabela: TFDQuery; Valor, Operacao: String): Boolean;
function GetComputerNameFunc: string;
function GetBuildInfo(Prog: string): string;
function CreateProcessSimple(cmd: string): Boolean;
function BkpMySQL(Database, Usuario, Senha, Destino: String; Porta: Integer;
  Confirmar: Boolean; PanelStatus: TStatusPanel): Boolean;
function LoadReportStream(Report_RCDATA, ArquivoDestino : String) : String;
function GuidCreate: String;
function PadC(S: String; Len: Byte): String; // Centraliza Texto num determinado espaço
function PadR(S: String; N: Integer): String; // Alinha Texto a Direita num determinado espaço
function PadL(S: String; N: Integer): String; // Alinha Texto a Esquerda num determinado espaço
function IsPNG(const BlobData: TStream): Boolean;

// Procedures
procedure MsgAviso(Texto: String);
procedure MsgInformacao(Texto: String);
procedure MsgErro(Texto: String);
procedure OpenForm(FClass: TFormClass; var fmFormulario);
procedure OpenFormModal(FClass: TFormClass; var fmFormulario);
procedure ExibirImagem(DataSet: TDataSet; BlobFieldName: String;
  ImgExibicao: TImage);
procedure Arredondarcantos(componente: TWinControl; Radius : SmallInt);
procedure ListarArquivos(Path, Extensao: String; Lista: TStrings);
procedure AlinharPanel(AForm: TForm; APanel: TPanel; ACentro: Boolean);
procedure AlinharPanel2(ADBGrid: TJVDBGrid; APanel: TPanel; ACentro: Boolean);

implementation

uses uGlobal;

{$REGION 'Bloco de funções'}

function MascaraInscricao(Inscricao, Estado: String): String;
var
  mascara: String;
  contador1, contador2: Integer;
begin

  if AnsiUpperCase(Inscricao) = 'ISENTO' then
  Begin
    Result := Inscricao;
  End
  Else
  Begin
    case AnsiIndexStr(UpperCase(Estado), ['AC', 'AL', 'AP', 'AM', 'BA', 'CE',
      'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
      'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO']) of

      0:
        mascara := '**.***.***/***-**';
      1:
        mascara := '*********';
      2:
        mascara := '*********';
      3:
        mascara := '**.***.***-*';
      4:
        mascara := '******-**';
      5:
        mascara := '********-*';
      6:
        mascara := '***********-**';
      7:
        mascara := '***.***.**-*';
      8:
        mascara := '**.***.***-*';
      9:
        mascara := '*********';
      10:
        mascara := '**********-*';
      11:
        mascara := '*********';
      12:
        mascara := '***.***.***/****';
      13:
        mascara := '**-******-*';
      14:
        mascara := '********-*';
      15:
        mascara := '********-**';
      16:
        mascara := '**.*.***.*******-*';
      17:
        mascara := '*********';
      18:
        mascara := '**.***.**-*';
      19:
        mascara := '**.***.***-*';
      20:
        mascara := '***/*******';
      21:
        mascara := '***.*****-*';
      22:
        mascara := '********-*';
      23:
        mascara := '***.***.***';
      24:
        mascara := '***.***.***.***';
      25:
        mascara := '*********-*';
      26:
        mascara := '***********';

    end;

    contador2 := 1;

    Result := '';

    mascara := mascara + '****';

    For contador1 := 1 To Length(mascara) Do
    Begin

      IF Copy(mascara, contador1, 1) = '*' Then
        Result := Result + Copy(Inscricao, contador2, 1);

      IF Copy(mascara, contador1, 1) <> '*' Then
        Result := Result + Copy(mascara, contador1, 1);

      IF Copy(mascara, contador1, 1) = '*' Then
        contador2 := contador2 + 1;

    End;

    Result := Trim(Result);
  End;

end;

function MascaraCpfCnpj(Valor: String): String;
var
  mascara: String;
  contador1, contador2: Integer;
begin
  if Length(Valor) = 14 then
    mascara := '**.***.***/****-**'
  else
    mascara := '***.***.***-**';

  contador2 := 1;

  Result := '';

  mascara := mascara + '****';

  For contador1 := 1 To Length(mascara) Do
  Begin

    IF Copy(mascara, contador1, 1) = '*' Then
      Result := Result + Copy(Valor, contador2, 1);

    IF Copy(mascara, contador1, 1) <> '*' Then
      Result := Result + Copy(mascara, contador1, 1);

    IF Copy(mascara, contador1, 1) = '*' Then
      contador2 := contador2 + 1;
  End;

  Result := Trim(Result);
end;

function ValidaCpfCnpj(Valor: String): Boolean;
var
  i, d1, d2, n1, n2, n3, n4, n5, n6, n7, n8, n9, sm, r,
    peso: Integer;
  digitado, calculado, documento, dig13, dig14: String[25];
begin
  Result := False;

  if Length(Valor) = 14 then
    documento := 'cnpj'
  else if Length(Valor) = 11 then
    documento := 'cpf'
  else
    Exit;

  if documento = 'cnpj' then
  Begin
    if ((Valor = '00000000000000') or (Valor = '11111111111111') or
      (Valor = '22222222222222') or (Valor = '33333333333333') or
      (Valor = '44444444444444') or (Valor = '55555555555555') or
      (Valor = '66666666666666') or (Valor = '77777777777777') or
      (Valor = '88888888888888') or (Valor = '99999999999999') or
      (Length(Valor) <> 14)) then
    Exit;

    try
      { *-- Cálculo do 1o. Digito Verificador --* }
      sm := 0;
      peso := 2;
      for i := 12 downto 1 do
      begin
        // StrToInt converte o i-ésimo caractere do CNPJ em um número
        sm := sm + (StrToInt(Valor[i]) * peso);
        peso := peso + 1;
        if (peso = 10) then
          peso := 2;
      end;
      r := sm mod 11;
      if ((r = 0) or (r = 1)) then
        dig13 := '0'
      else
        str((11 - r): 1, dig13);
      // converte um número no respectivo caractere numérico

      { *-- Cálculo do 2o. Digito Verificador --* }
      sm := 0;
      peso := 2;
      for i := 13 downto 1 do
      begin
        sm := sm + (StrToInt(Valor[i]) * peso);
        peso := peso + 1;
        if (peso = 10) then
          peso := 2;
      end;
      r := sm mod 11;
      if ((r = 0) or (r = 1)) then
        dig14 := '0'
      else
        str((11 - r): 1, dig14);

      { Verifica se os digitos calculados conferem com os digitos informados. }
      if ((dig13 = Valor[13]) and (dig14 = Valor[14])) then
        Result := true
      else
        Result := False;
    except
      Result := False
    end;

  End
  Else
  Begin
    n1 := StrToInt(Valor[1]);
    n2 := StrToInt(Valor[2]);
    n3 := StrToInt(Valor[3]);
    n4 := StrToInt(Valor[4]);
    n5 := StrToInt(Valor[5]);
    n6 := StrToInt(Valor[6]);
    n7 := StrToInt(Valor[7]);
    n8 := StrToInt(Valor[8]);
    n9 := StrToInt(Valor[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9
      + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9
      + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := IntToStr(d1) + IntToStr(d2);
    digitado := Valor[10] + Valor[11];
    if calculado = digitado then
      Result := true
    else
      Result := False;
  End;

end;

function SomenteNumero(Valor, Campo: String): String;
var
  i: Integer;
begin
  Result := '';
  if Campo = '' then
    exit;
  for i := 1 to Length(Campo) do
    if Pos(Campo[i], Valor) = 0 then
      Result := Result + Campo[i];
end;

function MascaraData(Campo: TLabeledEdit; Tecla: WideChar): String;
begin
  if not(CharInSet(Tecla, [#8])) then
  begin
    if not(CharInSet(Tecla, ['0' .. '9'])) then
      Tecla := #0;
    if Length(Campo.Text) = 2 then
    begin
      Campo.Text := Campo.Text + '/';
      Campo.Selstart := Length(Campo.Text);
    end;

    if Length(Campo.Text) = 5 then
    begin
      Campo.Text := Campo.Text + '/';
      Campo.Selstart := Length(Campo.Text);
    end;
  end;

end;

function MascaraFone(Campo: TLabeledEdit; Tecla: WideChar): String;
begin
  if not(CharInSet(Tecla, [#8])) then
  begin
    if not(CharInSet(Tecla, ['0' .. '9'])) then
      Tecla := #0;
    if (Length(Campo.Text) = 1) then
    begin
      if Campo.Text[1] = '(' then
        Campo.Text := ''
      else
      begin
        Campo.Text := '(' + Campo.Text;
        Campo.Selstart := Length(Campo.Text);
      end;
    end;
    if Length(Campo.Text) = 3 then
    begin
      Campo.Text := Campo.Text + ')';
      Campo.Selstart := Length(Campo.Text);
    end;
    if (Length(Campo.Text) = 8) and (Copy(Campo.Text, 5, 1) <> '9') then
    begin
      Campo.Text := Campo.Text + '-';
      Campo.Selstart := Length(Campo.Text);
    end;
    if (Length(Campo.Text) = 9) and (Copy(Campo.Text, 5, 1) = '9') then
    begin
      Campo.Text := Campo.Text + '-';
      Campo.Selstart := Length(Campo.Text);
    end;
  end;
end;

function ValidateEmail(const emailAddress: string): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegEx.Create
    ('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  Result := RegEx.Match(emailAddress).Success;
end;

function FNUMD(Objeto: TLabeledEdit; Texto, VKey: String;
  Espaco, Decimal: Integer): String;
Var
  vChar, vDiv: String;
  i: Integer;
begin
  vDiv := '1';
  For i := 1 to Decimal do
    vDiv := vDiv + '0';

  vChar := Copy(Texto, 1, Length(Texto));

  if (vChar = '') or (vChar = '0') then
    vChar := VKey
  else
    vChar := vChar + VKey;

  While (Pos(',', vChar) > 0) or (Pos('.', vChar) > 0) do
  begin
    Delete(vChar, Pos('.', vChar), 1);
    Delete(vChar, Pos(',', vChar), 1);
  end;
  Objeto.MaxLength := Espaco;
  if vChar <> #8 then
    Objeto.Text := Format('%*.*n', [Espaco, Decimal,
      StrToFloat(vChar) / StrToInt(vDiv)]);
  Objeto.Selstart := Length(Objeto.Text);
end;

function Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  if (Src = '') Then
  begin
    Result := '';
    Goto Fim;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + Copy(Src, 1, 2));
    // <--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + Copy(Src, SrcPos, 2));
      // <--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
Fim:
end;

function fncAlturaBarraTarefas: Integer;
var
  rRect: TRect;
  rBarraTarefas: HWND;
begin
  // Localiza o Handle da barra de tarefas
  rBarraTarefas := FindWindow('Shell_TrayWnd', nil);

  // Pega o "retângulo" que envolve a barra e sua altura
  GetWindowRect(rBarraTarefas, rRect);

  // Retorna a altura da barra
  Result := rRect.Bottom - rRect.Top;
end;

function RetornaIBGE(Tabela: TFDQuery; Municipio, Uf: String): String;
begin
  With Tabela Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT CODIGO FROM DBIBGE');
    SQL.Add('WHERE UPPER(MUNICIPIO) = :MUNI AND SIGLAUF = :UF');
    ParamByName('MUNI').Value := AnsiUpperCase(Municipio);
    ParamByName('UF').Value := AnsiUpperCase(Uf);
    Open;
    if Not IsEmpty then
      Result := FieldByName('CODIGO').AsString
    else
      Result := '0000000';
  End;
end;

function GetEnvVarValue(const VarName: string): string;
var
  BufSize: Integer;
begin
  BufSize := GetEnvironmentVariable(PChar(VarName), nil, 0);
  if BufSize > 0 then
  begin
    SetLength(Result, BufSize - 1);
    GetEnvironmentVariable(PChar(VarName), PChar(Result), BufSize);
  end
  else
    Result := '';
end;

function ValidaCST(Tabela: TFDQuery; Valor: String): Boolean;
begin
  Result := False;
  With Tabela Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT CST FROM DBCSTS');
    SQL.Add('WHERE CST = :VALOR');
    ParamByName('VALOR').Value := Valor;
    Open;
    if Not IsEmpty then
      Result := true;
  End;
end;

function ValidaCFOP(Tabela: TFDQuery; Valor, Operacao: String): Boolean;
var
  Continua: Boolean;
begin
  Result := False;
  if AnsiUpperCase(Operacao) = 'ENTRADA' then
  Begin
    case AnsiIndexStr(Copy(Valor, 1, 1),['1','2','3']) of
      0,1,2 : Continua := True;
      else
        begin
          Continua := False;
          MsgAviso('CFOP não é de Entrada');
          Exit;
        end;
    end;
  End;

  if AnsiUpperCase(Operacao) = 'SAIDA' then
  Begin
    case AnsiIndexStr(Copy(Valor, 1, 1),['5','6','7']) of
      0,1,2 : Continua := True;
      else
        begin
          Continua := False;
          MsgAviso('CFOP não é de Saída');
          Exit;
        end;
    end;
  End;

  if Continua then
    With Tabela Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT CFOP FROM DBCFOPS');
      SQL.Add('WHERE CFOP = :VALOR');
      ParamByName('VALOR').Value := Valor;
      Open;
      if Not IsEmpty then
        Result := true
      else
        MsgAviso('CFOP informada é inválida');
    End;
end;

function GetComputerNameFunc: string;
var
  lpBuffer: Array [0 .. 20] of Char;
  nSize: dWord;
  mRet: Boolean;
  erro: dWord;
begin
  nSize := 120;
  mRet := GetComputerName(lpBuffer, nSize);
  if mRet then
    Result := lpBuffer
  else
  begin
    erro := GetLastError();
    MsgErro('Ocorreu o erro ' + IntToStr(erro) +
      ' ao procurar o nome do computador.');
    Result := '';
  end;
end;

function GetBuildInfo(Prog: string): string;
var
  VerInfoSize: dWord;
  VerInfo: Pointer;
  VerValueSize: dWord;
  VerValue: PVSFixedFileInfo;
  Dummy: dWord;
  V1, V2, V3, V4: Word;
begin
  try
    VerInfoSize := GetFileVersionInfoSize(PChar(Prog), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(Prog), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
    with (VerValue^) do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
    end;
    FreeMem(VerInfo, VerInfoSize);
    Result := Format('%d.%d.%d.%d', [V1, V2, V3, V4]);
  except
    Result := '1.0.0';
  end;
end;

function CreateProcessSimple(cmd: string): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_HIDE;
  Result := CreateProcess(nil, PChar(cmd), nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function BkpMySQL(Database, Usuario, Senha, Destino: String; Porta: Integer;
  Confirmar: Boolean; PanelStatus: TStatusPanel): Boolean;
var
  aa, mm, dd, hh, mmm, ss, sss: Word;
  aux, arquivos: string;
  ZipFile  : TZipFile;
begin
  // Para realização da rotina é necessário estar junto da aplicação
  // os arquivos mysqldump.exe, libcrypto-1_1-x64.dll e libssl-1_1-x64.dll
  // todos da mesma versão do bando de dados
  // procedimento realizado em versão x64 do SO quanto do MySQL
  if Confirmar then
    if Not MsgConfirmacao
      ('Para realizar o backup é recomendado todos estarem com o sistema fechado'
      + #13 + 'Deseja continuar?') then
      Abort;

  arquivos := EmptyStr;

  if Not FileExists(ExtractFilePath(Application.ExeName) + 'mysqldump.exe') then
    arquivos := #13 + ExtractFilePath(Application.ExeName) + 'mysqldump.exe';

  if Not FileExists(ExtractFilePath(Application.ExeName) +
    'libcrypto-1_1-x64.dll') then
    arquivos := #13 + ExtractFilePath(Application.ExeName) +
      'libcrypto-1_1-x64.dll';

  if Not FileExists(ExtractFilePath(Application.ExeName) + 'libssl-1_1-x64.dll')
  then
    arquivos := #13 + ExtractFilePath(Application.ExeName) +
      'libssl-1_1-x64.dll';

  if arquivos <> EmptyStr then
  Begin
    MsgErro(PChar('O backup não pôde ser realizado por ausência de arquivo(s): '
      + arquivos));
    Abort;
  End;

  aux := 'cmd.exe /c "' + ExtractFilePath(Application.ExeName) +
    'mysqldump --opt --flush-logs --triggers --port=' + Porta.ToString;
  aux := aux + ' --user=' + Usuario + ' --password=' + Senha +
    ' --result-file=backup.sql --databases ' + Database + '"';
  PanelStatus.Text := 'Aguarde. Efetuando Backup';

  Try
    CreateProcessSimple(aux);
    PanelStatus.Text := 'Realizando o Backup';
    decodedate(date, aa, mm, dd);
    decodetime(time, hh, mmm, ss, sss);
    if FileExists('backup.sql') then
    begin
      aux := IntToStr(aa);
      if mm < 10 then
        aux := aux + '0' + IntToStr(mm)
      else
        aux := aux + IntToStr(mm);
      if dd < 10 then
        aux := aux + '0' + IntToStr(dd)
      else
        aux := aux + IntToStr(dd);
      if hh < 10 then
        aux := aux + '0' + IntToStr(hh)
      else
        aux := aux + IntToStr(hh);
      if mmm < 10 then
        aux := aux + '0' + IntToStr(mmm)
      else
        aux := aux + IntToStr(mmm);
      if ss < 10 then
        aux := aux + '0' + IntToStr(ss)
      else
        aux := aux + IntToStr(ss);
      PanelStatus.Text := 'Renomeando o Backup';
      aux := aux + '.sql';
      RenameFile('backup.sql', aux);

      try
        ZipFile := TZipFile.Create;
        ZipFile.Open(GetCurrentDir + '\' + Copy(aux,1,Length(aux)-3) + 'zip', zmWrite);
        ZipFile.Add(aux);
      finally
        FreeAndNil(ZipFile);
      end;

      CopyFile(PChar(extractfiledir(Application.ExeName) + '\' + Copy(aux,1,Length(aux)-3) + 'zip'),
        PChar(Destino + Copy(aux,1,Length(aux)-3) + 'zip'), true);

      DeleteFile(GetCurrentDir + '\' + Copy(aux,1,Length(aux)-3) + 'zip');
      DeleteFile(extractfiledir(Application.ExeName) + '\' + aux);
      DeleteFile(Destino + aux);
      if Confirmar then
        MsgInformacao('Backup realizado com sucesso!')
      else
        PanelStatus.Text := 'Backup Realizado!';
      PanelStatus.Text := '';
    end
    else
    begin
      if Confirmar then
        MsgErro('Não foi possível criar arquivo de Backup')
      else
        PanelStatus.Text := 'Não foi possível criar arquivo de Backup';
      PanelStatus.Text := '';
    end;
    Result := true;
  Except
    On e: Exception Do
    Begin
      if Confirmar then
        MsgErro('Falha ao realizar o backup')
      else
        PanelStatus.Text := 'Falha ao realizar o backup';
      Result := False;
    End;
  End;
end;

function LoadReportStream(Report_RCDATA, ArquivoDestino : String) : String;
var
  fs : TFileStream;
  rs : TResourceStream;
  s : String;
begin
  s := EmptyStr;
  rs := TResourceStream.Create(hInstance, Report_RCDATA, RT_RCDATA);
  s := ExtractFilePath(Application.ExeName) + ArquivoDestino;
  fs := TFileStream.Create(s, fmCreate);
  rs.SaveToStream(fs);
  if Assigned(fs) then
    FreeAndNil(fs);
  if Assigned(rs) then
    FreeAndNil(rs);
  Result := s;
end;

function GuidCreate: String;
var
  ID : TGUID;
begin
  Result := EmptyStr;
  if CoCreateGuid(ID) = S_OK then
    Result := StringReplace(GUIDToString(ID), '-', '',
      [rfReplaceAll, rfIgnoreCase]);

  // *** Adicionado o método StringReplace a função para remover as chaves '{' e '}' que a função incrementa
  // *** Adicionado o método AnsiLowerCase para colocar os caracteres em 'mínusculos' (Perfumaria)

end;

function PadC(S: String; Len: Byte): String;
// Centraliza uma string em um espaço determinado
var
Str:String;
L:byte;
begin
  str :='\';
  if len < Length(s) then
    begin
      Result := '\';
      Exit;
    end;

  l:=(Len-Length(S)) div 2;

  while l > 0 do
    begin
      str:=str+ ' \';
      dec(l);
    end;

  for l:=1 to length(S) do
    begin
      str := str+s[L];
    end;

  Result := str;
end;

function PadR(S: String; N: Integer): String;
begin
  Result := Format('%\'+IntToStr(n)+'.\'+IntToStr(n)+'s\',[s]);
end;

function PadL(S: String; N: Integer): String;
{alinha uma string à esquerda}
begin
  Result := Format('%-\'+IntToStr(n)+'.\'+IntToStr(n)+'s\',[s]);
end;

function IsPNG(const BlobData: TStream): Boolean;
const
  PNGHeader: array[0..7] of Byte = ($89, $50, $4E, $47, $0D, $0A, $1A, $0A);
var
  Buffer: array[0..7] of Byte;
begin
  BlobData.Position := 0; // Certifique-se de começar no início
  Result := (BlobData.Read(Buffer, SizeOf(Buffer)) = SizeOf(Buffer)) and
            CompareMem(@Buffer, @PNGHeader, SizeOf(PNGHeader));
            // There is no overload version of 'Read that can be called with these arguments
end;

{$ENDREGION}
{$REGION 'Bloco de Procedures'}// Bloco de Procedures

procedure MsgAviso(Texto: String);
begin
  Application.MessageBox(PChar(Texto), 'Aviso', mb_ok + mb_iconexclamation);
end;

procedure MsgInformacao(Texto: String);
begin
  Application.MessageBox(PChar(Texto), 'Informação',
    mb_ok + mb_iconinformation);
end;

procedure MsgErro(Texto: String);
begin
  Application.MessageBox(PChar(Texto), 'Erro', mb_ok + mb_iconerror);
end;

function MsgConfirmacao(Texto: String): Boolean;
begin
  Result := False;
  if Application.MessageBox(PChar(Texto), 'Confirmação',
    mb_yesno + mb_iconquestion + mb_defbutton2) = idYes then
    Result := true;
end;

procedure OpenForm(FClass: TFormClass; var fmFormulario);
begin

  if (TForm(fmFormulario) <> nil) then
  begin
    TForm(fmFormulario).BringToFront;
    TForm(fmFormulario).WindowState := wsNormal;
    TForm(fmFormulario).Focused;
  end
  else
  Begin
    Application.CreateForm(FClass, fmFormulario);
  End;

end;

procedure OpenFormModal(FClass: TFormClass; var fmFormulario);
begin

  Application.CreateForm(FClass, fmFormulario);
  if TForm(fmFormulario).Visible then
    TForm(fmFormulario).Visible := False;
  TForm(fmFormulario).ShowModal;

end;

procedure ExibirImagem(DataSet: TDataSet; BlobFieldName: String;
  ImgExibicao: TImage);
var
  imgJpg: TJpegImage;
  imgStream: TMemoryStream;
begin
  if not(DataSet.IsEmpty) And Assigned(DataSet.FindField(BlobFieldName)) and
    not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
  begin
      imgStream := TMemoryStream.Create;
      imgJpg := TJpegImage.Create;
    try
      (DataSet.FieldByName(BlobFieldName) as TBlobField)
        .SaveToStream(imgStream);
//      imgStream.Position := OffsetMemoryStream;
      imgStream.Position := 0;
      imgJpg.LoadFromStream(imgStream);
      ImgExibicao.Picture.Assign(imgJpg);
    finally
      FreeAndNil(imgJpg);
      FreeAndNil(imgStream);
    end;
  end
  else
    ImgExibicao.Picture := Nil;
end;

procedure Arredondarcantos(componente: TWinControl; Radius : SmallInt);
var
  BX: TRect;
  mdo: HRGN;
begin
  with componente do
  begin
    BX := ClientRect;
    mdo := CreateRoundRectRgn(BX.Left, BX.Top, BX.Right, BX.Bottom, Radius, Radius);
    Perform(EM_GETRECT, 0, lParam(@BX));
    InflateRect(BX, -4, -4);
    Perform(EM_SETRECTNP, 0, lParam(@BX));
    SetWindowRgn(Handle, mdo, true);
    Invalidate;
  end;

end;

procedure ListarArquivos(Path, Extensao: String; Lista: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '\*.' + Extensao, faAnyFile, SR) = 0 then
  Begin
    repeat
      if (SR.Attr <> faDirectory) then
        Lista.Add(SR.Name);
    until FindNext(SR) <> 0;
    FindClose(SR);
  End;
end;

procedure AlinharPanel(AForm: TForm; APanel: TPanel; ACentro: Boolean);
begin
  if ACentro then
  begin
    APanel.Left := (AForm.ClientWidth div 2) - (APanel.Width div 2);
    APanel.Top := (AForm.ClientHeight div 2) - (APanel.Height div 2);
  end
  else
  begin
    APanel.Left := (AForm.ClientWidth + 100);
    APanel.Top := (AForm.ClientHeight + 100);
  end;
  APanel.Update;
  AForm.Update;
end;

procedure AlinharPanel2(ADBGrid: TJVDBGrid; APanel: TPanel; ACentro: Boolean);
begin
  if ACentro then
  begin
    APanel.Left := (ADBGrid.Width div 2) - (APanel.Width div 2);
    APanel.Top := (ADBGrid.Height div 2) - (APanel.Height div 2);
  end
  else
  begin
    APanel.Left := (ADBGrid.Width + 100);
    APanel.Top := (ADBGrid.Height + 100);
  end;
  APanel.Update;
  ADBGrid.Update;
end;


{$ENDREGION}

end.

