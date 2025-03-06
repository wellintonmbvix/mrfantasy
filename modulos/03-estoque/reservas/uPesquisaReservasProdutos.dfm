object fPesquisaReservasProdutos: TfPesquisaReservasProdutos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pesquisa Produtos Reservados'
  ClientHeight = 532
  ClientWidth = 1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 5395026
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  TextHeight = 14
  object pnl_top: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1071
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 1075
    object sbtn_imprimir: TSpeedButton
      Left = 989
      Top = 24
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
      OnClick = sbtn_imprimirClick
    end
    object lbl_campo: TLabel
      Left = 8
      Top = 6
      Width = 72
      Height = 14
      Caption = 'Pesquisar por'
    end
    object sbtn_search: TSpeedButton
      Left = 959
      Top = 24
      Width = 24
      Height = 24
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000EFEFEFF0F0F0
        9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
        525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
        F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
        DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
        F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
        7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
        EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
        52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
        6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
        EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
        77525252808080F0F0F0F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
        F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
        F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
        D4525252575757D7D7D7F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
        F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
        EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
        76525252828282F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
        6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
        F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
        54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
        91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
      OnClick = sbtn_searchClick
    end
    object Label1: TLabel
      Left = 239
      Top = 29
      Width = 18
      Height = 14
      Caption = 'at'#233
    end
    object cbox_campo: TComboBox
      Left = 8
      Top = 24
      Width = 129
      Height = 22
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Data de Emiss'#227'o'
      OnChange = cbox_campoChange
      Items.Strings = (
        'Data de Emiss'#227'o'
        'Data de Retirada'
        'Data de Devolu'#231#227'o')
    end
    object ledt_valor: TLabeledEdit
      Left = 360
      Top = 24
      Width = 593
      Height = 22
      CharCase = ecUpperCase
      EditLabel.Width = 43
      EditLabel.Height = 14
      EditLabel.Caption = 'Fantasia'
      TabOrder = 1
      Text = ''
    end
    object jvdedt_dtini: TJvDatePickerEdit
      Left = 143
      Top = 24
      Width = 90
      Height = 22
      AllowNoDate = True
      Checked = True
      TabOrder = 2
      OnChange = cbox_campoChange
    end
    object jvdedt_dtfim: TJvDatePickerEdit
      Left = 263
      Top = 24
      Width = 90
      Height = 22
      AllowNoDate = True
      Checked = True
      TabOrder = 3
      OnChange = cbox_campoChange
    end
    object rgrp_Retiradas: TRadioGroup
      Left = 815
      Top = 11
      Width = 131
      Height = 41
      Caption = 'Retiradas'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'N'#227'o'
        'Sim')
      TabOrder = 4
      Visible = False
    end
    object rgrp_Devolvidas: TRadioGroup
      Left = 677
      Top = 11
      Width = 132
      Height = 41
      Caption = 'Devolvidas'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'N'#227'o'
        'Sim')
      TabOrder = 5
      Visible = False
    end
  end
  object jvdb_dados: TJvDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 1071
    Height = 450
    Hint = 'Clique no t'#237'tulo da coluna para reorganizar'
    Align = alClient
    DataSource = dsReservas
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = 5395026
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = jvdb_dadosDblClick
    OnTitleClick = jvdb_dadosTitleClick
    SortMarker = smUp
    TitleButtons = True
    AlternateRowColor = clMenu
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 18
    TitleRowHeight = 18
    Columns = <
      item
        Expanded = False
        FieldName = 'produto'
        Title.Caption = 'Produto'
        Width = 373
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
        FieldName = 'dtretirada'
        Title.Caption = 'Retirada'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtdevolucao'
        Title.Caption = 'Devolu'#231#227'o'
        Width = 84
        Visible = True
      end
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
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 402
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'retirado'
        Title.Caption = 'Retirado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'devolvido'
        Title.Caption = 'Devolvida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'funcionario'
        Title.Caption = 'Usu'#225'rio'
        Width = 286
        Visible = True
      end>
  end
  object pnl_bottom: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 527
    Width = 1071
    Height = 2
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 528
    ExplicitWidth = 1075
  end
  object dsReservas: TDataSource
    Left = 184
    Top = 184
  end
  object frxReport: TfrxReport
    Version = '2022.2.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44350.840902777800000000
    ReportOptions.LastChange = 44785.938674791670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 352
    Top = 152
    Datasets = <
      item
        DataSet = frxDBReservas
        DataSetName = 'frxDBReservas'
      end>
    Variables = <>
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
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBReservas
        DataSetName = 'frxDBReservas'
        RowCount = 0
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBReservas."dtemissao"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBReservas."dtretirada"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBReservas."dtdevolucao"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBReservas."cliente"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBReservas."idtbreserva"]')
          ParentFont = False
        end
      end
      object grpFantasias: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBReservas."idtbproduto"'
        DrillDown = True
        ExpandDrillDown = True
        KeepChild = True
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fantasia: [frxDBReservas."produto"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo: [frxDBReservas."tipo"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data de Emiss'#227'o')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data de Retirada')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data de Devolu'#231#227'o')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Reserva')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 311.811225000000000000
          Top = 1.889765000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 0.000231890000000012
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDash
          Frame.Typ = [ftTop]
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236220470000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 202.204855000000000000
          Top = 5.669285235000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RELAT'#211'RIO - FANTASIAS & RESERVAS')
          ParentFont = False
        end
      end
    end
  end
  object frxDBReservas: TfrxDBDataset
    UserName = 'frxDBReservas'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 432
    Top = 152
  end
  object JvBalloonHint1: TJvBalloonHint
    CustomAnimationStyle = atSlide
    DefaultIcon = ikNone
    UseBalloonAsApplicationHint = True
    Left = 616
    Top = 160
  end
end
