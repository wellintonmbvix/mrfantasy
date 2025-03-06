object fReportMovimento: TfReportMovimento
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#227'o'
  ClientHeight = 210
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 5395026
  Font.Height = -13
  Font.Name = 'Product Sans'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 97
    Height = 16
    Caption = 'Tipo de Relat'#243'rio'
  end
  object Label2: TLabel
    Left = 16
    Top = 80
    Width = 111
    Height = 16
    Caption = 'Data de Movimento'
  end
  object Label3: TLabel
    Left = 133
    Top = 106
    Width = 18
    Height = 16
    Caption = 'at'#233
  end
  object cbox_tiporelatorio: TComboBox
    Left = 16
    Top = 38
    Width = 252
    Height = 24
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbox_tiporelatorioChange
    Items.Strings = (
      'Movimento por Atendente'
      'Movimento Anual')
  end
  object dtp_dtinicial: TDateTimePicker
    Left = 16
    Top = 102
    Width = 111
    Height = 24
    Date = 44995.000000000000000000
    Time = 0.943503009257256100
    TabOrder = 1
  end
  object dtp_dtfinal: TDateTimePicker
    Left = 157
    Top = 102
    Width = 111
    Height = 24
    Date = 44995.000000000000000000
    Time = 0.943503009257256100
    TabOrder = 2
  end
  object pnl_btnImprimir: TPanel
    Left = 16
    Top = 144
    Width = 252
    Height = 49
    Color = 5395026
    ParentBackground = False
    TabOrder = 3
    object sbtn_imprimir: TSpeedButton
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 240
      Height = 37
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Product Sans'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        565656565656565656565656565656D8D8D8FAFAFAF2F2F2F4F4F4F3F3F3F4F4
        F4F3F3F3F1F1F1FAFAFAD9D9D957575756565656565656565656565656565656
        5656565656565656565656565656575757565656656565E9E9E97171715D5D5D
        616161616161606060616161606060727272E9E9E96565655656565757575656
        56565656565656565656565656565656565656565656585858565656646464E7
        E7E76565655D5D5D636363616161626262626262565656646464E7E7E7646464
        5656565858585656565656565656565656565656565656565656565656565B5B
        5B5E5E5E707070E6E6E66F6F6FD8D8D8E8E8E8E4E4E4E8E8E8DCDCDC5C5C5C62
        6262E9E9E96F6F6F5E5E5E5B5B5B565656565656565656565656565656565656
        565656565656D9D9D9F6F6F6F7F7F7F2F2F26464646F6F6F7575757373737474
        74747474626262636363F3F3F3F7F7F7F6F6F6DADADA56565656565656565656
        5656565656565656565656565656FFFFFFFEFEFEFFFFFFF1F1F16B6B6BD5D5D5
        E5E5E5E1E1E1E1E1E1E5E5E5D8D8D86B6B6BF1F1F1FFFFFFFEFEFEFFFFFF5656
        56565656565656565656565656565656565656565656FEFEFEFEFEFEFFFFFFF4
        F4F46D6D6D6D6D6D7272727171717171717272726C6C6C6D6D6DF4F4F4FFFFFF
        FEFEFEFEFEFE565656565656565656565656565656565656565656565656FFFF
        FFFFFFFFFFFFFFFEFEFEF4F4F4F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F4
        F4F4FEFEFEFEFEFEFEFEFEFFFFFF565656565656565656565656565656565656
        565656565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF56565656565656565656
        5656565656565656565656565656FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFFFFFF9B9B9B9C9C9CFFFFFF5656
        56565656565656565656565656565656565656565656FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF9F9F9F
        A0A0A0FFFFFF565656565656565656565656565656565656565656565656D8D8
        D8F7F7F7F3F3F3F1F1F1F3F3F3F4F4F4F3F3F3F4F4F4F4F4F4F3F3F3F4F4F4F3
        F3F3F1F1F1FAFAFAFEFEFED9D9D9565656565656565656565656565656565656
        5656565656565A5A5A6262626262626B6B6B6363636262626262626262626262
        626262626262626363636B6B6B6161616060605A5A5A56565656565656565656
        5656565656565656565656565656585858565656636363DBDBDB636363565656
        575757565656565656575757565656636363DBDBDB6363635656565858585656
        56565656565656565656565656565656565656565656575757565656656565E9
        E9E9727272626262666666656565656565666666626262727272E9E9E9656565
        5656565757575656565656565656565656565656565656565656565656565656
        56565656565656D6D6D6FAFAFAF1F1F1F3F3F3F3F3F3F3F3F3F3F3F3F1F1F1FA
        FAFAD7D7D7575757565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656565656565656
        5656565656565656565656565656565656565656565656565656}
      ParentFont = False
      OnClick = sbtn_imprimirClick
      ExplicitLeft = 112
      ExplicitTop = 16
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object FDMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 16
    Top = 8
  end
  object frxReport: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44997.012375069450000000
    ReportOptions.LastChange = 44997.483618009260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 80
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBImpressao'
      end>
    Variables = <
      item
        Name = ' totais'
        Value = Null
      end
      item
        Name = 'totalGeral'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 323.149815000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Totais dos '#218'ltimos Doze Meses')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date] [Time]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mesAtual">]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 75.590600000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes1">]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes2">]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes3">]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes4">]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes5">]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes6">]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes7">]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes8">]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 714.331170000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes9">]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 793.701300000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes10">]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes11">]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 952.441560000000000000
          Top = 52.913420000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#234's [<frxDBImpressao."mes12">]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 120.944960000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBImpressao'
        RowCount = 0
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMesAtual">]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes1">]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes2">]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes3">]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes4">]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes5">]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes6">]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes7">]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes8">]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 714.331170000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes9">]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 793.701300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes10">]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 873.071430000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes11">]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 952.441560000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalMes12">]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 162.519790000000000000
        Width = 1046.929810000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total Geral:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 2.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
            '[<frxDBImpressao."totalGeral">]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Style = fsDash
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBImpressao'
    CloseDataSource = False
    DataSet = FDMemTable
    BCDToCurrency = False
    Left = 144
    Top = 8
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Title = 'Relat'#243'rio de Ordens por Funcion'#225'rio'
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 216
    Top = 8
  end
end
