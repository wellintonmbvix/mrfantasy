inherited fPesquisaReservas: TfPesquisaReservas
  Caption = 'Mister Fantasy - Pesquisa de Alugu'#233'is'
  ClientHeight = 533
  ClientWidth = 969
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  ExplicitWidth = 975
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_top: TPanel
    Width = 963
    ExplicitWidth = 963
    inherited sbtn_search: TSpeedButton
      Left = 901
      Top = 20
      OnClick = sbtn_searchClick
      ExplicitLeft = 901
      ExplicitTop = 20
    end
    object Label1: TLabel [3]
      Left = 223
      Top = 8
      Width = 96
      Height = 15
      Caption = 'Data de Emiss'#227'o'
    end
    object sbtn_imprimir: TSpeedButton [4]
      Left = 925
      Top = 20
      Width = 24
      Height = 24
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000EDEDEDEDEDED
        EFEFEFDDDDDDCCCCCCCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCCCCCCDCDC
        DCEFEFEFEDEDEDEDEDEDF0F0F0EDEDEDF0F0F09797975252526060605D5D5D5D
        5D5D5D5D5D5D5D5D606060525252969696F0F0F0EEEEEEF0F0F0A7A7A7A5A5A5
        AFAFAF6D6D6D858585EFEFEFE2E2E2E4E4E4E4E4E4E2E2E2F0F0F08686866C6C
        6CAFAFAFA6A6A6A7A7A7525252525252545454525252909090F0F0F0EEEEEEF0
        F0F0F0F0F0EEEEEEF0F0F0919191525252545454525252525252555555555555
        5555555252526262627D7D7D7A7A7A7A7A7A7A7A7A7A7A7A7D7D7D6262625252
        5255555555555555555552525252525252525252525252525252525252525252
        5252525252525252525252525252525252525252525252525252525252525252
        5252525252525454545757575656565656565656565656565757575454545252
        5252525252525252525253535353535352525252525252525252525252525252
        52525252525252525252525252525252525252525353535353535C5C5C525252
        5555555252526C6C6C9999999494949595959595959494949999996D6D6D5252
        525555555252525B5B5BABABAB545454545454525252909090F0F0F0EEEEEEF0
        F0F0F0F0F0EEEEEEF0F0F0919191525252545454545454AAAAAAF0F0F0DADADA
        D4D4D47C7C7C868686F0F0F0EBEBEBEDEDEDEDEDEDEBEBEBF0F0F08888887B7B
        7BD4D4D4D9D9D9F0F0F0EFEFEFEDEDEDF0F0F08C8C8C848484F0F0F0EDEDEDEF
        EFEFEFEFEFEDEDEDF0F0F08585858B8B8BF0F0F0EDEDEDEFEFEFF0F0F0ECECEC
        F0F0F08C8C8C858585F0F0F0EEEEEEF0F0F0F0F0F0EEEEEEF0F0F08686868A8A
        8AF0F0F0ECECECF0F0F0F0F0F0EDEDEDF0F0F08D8D8D808080F0F0F0E3E3E3E5
        E5E5E5E5E5E3E3E3F0F0F08181818C8C8CF0F0F0EEEEEEF0F0F0F0F0F0EDEDED
        F0F0F09797975252525F5F5F5C5C5C5C5C5C5C5C5C5C5C5C5F5F5F5252529595
        95F0F0F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DEDEDECCCCCCCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCCCCCCDEDEDEF0F0F0EFEFEFF0F0F0}
      OnClick = ImpDataXReservas
    end
    object Label5: TLabel [5]
      Left = 335
      Top = 29
      Width = 17
      Height = 15
      Caption = 'at'#233
    end
    inherited cbox_campo: TComboBox
      ItemIndex = 0
      Text = 'Data de Emiss'#227'o'
      OnChange = cbox_campoChange
      Items.Strings = (
        'Data de Emiss'#227'o'
        'Data de Devolu'#231#227'o'
        'Cliente')
    end
    inherited ledt_valor: TLabeledEdit
      Left = 470
      Width = 256
      Height = 23
      EditLabel.Width = 93
      EditLabel.Caption = 'Nome do Cliente'
      EditLabel.ExplicitLeft = 470
      EditLabel.ExplicitTop = 8
      EditLabel.ExplicitWidth = 93
      OnEnter = ledt_valorEnter
      ExplicitLeft = 470
      ExplicitWidth = 256
      ExplicitHeight = 23
    end
    inherited cbox_registros: TComboBox
      Text = '1000'
      OnChange = cbox_registrosChange
      Items.Strings = (
        '1000'
        '500'
        '300'
        '200'
        '100'
        '90'
        '80'
        '70'
        '60'
        '50'
        '40'
        '30'
        '20'
        '10')
    end
    object check_canc: TCheckBox
      Left = 589
      Top = 8
      Width = 119
      Height = 17
      Caption = 'Exibir Canceladas'
      TabOrder = 3
      Visible = False
    end
    object jvdedt_inicial: TJvDatePickerEdit
      Left = 223
      Top = 26
      Width = 106
      Height = 23
      AllowNoDate = True
      Checked = True
      TabOrder = 4
      OnPopupShown = jvdedt_inicialPopupShown
    end
    object RadioGroup1: TRadioGroup
      Left = 732
      Top = 11
      Width = 163
      Height = 41
      Caption = 'Retiradas'
      TabOrder = 5
    end
    object rbtn_retsim: TRadioButton
      Left = 743
      Top = 29
      Width = 41
      Height = 17
      Caption = 'Sim'
      TabOrder = 6
      OnClick = rbtn_retsimClick
    end
    object rbtn_retnao: TRadioButton
      Tag = 1
      Left = 790
      Top = 29
      Width = 41
      Height = 17
      Caption = 'N'#227'o'
      TabOrder = 7
      OnClick = rbtn_retsimClick
    end
    object rbtn_rettodas: TRadioButton
      Tag = 2
      Left = 837
      Top = 29
      Width = 51
      Height = 17
      Caption = 'Todas'
      Checked = True
      TabOrder = 8
      TabStop = True
      OnClick = rbtn_retsimClick
    end
  end
  inherited pnl_bottom: TPanel
    Top = 500
    Width = 963
    ExplicitTop = 500
    ExplicitWidth = 963
    inherited sbtn_anterior: TSpeedButton
      Enabled = False
      OnClick = sbtn_anteriorClick
    end
    inherited sbtn_proximo: TSpeedButton
      Left = 855
      Enabled = False
      OnClick = sbtn_proximoClick
      ExplicitLeft = 855
    end
    object Label2: TLabel
      Left = 225
      Top = 8
      Width = 538
      Height = 15
      Caption = 
        '* - Pressione F2 para confirmar retirada | - Pressione F3 para a' +
        'lterar Dt Retirada e/ou Dt Devolu'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5395026
      Font.Height = -12
      Font.Name = 'Product Sans'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
  inherited jvdb_dados: TJvDBGrid
    Width = 963
    Height = 423
    DataSource = dsReservas
    OnDblClick = jvdb_dadosDblClick
    OnKeyDown = jvdb_dadosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'idtbreserva'
        Title.Alignment = taCenter
        Title.Caption = 'Controle'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtemissao'
        Title.Caption = 'Emiss'#227'o'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 303
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'qtde_total'
        Title.Alignment = taCenter
        Title.Caption = 'Pe'#231'as'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_total'
        Title.Caption = 'Valor'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'forma_pagto'
        Title.Caption = 'Cond. Pagto'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Caption = 'Estado'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'retirada'
        Title.Caption = 'Retirada'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usercad'
        Title.Caption = 'Usu'#225'rio'
        Width = 115
        Visible = True
      end>
  end
  object pnl_dtdevolucao: TPanel
    Left = 242
    Top = 152
    Width = 485
    Height = 41
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    Visible = False
    object Label3: TLabel
      Left = 222
      Top = 13
      Width = 107
      Height = 15
      Caption = 'Data de Devolu'#231#227'o:'
    end
    object sbt_confirma: TSpeedButton
      Left = 447
      Top = 9
      Width = 24
      Height = 24
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000F0F0F0F0F0F0
        F0F0F0F0F0F0EAEAEADFDFDFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0ADADAD757575F0F0F0EF
        EFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEF
        F0F0F0D8D8D85D5D5D525252B4B4B4F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F07C7C7C525252525252636363E3
        E3E3F0F0F0EFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDEDF0F0F0
        A7A7A7525252565656565656525252939393F0F0F0EEEEEEF0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0CFCFCF55555554545452525253535354545452
        5252C7C7C7F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0E9E9E9727272
        5252525252528E8E8E8888885252525252526E6E6EEAEAEAF0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0828282525252585858B3B3B3F0F0F0E4E4E469696952
        5252525252999999F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F08C8C8C636363
        D2D2D2F0F0F0ECECECF0F0F0D2D2D25B5B5B525252525252C4C4C4F0F0F0EEEE
        EEF0F0F0F0F0F0F0F0F0ECECECE7E7E7F0F0F0EEEEEEF0F0F0EEEEEEF0F0F0C5
        C5C5565656525252666666E2E2E2F0F0F0EFEFEFF0F0F0F0F0F0EFEFEFEFEFEF
        EFEFEFF0F0F0F0F0F0F0F0F0EDEDEDF0F0F0BDBDBD555555525252828282F0F0
        F0EFEFEFF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0ED
        EDEDF0F0F0BCBCBC565656525252A0A0A0F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDEDF0F0F0C3C3C35959595252
        52B7B7B7F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0EDEDEDF0F0F0D1D1D1646464525252C5C5C5F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0E3E3
        E37E7E7E535353BABABAF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0EFEFEFB5B5B5ADADAD}
      OnClick = AlterarDtDevolucao
    end
    object Label4: TLabel
      Left = 8
      Top = 13
      Width = 96
      Height = 15
      Caption = 'Data de Retirada:'
    end
    object jvedt_dtdevolucao: TJvDatePickerEdit
      Left = 335
      Top = 10
      Width = 106
      Height = 23
      AllowNoDate = True
      Checked = True
      TabOrder = 0
    end
    object jvedt_dtretirada: TJvDatePickerEdit
      Left = 110
      Top = 10
      Width = 106
      Height = 23
      AllowNoDate = True
      Checked = True
      TabOrder = 1
    end
  end
  object jvdedt_final: TJvDatePickerEdit
    Left = 363
    Top = 31
    Width = 106
    Height = 23
    AllowNoDate = True
    Checked = True
    TabOrder = 4
    OnPopupShown = jvdedt_inicialPopupShown
  end
  object dsReservas: TDataSource
    Enabled = False
    Left = 208
    Top = 112
  end
  object frxReport: TfrxReport
    Version = '6.4.17'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43981.832485763900000000
    ReportOptions.LastChange = 44788.022231018520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 296
    Top = 112
    Datasets = <
      item
        DataSet = frxDBReservas
        DataSetName = 'frxDBReservas'
      end>
    Variables = <
      item
        Name = ' Totalizadores'
        Value = Null
      end
      item
        Name = 'fundoscx'
        Value = Null
      end
      item
        Name = 'suprimentos'
        Value = Null
      end
      item
        Name = 'sangrias'
        Value = Null
      end
      item
        Name = 'totalcash'
        Value = Null
      end
      item
        Name = 'totalcx'
        Value = Null
      end
      item
        Name = 'totalcard_deb'
        Value = Null
      end
      item
        Name = 'totalcard_cre'
        Value = Null
      end
      item
        Name = 'qtde_alugadas'
        Value = Null
      end
      item
        Name = 'qtde_vendidas'
        Value = Null
      end
      item
        Name = 'totalwallet'
        Value = Null
      end
      item
        Name = 'condipgto'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object ghReservas: TfrxGroupHeader
        FillType = ftBrush
        Fill.BackColor = cl3DLight
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReservas."grupo"'
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 20.787415000000000000
          Width = 86.929133860000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Aluguel: [frxDBReservas."idtbreserva"]')
          ParentFont = False
        end
        object frxDBReservascliente: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 20.787415000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente: [frxDBReservas."cliente"]')
          ParentFont = False
        end
        object frxDBReservasestado: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 20.787415000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Status: [frxDBReservas."estado"]')
          ParentFont = False
        end
        object frxDBReservasdtemissao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [frxDBReservas."dtemissao"]')
          ParentFont = False
        end
        object frxDBReservasdtretirada: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 139.842519685039000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Retirada em: [frxDBReservas."dtretirada"]')
          ParentFont = False
        end
        object frxDBReservasdtdevolucao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 279.685220000000000000
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Devolu'#231#227'o em: [frxDBReservas."dtdevolucao"]')
          ParentFont = False
        end
        object frxDBReservasusercad: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 532.913730000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio: [frxDBReservas."usercad"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 81.220470000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 657.638220000000000000
          Top = 62.322820000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Vl. Total')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Top = 62.322820000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Desc$')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 62.322820000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Desc%')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 62.322820000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Vl. Unit')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 62.322820000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 62.322820000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 62.322820000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 62.322820000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Cond. de Pagto: ')
        end
      end
      object TitleReport: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 241.889920000000000000
          Top = 7.559060000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RELAT'#211'RIO - DATA x CUPOM')
          ParentFont = False
        end
      end
      object mdReservas: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = frxDBReservas
        DataSetName = 'frxDBReservas'
        RowCount = 0
        object frxDBReservasitem: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'item'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBReservas."item"]')
          ParentFont = False
        end
        object frxDBReservasproduto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          DataField = 'produto'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBReservas."produto"]')
          ParentFont = False
        end
        object frxDBReservastipo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 321.260050000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'tipo'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBReservas."tipo"]')
          ParentFont = False
        end
        object frxDBReservasqtde: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 30.236220470000000000
          Height = 18.897650000000000000
          DataField = 'qtde'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBReservas."qtde"]')
          ParentFont = False
        end
        object frxDBReservasvalor_unit: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 502.677490000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DataField = 'valor_unit'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBReservas."valor_unit"]')
          ParentFont = False
        end
        object frxDBReservasvalor_desc: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBReservas."perc_desc"]%')
          ParentFont = False
        end
        object frxDBReservasvalor_acre: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 608.504330000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f%'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBReservas."valor_desc"]')
          ParentFont = False
        end
        object frxDBReservasvalor_total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 657.638220000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DataField = 'valor_total'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBReservas."valor_total"]')
          ParentFont = False
        end
      end
      object gfReservas: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object frxDBReservasqtde_total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'qtde_total'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBReservas."qtde_total"]')
          ParentFont = False
        end
        object frxDBReservastotal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 636.961040000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'total'
          DataSet = frxDBReservas
          DataSetName = 'frxDBReservas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBReservas."total"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDash
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 173.858380000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 5.669299880000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RESUMO DA MOVIMENTA'#199#195'O')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'FUNDO DE CAIXA:')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Top = 52.913420000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'SUPRIMENTO:')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590600000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'SANGRIA:')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[suprimentos]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[sangrias]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 30.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fundoscx]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 52.913420000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL CART'#195'O D'#201'BITO:')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 30.236240000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL DINHEIRO:')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 30.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[totalcash]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[totalcard_deb]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[totalcard_cre]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 98.267780000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL CARTEIRA DIGITAL:')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 98.267780000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[totalwallet]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 120.944960000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL TRANSF./DEP.:')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 120.944960000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[totaltransfdep]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 30.236240000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PE'#199'AS ALUGADAS:')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 52.913420000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PE'#199'AS VENDIDAS:')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Top = 30.236240000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[qtde_alugadas]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Top = 52.913420000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[qtde_vendidas]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Top = 147.401670000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL DO CAIXA:')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<fundoscx>+<suprimentos>-<sangrias>+<totalcash>]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 147.401670000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<totalcash>+<totalcard_deb>+<totalcard_cre>+<totalwallet>+<tota' +
              'ltransfdep>]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Top = 143.622140000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 75.590600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL CART'#195'O CR'#201'DITO:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBReservas: TfrxDBDataset
    UserName = 'frxDBReservas'
    CloseDataSource = False
    DataSet = fdqReservas
    BCDToCurrency = False
    Left = 392
    Top = 112
  end
  object fdqReservas: TFDQuery
    Left = 384
    Top = 216
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = True
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 472
    Top = 208
  end
end
