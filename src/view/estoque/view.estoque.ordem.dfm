object frmOrdens: TfrmOrdens
  Left = 0
  Top = 0
  ActiveControl = PageControl1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ordens de Vendas / Alugu'#233'is '
  ClientHeight = 550
  ClientWidth = 1089
  Color = 15132390
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 5395026
  Font.Height = -13
  Font.Name = 'Product Sans'
  Font.Style = []
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1089
    Height = 550
    ActivePage = tbsCab
    Align = alClient
    TabOrder = 0
    object tbsItens: TTabSheet
      Caption = 'tbsItens'
      object pnlMain1: TPanel
        Left = 0
        Top = 0
        Width = 1081
        Height = 519
        Align = alClient
        BevelOuter = bvNone
        Color = 5395026
        ParentBackground = False
        TabOrder = 0
        object pnl_btnsItens: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 444
          Width = 1075
          Height = 72
          Margins.Top = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 0
          object lblTotal: TLabel
            AlignWithMargins = True
            Left = 778
            Top = 3
            Width = 294
            Height = 66
            Align = alRight
            Alignment = taRightJustify
            Caption = 'Qtde.: 0 Total: 0,00 '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5395026
            Font.Height = -32
            Font.Name = 'Product Sans'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitHeight = 37
          end
          object pnl_btnPagto: TPanel
            Left = 32
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 0
            object sbtn_pagto: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Pagamento'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_pagtoClick
              OnMouseEnter = sbtn_pagtoMouseEnter
              OnMouseLeave = sbtn_pagtoMouseLeave
              ExplicitLeft = 56
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object pnl_btnCancelar: TPanel
            Left = 176
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 1
            object sbtn_cancelar: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Anular'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_cancelarClick
              OnMouseEnter = sbtn_cancelarMouseEnter
              OnMouseLeave = sbtn_cancelarMouseLeave
              ExplicitWidth = 126
            end
          end
          object pnl_btnCaixa: TPanel
            Left = 320
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 2
            object sbtn_caixa: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Caixa'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_caixaClick
              ExplicitLeft = 56
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object pnl_btnPesquisar: TPanel
            Left = 464
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 3
            object sbtn_pesquisar: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Pesquisar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_pesquisarClick
              ExplicitWidth = 126
            end
          end
        end
        object jvdbgItens: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 76
          Width = 1075
          Height = 336
          TabStop = False
          Align = alClient
          DataSource = jvdsItens
          Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = 5395026
          TitleFont.Height = -13
          TitleFont.Name = 'Product Sans'
          TitleFont.Style = []
          OnDrawColumnCell = jvdbgItensDrawColumnCell
          OnDblClick = jvdbgItensDblClick
          OnEnter = jvdbgItensEnter
          OnExit = jvdbgItensExit
          OnKeyDown = jvdbgItensKeyDown
          ScrollBars = ssVertical
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          WordWrap = True
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'item'
              Title.Alignment = taCenter
              Title.Caption = 'Item'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'produto'
              Title.Caption = 'Produto'
              Width = 418
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'qtde'
              Title.Alignment = taCenter
              Title.Caption = 'Qtde'
              Width = 42
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'precoTabela'
              Title.Caption = 'Pre'#231'o Tabela'
              Width = 82
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'totalBruto'
              Title.Caption = 'Total Bruto'
              Width = 72
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'valorDesconto'
              Title.Caption = 'Desc. R$'
              Width = 60
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'valorAcrescimo'
              Title.Caption = 'Acres. R$'
              Width = 63
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'valorUnitario'
              Title.Caption = 'Valor Liquido'
              Width = 82
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'totalLiquido'
              Title.Caption = 'Total Liquido'
              Width = 79
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'venda'
              Title.Alignment = taCenter
              Title.Caption = 'Venda'
              Width = 49
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'cancelado'
              Title.Alignment = taCenter
              Title.Caption = 'Cancelado'
              Width = 70
              Visible = True
            end>
        end
        object pnlPesquisa: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1075
          Height = 70
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 2
          object ledt_produto: TLabeledEdit
            Left = 8
            Top = 32
            Width = 113
            Height = 24
            TabStop = False
            EditLabel.Width = 45
            EditLabel.Height = 16
            EditLabel.Caption = 'Produto'
            TabOrder = 1
            Text = ''
          end
          object jvcedt_produto: TJvComboEdit
            Left = 8
            Top = 32
            Width = 113
            Height = 24
            Flat = False
            ParentFlat = False
            ButtonFlat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C30E0000C30E00000000000000000000EFEFEFF0F0F0
              9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F09999998D8D8DF0F0F0EEEEEEF0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A
              525252525252B3B3B3F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
              525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B525252545454565656CDCDCDF0F0F0EE
              EEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED
              757575525252525252686868E3E3E3F0F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEE
              EEF0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
              F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
              DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
              F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DBDBDB606060535353525252808080F0
              F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEE
              F0F0F0C3C3C35252525353535252527B7B7B6E6E6E5B5B5B646464858585CECE
              CEF0F0F0EEEEEEF0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
              7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
              EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
              52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EDEDEDF0F0F0A8A8A852525255555553
              5353525252525252525252525252525252AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0
              EFEFEFF0F0F0DDDDDD5A5A5A525252636363ACACACCBCBCBB9B9B97373735252
              52525252C7C7C7F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
              6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
              EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
              77525252808080F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A1A1A1525252606060D8
              D8D8F0F0F0EEEEEEF0F0F0EBEBEB777777525252808080F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F07979795252529D9D9DF0F0F0EBEBEBEEEEEEECECECF0F0F0C0C0
              C0525252606060E1E1E1F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
              F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
              F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
              D4525252575757D7D7D7F0F0F0F0F0F0F0F0F0EFEFEF6E6E6E525252B4B4B4F0
              F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4D4525252575757D7D7D7F0F0F0F0F0F0
              EFEFEFF0F0F07A7A7A5252529B9B9BF0F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBF
              BF525252606060E2E2E2F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
              F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
              EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
              76525252828282F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A2A2A25252525F5F5FD5
              D5D5F0F0F0EEEEEEF0F0F0EAEAEA767676525252828282F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F0E3E3E3646464525252616161A7A7A7C8C8C8B5B5B56F6F6F5252
              52525252C9C9C9F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
              6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
              F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
              54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0CECECE60606052
              5252535353525252525252525252545454B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0
              F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF9191916262625555555D5D5D818181CFCF
              CFF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
              91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
            NumGlyphs = 2
            TabOrder = 0
            Text = ''
            OnButtonClick = jvcedt_produtoButtonClick
            OnChange = jvcedt_produtoChange
            OnKeyDown = jvcedt_produtoKeyDown
            NumbersOnly = True
          end
          object jvstProduto: TJvStaticText
            Left = 127
            Top = 32
            Width = 459
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 2
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object ledt_valorUnitario: TLabeledEdit
            Left = 647
            Top = 32
            Width = 98
            Height = 24
            TabStop = False
            Alignment = taRightJustify
            EditLabel.Width = 74
            EditLabel.Height = 16
            EditLabel.Caption = 'Valor Liquido'
            TabOrder = 7
            Text = '0,00'
          end
          object ledt_percDesconto: TLabeledEdit
            Left = 751
            Top = 32
            Width = 98
            Height = 24
            TabStop = False
            Alignment = taRightJustify
            EditLabel.Width = 71
            EditLabel.Height = 16
            EditLabel.Caption = '% Desconto'
            TabOrder = 8
            Text = '0,00'
          end
          object ledt_valorDesconto: TLabeledEdit
            Left = 855
            Top = 32
            Width = 98
            Height = 24
            TabStop = False
            Alignment = taRightJustify
            EditLabel.Width = 75
            EditLabel.Height = 16
            EditLabel.Caption = 'R$ Desconto'
            TabOrder = 9
            Text = '0,00'
          end
          object jvedt_valorUnitario: TJvValidateEdit
            Left = 647
            Top = 32
            Width = 98
            Height = 24
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            DisplayFormat = dfFloat
            DecimalPlaces = 2
            EditText = '0,00'
            TabOrder = 4
            OnChange = jvedt_valorUnitarioChange
            OnClick = jvedt_valorUnitarioEnter
            OnEnter = jvedt_valorUnitarioEnter
            OnExit = jvedt_valorUnitarioExit
            OnKeyDown = jvcedt_produtoKeyDown
          end
          object jvedt_percDesconto: TJvValidateEdit
            Tag = 1
            Left = 751
            Top = 32
            Width = 98
            Height = 24
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            DisplayFormat = dfFloat
            DecimalPlaces = 2
            EditText = '0,00'
            TabOrder = 5
            OnChange = jvedt_valorUnitarioChange
            OnClick = jvedt_valorUnitarioEnter
            OnEnter = jvedt_valorUnitarioEnter
            OnExit = jvedt_valorUnitarioExit
            OnKeyDown = jvcedt_produtoKeyDown
          end
          object jvedt_valorDesconto: TJvValidateEdit
            Tag = 2
            Left = 855
            Top = 32
            Width = 98
            Height = 24
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            DisplayFormat = dfFloat
            DecimalPlaces = 2
            EditText = '0,00'
            TabOrder = 6
            OnChange = jvedt_valorUnitarioChange
            OnClick = jvedt_valorUnitarioEnter
            OnEnter = jvedt_valorUnitarioEnter
            OnExit = jvedt_valorUnitarioExit
            OnKeyDown = jvcedt_produtoKeyDown
            TextHint = '0,00'
          end
          object pnl_btnAddItem: TPanel
            Left = 956
            Top = 32
            Width = 24
            Height = 24
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            BevelOuter = bvNone
            Color = 5658198
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Product Sans'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 10
            object img_addItem: TImage
              Left = 0
              Top = 0
              Width = 24
              Height = 24
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
                00180800000000C51C6224000000097048597300000EC400000EC401952B0E1B
                000001584944415478DA9592BF2F036118C79FE76994202121219156226A11AA
                0673FB175C27030B834527ED2EEC6A3330914888A19AFE056562BA329030D192
                346191A85C933E8FF7B9BB5E3A4813B7DCFBE6F33EF77E7F1C2EC3DF0F7607C4
                E1F8E2C4007CBFD99526710088E7AC51410114FC28DDBB44018A951210325B46
                C072D11C51406CA55A84E0BC40B40F8443E5A299D189F83A130856F3908D0A02
                D371C59DE8C98D9BAD606DCF0382F57C53C1D28ADECBA1D77DD89A6C912A38BB
                55B0316B8E7913B988B77C3852B0330C4EDD38A99DC26AD4211EEB85AF6D0579
                C2E70355E839964C4C24DB15EC0E41A34A127EBF006BCA418EF4FB9FEAB83C13
                338ECCF2F1B02D974154EEE64C0B8104CF6F1484B38141772230080B6BED485C
                C07462FB21A6931AE2CF934C0F6A8857977E8828E9A4066DC4EAEBBAE0C7AE45
                CD5B23A60C30923E4B7741516EB58984A9B651B3EDCE6AFFF597FC0271F4A829
                DD129F5C0000000049454E44AE426082}
              Transparent = True
              ExplicitLeft = 125
              ExplicitTop = 5
              ExplicitWidth = 122
              ExplicitHeight = 38
            end
            object sbtn_addItem: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Margins.Left = 1
              Margins.Top = 1
              Margins.Right = 1
              Margins.Bottom = 1
              Align = alClient
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_addItemClick
              OnMouseEnter = sbtn_addItemMouseEnter
              OnMouseLeave = sbtn_addItemMouseLeave
              ExplicitWidth = 21
            end
          end
          object LabeledEdit1: TLabeledEdit
            Left = 592
            Top = 32
            Width = 49
            Height = 24
            TabStop = False
            EditLabel.Width = 28
            EditLabel.Height = 16
            EditLabel.Caption = 'Qtde'
            TabOrder = 11
            Text = ''
          end
          object jvsedt_qtde: TJvSpinEdit
            Left = 592
            Top = 32
            Width = 49
            Height = 24
            Alignment = taCenter
            Decimal = 0
            MaxValue = 999.000000000000000000
            MinValue = 1.000000000000000000
            Value = 1.000000000000000000
            TabOrder = 3
          end
        end
        object pnl_observacao1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 415
          Width = 1075
          Height = 26
          Margins.Top = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = clInfoBk
          ParentBackground = False
          TabOrder = 3
          Visible = False
          object lblOpcoes1: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 472
            Height = 20
            Margins.Left = 10
            Align = alLeft
            Caption = 
              'DELETE - Cancelar Item | ENTER - Alterar Item | ESPA'#199'O - Venda S' +
              'im / N'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5395026
            Font.Height = -13
            Font.Name = 'Product Sans'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitHeight = 16
          end
        end
      end
    end
    object tbsCab: TTabSheet
      Caption = 'tbsCab'
      ImageIndex = 1
      object pnlMain2: TPanel
        Left = 0
        Top = 0
        Width = 1081
        Height = 519
        Align = alClient
        BevelOuter = bvNone
        Color = 5658198
        ParentBackground = False
        TabOrder = 0
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 686
          Height = 438
          Align = alLeft
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 0
          object lbl_memobs: TLabel
            Left = 8
            Top = 128
            Width = 75
            Height = 16
            Caption = 'Observa'#231#245'es'
          end
          object lbl_formpagto: TLabel
            Left = 359
            Top = 128
            Width = 125
            Height = 16
            Caption = 'Forma de Pagamento'
          end
          object ledt_atendente: TLabeledEdit
            Left = 8
            Top = 32
            Width = 113
            Height = 24
            EditLabel.Width = 59
            EditLabel.Height = 16
            EditLabel.Caption = 'Atendente'
            TabOrder = 0
            Text = ''
          end
          object jvcedt_atendente: TJvComboEdit
            Left = 8
            Top = 32
            Width = 113
            Height = 24
            Alignment = taCenter
            Flat = False
            ParentFlat = False
            ButtonFlat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C30E0000C30E00000000000000000000EFEFEFF0F0F0
              9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F09999998D8D8DF0F0F0EEEEEEF0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A
              525252525252B3B3B3F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
              525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B525252545454565656CDCDCDF0F0F0EE
              EEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED
              757575525252525252686868E3E3E3F0F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEE
              EEF0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
              F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
              DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
              F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DBDBDB606060535353525252808080F0
              F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEE
              F0F0F0C3C3C35252525353535252527B7B7B6E6E6E5B5B5B646464858585CECE
              CEF0F0F0EEEEEEF0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
              7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
              EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
              52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EDEDEDF0F0F0A8A8A852525255555553
              5353525252525252525252525252525252AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0
              EFEFEFF0F0F0DDDDDD5A5A5A525252636363ACACACCBCBCBB9B9B97373735252
              52525252C7C7C7F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
              6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
              EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
              77525252808080F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A1A1A1525252606060D8
              D8D8F0F0F0EEEEEEF0F0F0EBEBEB777777525252808080F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F07979795252529D9D9DF0F0F0EBEBEBEEEEEEECECECF0F0F0C0C0
              C0525252606060E1E1E1F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
              F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
              F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
              D4525252575757D7D7D7F0F0F0F0F0F0F0F0F0EFEFEF6E6E6E525252B4B4B4F0
              F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4D4525252575757D7D7D7F0F0F0F0F0F0
              EFEFEFF0F0F07A7A7A5252529B9B9BF0F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBF
              BF525252606060E2E2E2F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
              F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
              EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
              76525252828282F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A2A2A25252525F5F5FD5
              D5D5F0F0F0EEEEEEF0F0F0EAEAEA767676525252828282F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F0E3E3E3646464525252616161A7A7A7C8C8C8B5B5B56F6F6F5252
              52525252C9C9C9F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
              6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
              F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
              54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0CECECE60606052
              5252535353525252525252525252545454B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0
              F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF9191916262625555555D5D5D818181CFCF
              CFF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
              91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
            NumGlyphs = 2
            TabOrder = 1
            Text = ''
            OnButtonClick = jvcedt_atendenteButtonClick
            OnChange = jvcedt_atendenteChange
            OnExit = jvcedt_atendenteExit
            NumbersOnly = True
          end
          object jvstAtendente: TJvStaticText
            Left = 127
            Top = 32
            Width = 320
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 2
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object ledt_dtretirada: TLabeledEdit
            Left = 453
            Top = 32
            Width = 106
            Height = 24
            EditLabel.Width = 97
            EditLabel.Height = 16
            EditLabel.Caption = 'Data de Retirada'
            TabOrder = 3
            Text = ''
          end
          object jvdt_dtretirada: TJvDateEdit
            Left = 453
            Top = 32
            Width = 102
            Height = 24
            Cursor = crHandPoint
            ButtonFlat = True
            DefaultToday = True
            Flat = False
            ParentFlat = False
            CalendarStyle = csDialog
            ShowNullDate = False
            TabOrder = 4
          end
          object ledt_dtdevolucao: TLabeledEdit
            Left = 565
            Top = 32
            Width = 108
            Height = 24
            EditLabel.Width = 108
            EditLabel.Height = 16
            EditLabel.Caption = 'Data de Devolu'#231#227'o'
            TabOrder = 5
            Text = ''
          end
          object jvdt_dtdevolucao: TJvDateEdit
            Left = 565
            Top = 32
            Width = 108
            Height = 24
            Cursor = crHandPoint
            ButtonFlat = True
            DefaultToday = True
            Flat = False
            ParentFlat = False
            CalendarStyle = csDialog
            ShowNullDate = False
            TabOrder = 6
          end
          object ledt_cliente: TLabeledEdit
            Left = 8
            Top = 88
            Width = 113
            Height = 24
            TabStop = False
            EditLabel.Width = 40
            EditLabel.Height = 16
            EditLabel.Caption = 'Cliente'
            TabOrder = 7
            Text = ''
          end
          object jvcedt_cliente: TJvComboEdit
            Left = 8
            Top = 88
            Width = 111
            Height = 24
            Alignment = taCenter
            Flat = False
            ParentFlat = False
            ButtonFlat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C30E0000C30E00000000000000000000EFEFEFF0F0F0
              9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F09999998D8D8DF0F0F0EEEEEEF0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A
              525252525252B3B3B3F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
              525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B525252545454565656CDCDCDF0F0F0EE
              EEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED
              757575525252525252686868E3E3E3F0F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEE
              EEF0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
              F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
              DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
              F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DBDBDB606060535353525252808080F0
              F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEE
              F0F0F0C3C3C35252525353535252527B7B7B6E6E6E5B5B5B646464858585CECE
              CEF0F0F0EEEEEEF0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
              7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
              EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
              52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EDEDEDF0F0F0A8A8A852525255555553
              5353525252525252525252525252525252AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0
              EFEFEFF0F0F0DDDDDD5A5A5A525252636363ACACACCBCBCBB9B9B97373735252
              52525252C7C7C7F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
              6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
              EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
              77525252808080F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A1A1A1525252606060D8
              D8D8F0F0F0EEEEEEF0F0F0EBEBEB777777525252808080F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F07979795252529D9D9DF0F0F0EBEBEBEEEEEEECECECF0F0F0C0C0
              C0525252606060E1E1E1F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
              F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
              F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
              D4525252575757D7D7D7F0F0F0F0F0F0F0F0F0EFEFEF6E6E6E525252B4B4B4F0
              F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4D4525252575757D7D7D7F0F0F0F0F0F0
              EFEFEFF0F0F07A7A7A5252529B9B9BF0F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBF
              BF525252606060E2E2E2F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
              F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
              EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
              76525252828282F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A2A2A25252525F5F5FD5
              D5D5F0F0F0EEEEEEF0F0F0EAEAEA767676525252828282F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F0E3E3E3646464525252616161A7A7A7C8C8C8B5B5B56F6F6F5252
              52525252C9C9C9F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
              6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
              F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
              54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0CECECE60606052
              5252535353525252525252525252545454B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0
              F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF9191916262625555555D5D5D818181CFCF
              CFF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
              91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
            NumGlyphs = 2
            TabOrder = 8
            Text = ''
            OnButtonClick = jvcedt_clienteButtonClick
            OnChange = jvcedt_clienteChange
            OnExit = jvcedt_clienteExit
            NumbersOnly = True
          end
          object jvstCliente: TJvStaticText
            Left = 157
            Top = 88
            Width = 300
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 9
            TextMargins.X = 4
            TextMargins.Y = 0
            WordWrap = False
          end
          object ledt_fone1: TLabeledEdit
            Left = 467
            Top = 88
            Width = 100
            Height = 24
            TabStop = False
            EditLabel.Width = 47
            EditLabel.Height = 16
            EditLabel.Caption = 'Telefone'
            TabOrder = 10
            Text = ''
          end
          object ledt_fone2: TLabeledEdit
            Left = 573
            Top = 88
            Width = 100
            Height = 24
            TabStop = False
            EditLabel.Width = 47
            EditLabel.Height = 16
            EditLabel.Caption = 'Telefone'
            TabOrder = 11
            Text = ''
          end
          object jvstTel1: TJvStaticText
            Left = 467
            Top = 88
            Width = 100
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 12
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object jvstTel2: TJvStaticText
            Left = 573
            Top = 88
            Width = 100
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 13
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object mem_obs: TMemo
            Left = 8
            Top = 150
            Width = 339
            Height = 275
            TabOrder = 14
          end
          object jvdbPagto: TJvDBLookupCombo
            Left = 359
            Top = 150
            Width = 181
            Height = 23
            LookupField = 'idtbformas_pagto'
            LookupDisplay = 'descricao'
            LookupSource = dsFormaPagto
            TabOrder = 15
          end
          object Panel3: TPanel
            Left = 650
            Top = 150
            Width = 23
            Height = 23
            BevelOuter = bvNone
            Caption = 'Panel3'
            Color = 5658198
            ParentBackground = False
            TabOrder = 16
            object sbtn_addpagto: TSpeedButton
              Left = 0
              Top = 0
              Width = 23
              Height = 23
              Cursor = crHandPoint
              Hint = 'Confirma Forma de Pagamento escolhida'
              Align = alClient
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E00000000000000000000565656565656
                5656565656565C5C5C6565655656565656565656565656565656565656565656
                56565656565656565656565656565656585858565656939393C6C6C656565657
                5757565656565656565656565656565656565656565656565656565656575757
                5656566C6C6CDCDCDCE6E6E68D8D8D5656565858585656565656565656565656
                56565656565656565656565656575757565656C0C0C0E6E6E6E6E6E6D6D6D662
                6262565656575757565656565656565656565656565656565656585858565656
                999999E6E6E6E2E2E2E3E3E3E6E6E6AAAAAA5656565858585656565656565656
                56565656565656565656565656747474E3E3E3E5E5E5E6E6E6E5E5E5E4E4E4E6
                E6E67B7B7B5656565858585656565656565656565656565656565C5C5CC9C9C9
                E6E6E6E6E6E6AFAFAFB5B5B5E6E6E6E6E6E6CCCCCC5B5B5B5656565656565656
                56565656565656565656BABABAE6E6E6E0E0E08D8D8D565656616161D1D1D1E6
                E6E6E6E6E6A5A5A5565656585858565656565656565656565656B1B1B1D6D6D6
                7171715656565A5A5A565656717171DEDEDEE6E6E6E6E6E67E7E7E5656565858
                585656565656565656565A5A5A5F5F5F5656565858585656565858585656567E
                7E7EE2E2E2E6E6E6D4D4D4636363565656575757565656565656575757575757
                575757565656565656565656585858565656858585E4E4E4E6E6E6BABABA5656
                5657575756565656565656565657575756565656565656565656565656565658
                5858565656858585E3E3E3E6E6E69F9F9F565656585858565656565656565656
                5656565656565656565656565656565656565858585656567F7F7FDFDFDFE6E6
                E68A8A8A56565659595956565656565656565656565656565656565656565656
                5656565656585858565656727272D5D5D5E6E6E67D7D7D565656565656565656
                5656565656565656565656565656565656565656565656565858585656566161
                61BEBEBEE5E5E587878756565656565656565656565656565656565656565656
                56565656565656565656565858585656565757578B8B8B939393}
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtn_addpagtoClick
              ExplicitWidth = 22
            end
          end
          object ledt_valorPagto: TLabeledEdit
            Left = 546
            Top = 150
            Width = 98
            Height = 24
            Cursor = crHandPoint
            TabStop = False
            Alignment = taRightJustify
            EditLabel.Width = 29
            EditLabel.Height = 16
            EditLabel.Caption = 'Valor'
            TabOrder = 17
            Text = '0,00'
          end
          object jvedt_valorPagto: TJvValidateEdit
            Left = 546
            Top = 150
            Width = 98
            Height = 24
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            DisplayFormat = dfFloat
            DecimalPlaces = 2
            EditText = '0,00'
            TabOrder = 18
            OnChange = jvedt_valorUnitarioChange
            OnClick = jvedt_valorUnitarioEnter
            OnEnter = jvedt_valorUnitarioEnter
            OnExit = jvedt_valorUnitarioExit
          end
          object jvdbFormasPagto: TJvDBGrid
            Left = 359
            Top = 179
            Width = 314
            Height = 246
            DataSource = jvdsPagto
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 19
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = 5395026
            TitleFont.Height = -13
            TitleFont.Name = 'Product Sans'
            TitleFont.Style = []
            OnKeyDown = jvdbFormasPagtoKeyDown
            ScrollBars = ssNone
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 20
            TitleRowHeight = 20
            Columns = <
              item
                Expanded = False
                FieldName = 'forma_pagto'
                Title.Caption = 'Forma de Pagamento'
                Width = 200
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'valor'
                Title.Caption = 'Valor'
                Width = 105
                Visible = True
              end>
          end
          object pnl_btnAddCliente: TPanel
            Left = 127
            Top = 88
            Width = 24
            Height = 24
            BevelOuter = bvNone
            Color = 5658198
            ParentBackground = False
            TabOrder = 20
            object sbtn_addcliente: TSpeedButton
              Left = 0
              Top = 0
              Width = 24
              Height = 24
              Cursor = crHandPoint
              Hint = 'Permite Cadastrar ou Alterar cliente'
              Align = alClient
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E00000000000000000000565656565656
                5656565656565656565B5B5BD6D6D6E6E6E6E6E6E6D6D6D65B5B5B5656565656
                565656565656565656565656565656565656565656565656565B5B5BD6D6D6E6
                E6E6E6E6E6D6D6D65B5B5B565656565656565656565656565656565656565656
                5656565656565656565B5B5BD6D6D6E6E6E6E6E6E6D6D6D65B5B5B5656565656
                565656565656565656565656565656565656565757575656565B5B5BD6D6D6E6
                E6E6E6E6E6D6D6D65B5B5B565656575757565656565656565656565656565656
                5656565656565656565B5B5BD6D6D6E6E6E6E6E6E6D6D6D65B5B5B5656565656
                565656565656565656565B5B5B5B5B5B5B5B5B5B5B5B5959595F5F5FD7D7D7E6
                E6E6E6E6E6D7D7D75F5F5F5959595B5B5B5B5B5B5B5B5B5B5B5BD6D6D6D6D6D6
                D6D6D6D6D6D6D6D6D6D7D7D7E4E4E4E6E6E6E6E6E6E4E4E4D7D7D7D6D6D6D6D6
                D6D6D6D6D6D6D6D6D6D6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
                E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
                E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
                E6E6E6E6E6E6E6E6E6E6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D7D7D7E4E4E4E6
                E6E6E6E6E6E4E4E4D7D7D7D6D6D6D6D6D6D6D6D6D6D6D6D6D6D65B5B5B5B5B5B
                5B5B5B5B5B5B5959595F5F5FD7D7D7E6E6E6E6E6E6D7D7D75F5F5F5959595B5B
                5B5B5B5B5B5B5B5B5B5B5656565656565656565656565656565B5B5BD6D6D6E6
                E6E6E6E6E6D6D6D65B5B5B565656565656565656565656565656565656565656
                5656565757575656565B5B5BD6D6D6E6E6E6E6E6E6D6D6D65B5B5B5656565757
                575656565656565656565656565656565656565656565656565B5B5BD6D6D6E6
                E6E6E6E6E6D6D6D65B5B5B565656565656565656565656565656565656565656
                5656565656565656565B5B5BD6D6D6E6E6E6E6E6E6D6D6D65B5B5B5656565656
                565656565656565656565656565656565656565656565656565B5B5BD6D6D6E6
                E6E6E6E6E6D6D6D65B5B5B565656565656565656565656565656}
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtn_addclienteClick
              ExplicitLeft = 8
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object pnl_btnsCab: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 444
          Width = 1075
          Height = 72
          Margins.Top = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 1
          ExplicitWidth = 1074
          object lblPagto: TLabel
            AlignWithMargins = True
            Left = 538
            Top = 3
            Width = 534
            Height = 66
            Align = alRight
            Alignment = taRightJustify
            Caption = 'Total a Pagar: 0,00 | Recebido: 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5395026
            Font.Height = -32
            Font.Name = 'Product Sans'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitHeight = 37
          end
          object pnl_btnFinalizar: TPanel
            Left = 32
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 0
            object sbtn_finalizar: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Finalizar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_finalizarClick
              OnMouseEnter = sbtn_pagtoMouseEnter
              OnMouseLeave = sbtn_pagtoMouseLeave
              ExplicitLeft = 0
            end
          end
          object pnl_btnVoltar: TPanel
            Left = 176
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 1
            object sbtn_voltar: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Voltar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_voltarClick
              ExplicitLeft = 56
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object jvdbgItens1: TJvDBGrid
          AlignWithMargins = True
          Left = 692
          Top = 3
          Width = 386
          Height = 438
          Margins.Left = 0
          Align = alClient
          BorderStyle = bsNone
          DataSource = jvdsItens
          Options = [dgTitles, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = 5395026
          TitleFont.Height = -13
          TitleFont.Name = 'Product Sans'
          TitleFont.Style = []
          OnDrawColumnCell = jvdbgItens1DrawColumnCell
          ScrollBars = ssNone
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 20
          WordWrap = True
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'item'
              Title.Alignment = taCenter
              Title.Caption = 'Item'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'produto'
              Title.Caption = 'Produto'
              Width = 165
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'qtde'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd'
              Width = 35
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'valorUnitario'
              Title.Alignment = taRightJustify
              Title.Caption = 'V. Unit'#225'rio'
              Width = 79
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'totalLiquido'
              Title.Alignment = taRightJustify
              Title.Caption = 'Total'
              Width = 79
              Visible = True
            end>
        end
      end
    end
    object tbsPesquisa: TTabSheet
      Caption = 'tbsPesquisa'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1081
        Height = 519
        Align = alClient
        BevelOuter = bvNone
        Color = 5658198
        ParentBackground = False
        TabOrder = 0
        object Panel5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1075
          Height = 70
          Align = alTop
          Color = 15132390
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            1075
            70)
          object Label5: TLabel
            Left = 558
            Top = 6
            Width = 40
            Height = 16
            Caption = 'Cliente'
          end
          object Label4: TLabel
            Left = 13
            Top = 8
            Width = 80
            Height = 16
            Caption = 'Pesquisar por'
          end
          object Label8: TLabel
            Left = 158
            Top = 8
            Width = 97
            Height = 16
            Caption = 'Data de Retirada'
          end
          object Label9: TLabel
            Left = 282
            Top = 31
            Width = 18
            Height = 16
            Caption = 'at'#233
          end
          object jvcedt_cliente1: TJvComboEdit
            Left = 554
            Top = 28
            Width = 113
            Height = 24
            Alignment = taCenter
            Anchors = [akTop, akRight]
            Flat = False
            ParentFlat = False
            ButtonFlat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C30E0000C30E00000000000000000000EFEFEFF0F0F0
              9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F09999998D8D8DF0F0F0EEEEEEF0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A
              525252525252B3B3B3F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
              525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B525252545454565656CDCDCDF0F0F0EE
              EEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED
              757575525252525252686868E3E3E3F0F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEE
              EEF0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
              F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
              DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
              F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DBDBDB606060535353525252808080F0
              F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEE
              F0F0F0C3C3C35252525353535252527B7B7B6E6E6E5B5B5B646464858585CECE
              CEF0F0F0EEEEEEF0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
              7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
              EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
              52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EDEDEDF0F0F0A8A8A852525255555553
              5353525252525252525252525252525252AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0
              EFEFEFF0F0F0DDDDDD5A5A5A525252636363ACACACCBCBCBB9B9B97373735252
              52525252C7C7C7F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
              6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
              EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
              77525252808080F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A1A1A1525252606060D8
              D8D8F0F0F0EEEEEEF0F0F0EBEBEB777777525252808080F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F07979795252529D9D9DF0F0F0EBEBEBEEEEEEECECECF0F0F0C0C0
              C0525252606060E1E1E1F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
              F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
              F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
              D4525252575757D7D7D7F0F0F0F0F0F0F0F0F0EFEFEF6E6E6E525252B4B4B4F0
              F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4D4525252575757D7D7D7F0F0F0F0F0F0
              EFEFEFF0F0F07A7A7A5252529B9B9BF0F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBF
              BF525252606060E2E2E2F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
              F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
              EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
              76525252828282F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A2A2A25252525F5F5FD5
              D5D5F0F0F0EEEEEEF0F0F0EAEAEA767676525252828282F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F0E3E3E3646464525252616161A7A7A7C8C8C8B5B5B56F6F6F5252
              52525252C9C9C9F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
              6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
              F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
              54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0CECECE60606052
              5252535353525252525252525252545454B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0
              F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF9191916262625555555D5D5D818181CFCF
              CFF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
              91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
            NumGlyphs = 2
            TabOrder = 0
            Text = ''
            OnButtonClick = jvcedt_cliente1ButtonClick
            OnChange = jvcedt_cliente1Change
            OnExit = jvcedt_cliente1Exit
            NumbersOnly = True
          end
          object jvstCliente1: TJvStaticText
            Left = 673
            Top = 28
            Width = 258
            Height = 24
            Anchors = [akTop, akRight]
            AutoSize = False
            BorderStyle = sbsSingle
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 1
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object pnl_btnPesquisar1: TPanel
            Left = 935
            Top = 20
            Width = 122
            Height = 38
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Anchors = [akTop, akRight]
            BevelOuter = bvNone
            Color = 5658198
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Product Sans'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            object sbtn_pesquisar1: TSpeedButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 116
              Height = 32
              Cursor = crHandPoint
              Align = alClient
              Caption = 'Pesquisar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_pesquisar1Click
              ExplicitLeft = 16
              ExplicitWidth = 102
            end
          end
          object cbox_pesquisa: TComboBox
            Left = 13
            Top = 28
            Width = 139
            Height = 24
            Style = csDropDownList
            ItemIndex = 1
            TabOrder = 3
            Text = 'Data de Retirada'
            Items.Strings = (
              'Data de Emiss'#227'o'
              'Data de Retirada'
              'Data de Devolu'#231#227'o'
              'Cliente')
          end
          object jvdt_dtStart: TJvDateEdit
            Left = 158
            Top = 28
            Width = 118
            Height = 24
            Cursor = crHandPoint
            ButtonFlat = True
            DefaultToday = True
            Flat = False
            ParentFlat = False
            CalendarStyle = csDialog
            ShowNullDate = False
            TabOrder = 4
          end
          object jvdt_dtEnd: TJvDateEdit
            Left = 306
            Top = 28
            Width = 118
            Height = 24
            Cursor = crHandPoint
            ButtonFlat = True
            DefaultToday = True
            Flat = False
            ParentFlat = False
            CalendarStyle = csDialog
            ShowNullDate = False
            TabOrder = 5
          end
          object chkOrdensRetiradas: TCheckBox
            Left = 430
            Top = 32
            Width = 122
            Height = 17
            Caption = 'Mostrar Retiradas'
            TabOrder = 6
          end
        end
        object Panel6: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 76
          Width = 1075
          Height = 173
          Margins.Top = 0
          Align = alTop
          BevelOuter = bvNone
          Color = 5658198
          ParentBackground = False
          TabOrder = 1
          object jvdbgCabs: TJvDBGrid
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 781
            Height = 173
            Hint = 'Pressione "P" para re-imprimir comprovante'
            Margins.Left = 0
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alClient
            BorderStyle = bsNone
            DataSource = jvdsCab
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = 5395026
            TitleFont.Height = -13
            TitleFont.Name = 'Product Sans'
            TitleFont.Style = []
            OnDrawColumnCell = jvdbgCabsDrawColumnCell
            OnDblClick = jvdbgCabsDblClick
            OnKeyPress = jvdbgCabsKeyPress
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 20
            TitleRowHeight = 20
            Columns = <
              item
                Expanded = False
                FieldName = 'dtdocumento'
                Title.Caption = 'Data Emiss'#227'o'
                Width = 96
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'controle'
                Title.Caption = 'N'#186' Controle'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cliente'
                Title.Caption = 'Cliente'
                Width = 264
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtretirada'
                Title.Caption = 'Data Retirada'
                Width = 96
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtdevolucao'
                Title.Caption = 'Data Devolu'#231#227'o'
                Width = 96
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'pecas'
                Title.Alignment = taCenter
                Title.Caption = 'Pe'#231'as'
                Width = 54
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'totalLiquido'
                Title.Alignment = taRightJustify
                Title.Caption = 'Total'
                Width = 78
                Visible = True
              end>
          end
          object JvDBGrid3: TJvDBGrid
            Left = 784
            Top = 0
            Width = 291
            Height = 173
            Margins.Left = 0
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alRight
            BorderStyle = bsNone
            DataSource = jvdsPagto
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = 5395026
            TitleFont.Height = -13
            TitleFont.Name = 'Product Sans'
            TitleFont.Style = []
            OnKeyDown = jvdbFormasPagtoKeyDown
            ScrollBars = ssNone
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 20
            TitleRowHeight = 20
            Columns = <
              item
                Expanded = False
                FieldName = 'forma_pagto'
                Title.Caption = 'Forma de Pagamento'
                Width = 185
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taRightJustify
                Title.Caption = 'Valor'
                Width = 93
                Visible = True
              end>
          end
        end
        object pnl_btnsPesquisa: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 444
          Width = 1075
          Height = 72
          Margins.Top = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 2
          object Panel10: TPanel
            Left = 24
            Top = 16
            Width = 125
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 0
            object sbtn_voltar1: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 123
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Voltar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_voltar1Click
              ExplicitLeft = 56
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object pnl_btnRetirada: TPanel
            Left = 168
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 1
            object sbtn_retirada: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Hint = 'Realiza retirada do(s) item(ns)'
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Retirada'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtn_retiradaClick
              ExplicitWidth = 126
            end
          end
          object pnl_btnDevolucao: TPanel
            Left = 314
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 2
            object sbtn_devolucao: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Hint = 'Realiza devolu'#231#227'o de item(ns) retirado(s)'
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Devolu'#231#227'o'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtn_devolucaoClick
              ExplicitWidth = 126
            end
          end
          object pnl_btnListaFantasias: TPanel
            Left = 751
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 3
            object sbtn_listaFantasias: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Listar Fantasias'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_listaFantasiasClick
              ExplicitWidth = 126
            end
          end
          object pnl_btnRelCaixa: TPanel
            Left = 460
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 4
            object sbtn_listaOrdens: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Hint = 'Realiza devolu'#231#227'o de item(ns) retirado(s)'
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Relat'#243'rio Caixa'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtn_listaOrdensClick
              ExplicitLeft = 5
              ExplicitTop = 9
            end
          end
          object pnl_btnComprovante: TPanel
            Left = 607
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 5
            object sbtn_comprovante: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Imp. Comprovante'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_comprovanteClick
              ExplicitWidth = 126
            end
          end
        end
        object Panel9: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 252
          Width = 1075
          Height = 189
          Margins.Top = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 5658198
          ParentBackground = False
          TabOrder = 3
          object jvdbgItens3: TJvDBGrid
            Left = 0
            Top = 0
            Width = 1075
            Height = 189
            Align = alClient
            BorderStyle = bsNone
            DataSource = jvdsItens
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = 5395026
            TitleFont.Height = -13
            TitleFont.Name = 'Product Sans'
            TitleFont.Style = []
            OnDrawColumnCell = jvdbgItens3DrawColumnCell
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 20
            TitleRowHeight = 20
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'item'
                Title.Alignment = taCenter
                Title.Caption = '#'
                Width = 36
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'produto'
                Title.Caption = 'Produto'
                Width = 429
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'qtde'
                Title.Alignment = taCenter
                Title.Caption = 'Qtde'
                Width = 61
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'valorUnitario'
                Title.Caption = 'Vl. Unit'#225'rio'
                Width = 90
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'totalLiquido'
                Title.Caption = 'Total'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'venda'
                Title.Alignment = taCenter
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'cancelado'
                Title.Alignment = taCenter
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'retirado'
                Title.Alignment = taCenter
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'devolvido'
                Title.Alignment = taCenter
                Title.Caption = 'Devolvido'
                Width = 90
                Visible = True
              end>
          end
        end
      end
    end
    object tbsManutencao: TTabSheet
      Caption = 'tbsManutencao'
      ImageIndex = 3
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 1081
        Height = 519
        Align = alClient
        BevelOuter = bvNone
        Color = 5658198
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 1077
        ExplicitHeight = 518
        object Panel12: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1075
          Height = 70
          Align = alTop
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 1071
          object Label11: TLabel
            Left = 16
            Top = 10
            Width = 82
            Height = 16
            Caption = 'Data Emiss'#227'o'
          end
          object Label12: TLabel
            Left = 103
            Top = 10
            Width = 66
            Height = 16
            Caption = 'N'#186' Controle'
          end
          object Label13: TLabel
            Left = 175
            Top = 10
            Width = 59
            Height = 16
            Caption = 'Atendente'
          end
          object Label14: TLabel
            Left = 335
            Top = 10
            Width = 97
            Height = 16
            Caption = 'Data de Retirada'
          end
          object Label15: TLabel
            Left = 447
            Top = 10
            Width = 108
            Height = 16
            Caption = 'Data de Devolu'#231#227'o'
          end
          object Label16: TLabel
            Left = 561
            Top = 10
            Width = 40
            Height = 16
            Caption = 'Cliente'
          end
          object jvst_dtemissao: TJvStaticText
            Left = 16
            Top = 32
            Width = 81
            Height = 24
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = '99/99/9999'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 0
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object jvst_controle: TJvStaticText
            Left = 103
            Top = 32
            Width = 66
            Height = 24
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = '1'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 1
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object jvst_atendente: TJvStaticText
            Left = 175
            Top = 32
            Width = 154
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = ' XXXXXXXXXXXXXXXXXXXX'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 2
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object jvdt_dtretirada1: TJvDateEdit
            Left = 335
            Top = 32
            Width = 106
            Height = 24
            Cursor = crHandPoint
            ButtonFlat = True
            DefaultToday = True
            Flat = False
            ParentFlat = False
            CalendarStyle = csDialog
            ShowNullDate = False
            TabOrder = 3
          end
          object jvdt_dtdevolucao1: TJvDateEdit
            Left = 447
            Top = 32
            Width = 108
            Height = 24
            Cursor = crHandPoint
            ButtonFlat = True
            DefaultToday = True
            Flat = False
            ParentFlat = False
            CalendarStyle = csDialog
            ShowNullDate = False
            TabOrder = 4
          end
          object jvst_cliente: TJvStaticText
            Left = 561
            Top = 32
            Width = 328
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = ' XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 5
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
        end
        object pnl_btnsManutencao: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 444
          Width = 1075
          Height = 72
          Margins.Top = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 1
          ExplicitTop = 443
          ExplicitWidth = 1071
          object pnl_btnVoltar1: TPanel
            Left = 24
            Top = 16
            Width = 129
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 0
            object sbtn_voltar2: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 127
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Voltar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_voltar1Click
              ExplicitLeft = 56
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 76
          Width = 1075
          Height = 70
          Margins.Top = 0
          Align = alTop
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 2
          ExplicitWidth = 1071
          object Label17: TLabel
            Left = 16
            Top = 18
            Width = 45
            Height = 16
            Caption = 'Produto'
          end
          object Label18: TLabel
            Left = 666
            Top = 18
            Width = 77
            Height = 16
            Caption = 'Valor Unit'#225'rio'
          end
          object jvstProduto2: TJvStaticText
            Left = 135
            Top = 40
            Width = 504
            Height = 24
            AutoSize = False
            BorderStyle = sbsSingle
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 0
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object jvcedt_produto2: TJvComboEdit
            Left = 16
            Top = 40
            Width = 109
            Height = 24
            Flat = False
            ParentFlat = False
            ButtonFlat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C30E0000C30E00000000000000000000EFEFEFF0F0F0
              9999998D8D8DF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F09999998D8D8DF0F0F0EEEEEEF0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A
              525252525252B3B3B3F0F0F0EDEDEDF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0EFEFEF8A8A8A525252525252B3B3B3F0F0F0EDEDEDF0
              F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B
              525252545454565656CDCDCDF0F0F0EEEEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0
              F0F0F0F0F0F0F0F0F0F0F0F0F08B8B8B525252545454565656CDCDCDF0F0F0EE
              EEEEF0F0F0EFEFEFEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDEDED
              757575525252525252686868E3E3E3F0F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEE
              EEF0F0F0F0F0F0F0F0F0F0F0F0EDEDED757575525252525252686868E3E3E3F0
              F0F0EFEFEFF0F0F0F0F0F0EEEEEEEEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0
              DBDBDB606060535353525252808080F0F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0
              F0EEEEEEF0F0F0F0F0F0EFEFEFF0F0F0DBDBDB606060535353525252808080F0
              F0F0EDEDEDE3E3E3EAEAEAF0F0F0F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EEEEEE
              F0F0F0C3C3C35252525353535252527B7B7B6E6E6E5B5B5B646464858585CECE
              CEF0F0F0EEEEEEF0F0F0F0F0F0EEEEEEF0F0F0C3C3C35252525353535252527B
              7B7B6E6E6E5B5B5B646464858585CECECEF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0
              EDEDEDF0F0F0A8A8A85252525555555353535252525252525252525252525252
              52AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0EDEDEDF0F0F0A8A8A852525255555553
              5353525252525252525252525252525252AEAEAEF0F0F0EEEEEEF0F0F0F0F0F0
              EFEFEFF0F0F0DDDDDD5A5A5A525252636363ACACACCBCBCBB9B9B97373735252
              52525252C7C7C7F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DDDDDD5A5A5A52525263
              6363ACACACCBCBCBB9B9B9737373525252525252C7C7C7F0F0F0F0F0F0F0F0F0
              EEEEEEF0F0F0A1A1A1525252606060D8D8D8F0F0F0EEEEEEF0F0F0EBEBEB7777
              77525252808080F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A1A1A1525252606060D8
              D8D8F0F0F0EEEEEEF0F0F0EBEBEB777777525252808080F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F07979795252529D9D9DF0F0F0EBEBEBEEEEEEECECECF0F0F0C0C0
              C0525252606060E1E1E1F0F0F0F0F0F0EFEFEFF0F0F07979795252529D9D9DF0
              F0F0EBEBEBEEEEEEECECECF0F0F0C0C0C0525252606060E1E1E1F0F0F0F0F0F0
              F0F0F0EFEFEF6E6E6E525252B4B4B4F0F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4
              D4525252575757D7D7D7F0F0F0F0F0F0F0F0F0EFEFEF6E6E6E525252B4B4B4F0
              F0F0EEEEEEF0F0F0EFEFEFF0F0F0D4D4D4525252575757D7D7D7F0F0F0F0F0F0
              EFEFEFF0F0F07A7A7A5252529B9B9BF0F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBF
              BF525252606060E2E2E2F0F0F0F0F0F0EFEFEFF0F0F07A7A7A5252529B9B9BF0
              F0F0EBEBEBEEEEEEEBEBEBF0F0F0BFBFBF525252606060E2E2E2F0F0F0F0F0F0
              EEEEEEF0F0F0A2A2A25252525F5F5FD5D5D5F0F0F0EEEEEEF0F0F0EAEAEA7676
              76525252828282F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0A2A2A25252525F5F5FD5
              D5D5F0F0F0EEEEEEF0F0F0EAEAEA767676525252828282F0F0F0F0F0F0F0F0F0
              EFEFEFF0F0F0E3E3E3646464525252616161A7A7A7C8C8C8B5B5B56F6F6F5252
              52525252C9C9C9F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0E3E3E364646452525261
              6161A7A7A7C8C8C8B5B5B56F6F6F525252525252C9C9C9F0F0F0F0F0F0F0F0F0
              F0F0F0EFEFEFF0F0F0CECECE6060605252525353535252525252525252525454
              54B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0F0F0F0EFEFEFF0F0F0CECECE60606052
              5252535353525252525252525252545454B3B3B3F0F0F0EEEEEEF0F0F0F0F0F0
              F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF9191916262625555555D5D5D818181CFCF
              CFF0F0F0EEEEEEF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFF0F0F0DFDFDF91
              91916262625555555D5D5D818181CFCFCFF0F0F0EEEEEEF0F0F0}
            NumGlyphs = 2
            TabOrder = 1
            Text = ''
            OnChange = jvcedt_produto2Change
            NumbersOnly = True
          end
          object jvst_valorUnitario: TJvStaticText
            Left = 645
            Top = 40
            Width = 98
            Height = 24
            Alignment = taRightJustify
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = '0,00 '
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            Layout = tlCenter
            TabOrder = 2
            TextMargins.X = 0
            TextMargins.Y = 0
            WordWrap = False
          end
          object pnl_btnRefreshItem: TPanel
            Left = 748
            Top = 40
            Width = 24
            Height = 24
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            BevelOuter = bvNone
            Color = 5658198
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Product Sans'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 3
            object img_resfreshItem: TImage
              Left = 0
              Top = 0
              Width = 24
              Height = 24
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
                00180800000000C51C6224000000097048597300000EC400000EC401952B0E1B
                0000016F4944415478DA630C63C00E18F14B30FD63563790E166F8F2F8C2AD7F
                4C0CFF60124CFFD4FDA4A12A1F6FBCC3C8F01F22C1F8DFDBF53F90F793911D24
                B5F11BF331B004D33F3FA73F2C6F8EDEFCCCC0AF69CBF7EF3FF3BE4D101D86F1
                7F580E6FFC033689395DED37EBC9E56009F6623186BD9B99C006FFB30D64FACB
                7C753658C2329CE1E1040690381088E99A48303EEC074B64AA332C3CCFF40FE6
                0126257BA1FE3F20897ABEAF3D9F18FF43FDC5F8FF3F03EF77B0041FD3DF2FFF
                91FCCCC4F497F11FDCE7D882844DF1EE1FB00950C062C4F6F7384882B19279E7
                F9DF7095FF150A185E74808DCA55667877F4DC7B8804F3DF487386DD5BC112C9
                BA7F981977EC0059C4C4F8572785E17BDF6BB04498D56FD6EB33A106E9C63233
                EFDC0E092B6F57A08E27BB6E7F676095B633FACB7C7D1634D88DFEF08602557F
                7DFF8F9F9FE13FE3E5C5BF80DE05FB03E8920005A8ABDEEF3C81882846867F8C
                AA86723C8CDF9E5FBDFC9309EC254692530900CDE68B29DC883D7C0000000049
                454E44AE426082}
              Transparent = True
              ExplicitLeft = 125
              ExplicitTop = 5
              ExplicitWidth = 122
              ExplicitHeight = 38
            end
            object sbtn_refreshItem: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Margins.Left = 1
              Margins.Top = 1
              Margins.Right = 1
              Margins.Bottom = 1
              Align = alClient
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_refreshItemClick
              ExplicitLeft = 48
              ExplicitTop = 8
              ExplicitWidth = 23
            end
          end
        end
        object jvdbgItens4: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 149
          Width = 1075
          Height = 292
          Margins.Top = 0
          TabStop = False
          Align = alClient
          DataSource = jvdsItens
          Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = 5395026
          TitleFont.Height = -13
          TitleFont.Name = 'Product Sans'
          TitleFont.Style = []
          OnDblClick = jvdbgItens4DblClick
          OnEnter = jvdbgItensEnter
          OnExit = jvdbgItensExit
          OnKeyDown = jvdbgItensKeyDown
          ScrollBars = ssVertical
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          WordWrap = True
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'item'
              Title.Alignment = taCenter
              Title.Caption = 'Item'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'produto'
              Title.Caption = 'Produto'
              Width = 426
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'qtde'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Width = 76
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'precoTabela'
              Title.Caption = 'Valor Unit'#225'rio'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'totalBruto'
              Title.Caption = 'Total Bruto'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'valorDesconto'
              Title.Caption = 'Desconto R$'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'totalLiquido'
              Title.Caption = 'Total Liquido'
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'venda'
              Title.Alignment = taCenter
              Title.Caption = 'Venda'
              Width = 49
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'cancelado'
              Title.Alignment = taCenter
              Title.Caption = 'Cancelado'
              Width = 70
              Visible = True
            end>
        end
      end
    end
    object tbsReservadas: TTabSheet
      Caption = 'tbsReservadas'
      ImageIndex = 4
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1081
        Height = 519
        Align = alClient
        BevelOuter = bvNone
        Color = 5658198
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          1081
          519)
        object Panel14: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 444
          Width = 1075
          Height = 72
          Margins.Top = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 0
          object Panel15: TPanel
            Left = 24
            Top = 16
            Width = 137
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 0
            object SpeedButton1: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 135
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Voltar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_voltar1Click
              ExplicitLeft = 56
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object pnl_btnRptFantasias: TPanel
            Left = 176
            Top = 16
            Width = 137
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 1
            object sbtn_rptFantasias: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 135
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Imprimir Fantasias'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_rptFantasiasClick
              ExplicitWidth = 134
            end
          end
          object pnl_btnAcaoFantasias: TPanel
            Left = 328
            Top = 16
            Width = 137
            Height = 41
            Color = 5658198
            ParentBackground = False
            TabOrder = 2
            object sbtn_acaoFantasias: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 135
              Height = 39
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Retirar Fantasia(s)'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Product Sans'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbtn_acaoFantasiasClick
              ExplicitWidth = 126
            end
          end
        end
        object Panel16: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1075
          Height = 70
          Align = alTop
          BevelOuter = bvNone
          Color = 15132390
          ParentBackground = False
          TabOrder = 1
          object Label2: TLabel
            Left = 925
            Top = 32
            Width = 18
            Height = 16
            Caption = 'at'#233
          end
          object rdgFiltros: TRadioGroup
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 366
            Height = 64
            Align = alLeft
            Caption = 'Fantasias'
            TabOrder = 0
          end
          object jvrbtn_aretirar: TJvRadioButton
            Left = 16
            Top = 32
            Width = 103
            Height = 17
            Alignment = taLeftJustify
            Caption = 'A Retirar '#187#187#187#187
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = jvrbtn_aretirarClick
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            LinkedControls = <>
          end
          object jvrbtn_adevolver: TJvRadioButton
            Left = 125
            Top = 32
            Width = 112
            Height = 17
            Alignment = taLeftJustify
            Caption = 'A Devolver '#187#187#187#187
            TabOrder = 2
            OnClick = jvrbtn_aretirarClick
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            LinkedControls = <>
          end
          object ledt_produto2: TLabeledEdit
            Left = 375
            Top = 28
            Width = 306
            Height = 24
            EditLabel.Width = 50
            EditLabel.Height = 16
            EditLabel.Caption = 'Fantasia'
            TabOrder = 3
            Text = ''
            OnChange = ledt_produto2Change
          end
          object jvrbtn_devolvidas: TJvRadioButton
            Left = 243
            Top = 32
            Width = 113
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Devolvidas '#187#187#187#187
            TabOrder = 4
            OnClick = jvrbtn_aretirarClick
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -13
            HotTrackFont.Name = 'Product Sans'
            HotTrackFont.Style = []
            LinkedControls = <>
          end
          object chbFiltraData: TCheckBox
            Left = 687
            Top = 32
            Width = 115
            Height = 17
            Caption = 'Filtrar por Data?'
            TabOrder = 5
            OnClick = chbFiltraDataClick
          end
          object jvdtpDataFiltro1: TJvDateTimePicker
            Left = 808
            Top = 28
            Width = 106
            Height = 24
            Date = 44951.000000000000000000
            Time = 0.917783067132404500
            Enabled = False
            TabOrder = 6
            DropDownDate = 44951.000000000000000000
          end
          object jvdtpDataFiltro2: TJvDateTimePicker
            Left = 952
            Top = 28
            Width = 106
            Height = 24
            Date = 44951.000000000000000000
            Time = 0.917783067132404500
            Enabled = False
            TabOrder = 7
            DropDownDate = 44951.000000000000000000
          end
        end
        object jvdbg_Fantasias: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 76
          Width = 1075
          Height = 336
          Margins.Top = 0
          TabStop = False
          Align = alClient
          DataSource = jvdsItens
          Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = 5395026
          TitleFont.Height = -13
          TitleFont.Name = 'Product Sans'
          TitleFont.Style = []
          OnEnter = jvdbg_FantasiasEnter
          OnExit = jvdbg_FantasiasExit
          OnTitleClick = jvdbg_FantasiasTitleClick
          MultiSelect = True
          ScrollBars = ssVertical
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          WordWrap = True
          Columns = <
            item
              Expanded = False
              FieldName = 'produto'
              Title.Caption = 'Fantasia'
              Width = 375
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dtdocumento'
              Title.Caption = 'Data Emiss'#227'o'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dtretirada'
              Title.Caption = 'Data Retirada'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dtdevolucao'
              Title.Caption = 'Data Devolu'#231#227'o'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'controle'
              Title.Caption = 'Reserva'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente'
              Title.Caption = 'Cliente'
              Width = 325
              Visible = True
            end>
        end
        object pnl_observacao2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 415
          Width = 1075
          Height = 26
          Margins.Top = 0
          Align = alBottom
          BevelOuter = bvNone
          Color = clInfoBk
          ParentBackground = False
          TabOrder = 3
          Visible = False
          object lblOpcoes2: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 320
            Height = 20
            Margins.Left = 10
            Align = alLeft
            Caption = 'Pressione CTRL para multipla sele'#231#227'o de registros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5395026
            Font.Height = -13
            Font.Name = 'Product Sans'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitHeight = 16
          end
        end
        object pnl_dtdevolucao: TPanel
          Left = 307
          Top = 152
          Width = 474
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = 15132390
          ParentBackground = False
          TabOrder = 4
          Visible = False
          object Label3: TLabel
            Left = 222
            Top = 13
            Width = 112
            Height = 16
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
          end
          object Label1: TLabel
            Left = 8
            Top = 13
            Width = 101
            Height = 16
            Caption = 'Data de Retirada:'
          end
          object jvedt_dtdevolucao: TJvDatePickerEdit
            Left = 335
            Top = 10
            Width = 106
            Height = 24
            AllowNoDate = True
            Checked = True
            TabOrder = 0
          end
          object jvedt_dtretirada: TJvDatePickerEdit
            Left = 110
            Top = 10
            Width = 106
            Height = 24
            AllowNoDate = True
            Checked = True
            TabOrder = 1
          end
        end
      end
    end
  end
  object dsFormaPagto: TDataSource
    Left = 1040
    Top = 120
  end
  object jvdsItens: TJvDataSource
    DataSet = fdmtb_ordemDetail
    Left = 624
    Top = 376
  end
  object jvdsCab: TJvDataSource
    DataSet = fdmtb_listaOrdens
    OnDataSetScrolled = jvdsCabDataSetScrolled
    Left = 544
    Top = 376
  end
  object jvdsPagto: TJvDataSource
    DataSet = fdmtb_ordemPagto
    Left = 712
    Top = 376
  end
  object dsFuncionarios: TDataSource
    Left = 1040
    Top = 72
  end
  object JvBalloonHint: TJvBalloonHint
    DefaultIcon = ikNone
    Left = 1032
    Top = 32
  end
  object frxSimpleTextExport: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    DeleteEmptyColumns = True
    Left = 1040
    Top = 344
  end
  object frxPDFExport: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Compressed = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Title = 'Comprovante de Loca'#231#227'o'
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 1040
    Top = 400
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 927
    Top = 175
  end
  object jvdsReservadas: TJvDataSource
    Left = 464
    Top = 376
  end
  object fdmtb_ordemMaster: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 60
    Top = 147
  end
  object fdmtb_ordemDetail: TFDMemTable
    AfterOpen = fdmtb_ordemDetailAfterOpen
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 60
    Top = 211
  end
  object fdmtb_ordemPagto: TFDMemTable
    AfterOpen = fdmtb_ordemPagtoAfterOpen
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 60
    Top = 275
  end
  object frxDBCab: TfrxDBDataset
    UserName = 'frxDBCab'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 1036
    Top = 235
  end
  object frxDBItem: TfrxDBDataset
    UserName = 'frxDBItem'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 1036
    Top = 291
  end
  object frxReport: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43981.832485763900000000
    ReportOptions.LastChange = 45616.561189050920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure mdReservasOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <frxDBCab."cancelado"> = '#39'S'#39' Then'
      '    mdReservas.Visible := False'
      '  else'
      '    mdReservas.Visible := True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 1036
    Top = 179
    Datasets = <
      item
        DataSet = frxDBCab
        DataSetName = 'frxDBCab'
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
        Name = 'totalDinheiro'
        Value = Null
      end
      item
        Name = 'totalcx'
        Value = Null
      end
      item
        Name = 'totalCartaoDeb'
        Value = Null
      end
      item
        Name = 'totalCartaoCred'
        Value = Null
      end
      item
        Name = 'itens_alugados'
        Value = Null
      end
      item
        Name = 'itens_vendidos'
        Value = Null
      end
      item
        Name = 'totalPicPay'
        Value = Null
      end
      item
        Name = 'totalPix'
        Value = Null
      end
      item
        Name = 'totalChqAvista'
        Value = Null
      end
      item
        Name = 'totalChqAprazo'
        Value = Null
      end
      item
        Name = 'totalDeposito'
        Value = Null
      end
      item
        Name = 'totalTransf'
        Value = Null
      end
      item
        Name = 'totalGeral'
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBCab."idtbordens_cab"'
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 20.787415000000000000
          Width = 98.267723860000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Controle: [frxDBCab."controle"]')
          ParentFont = False
        end
        object frxDBReservascliente: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 20.787415000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente: [frxDBCab."cliente"]')
          ParentFont = False
        end
        object frxDBReservasestado: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 20.787415000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Status: [frxDBCab."estado"]')
          ParentFont = False
        end
        object frxDBReservasdtdocumento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [frxDBCab."dtdocumento"]')
          ParentFont = False
        end
        object frxDBReservasdtretirada: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 136.063080000000000000
          Width = 139.842519690000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Retirada em: [frxDBCab."dtretirada"]')
          ParentFont = False
        end
        object frxDBReservasdtdevolucao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 279.685220000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Devolu'#231#227'o em: [frxDBCab."dtdevolucao"]')
          ParentFont = False
        end
        object frxDBReservasusercad: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 532.913730000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Atendente: [frxDBCab."atendente"]')
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
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Frame.Typ = []
          Memo.UTF8W = (
            'Cond. de Pagto: [frxDBCab."forma_pagto"]')
        end
      end
      object TitleReport: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'mdReservasOnBeforePrint'
        DataSet = frxDBCab
        DataSetName = 'frxDBCab'
        RowCount = 0
        object frxDBCabitem: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBCab."item"]')
          ParentFont = False
        end
        object frxDBCabproduto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 34.015770000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          DataField = 'produto'
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCab."produto"]')
          ParentFont = False
        end
        object frxDBCabtipo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 321.260050000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCab."tipo"]')
          ParentFont = False
        end
        object frxDBCabqtde: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 30.236220470000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBCab."qtde"]')
          ParentFont = False
        end
        object frxDBCabvalorUnitario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 502.677490000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
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
            '[frxDBCab."valorUnitario"]')
          ParentFont = False
        end
        object frxDBCabpercDesconto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
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
            '[frxDBCab."percDesconto"]%')
          ParentFont = False
        end
        object frxDBCabvalorDesconto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 608.504330000000000000
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
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
            '[frxDBCab."valorDesconto"]')
          ParentFont = False
        end
        object frxDBCabtotalLiquido: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 657.638220000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
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
            '[frxDBCab."totalLiquido"]')
          ParentFont = False
        end
      end
      object gfReservas: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object frxDBCabtotal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 636.961040000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
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
            '[frxDBCab."totalOrdem"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDash
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCab
          DataSetName = 'frxDBCab'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBCab."qtdeTotal"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 177.637910000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 9.448829880000000000
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
          Top = 3.779530000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Top = 34.015770000000000000
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
          Top = 56.692950000000000000
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
          Top = 79.370130000000000000
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
          Top = 56.692950000000000000
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
          Top = 79.370130000000000000
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
          Top = 34.015770000000000000
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
          Top = 56.692950000000000000
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
          Top = 34.015770000000000000
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
          Top = 34.015770000000000000
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
            '[totalDinheiro]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 56.692950000000000000
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
            '[totalCartaoDeb]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 79.370130000000000000
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
            '[totalCartaoCred]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 102.047310000000000000
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
            'TOTAL PIC-PAY:')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 102.047310000000000000
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
            '[totalPicPay]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 34.015770000000000000
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
          Top = 56.692950000000000000
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
          Top = 34.015770000000000000
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
            '[itens_alugados]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Top = 56.692950000000000000
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
            '[itens_vendidos]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Top = 151.181200000000000000
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
          Top = 151.181200000000000000
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
            '[<fundoscx>+<suprimentos>-<sangrias>+<totalDinheiro>]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 151.181200000000000000
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
          Top = 151.181200000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[totalGeral]')
          ParentFont = False
          Formats = <
            item
              DecimalSeparator = ','
              FormatStr = '%2.2n'
              Kind = fkNumeric
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Top = 147.401670000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 79.370130000000000000
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
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 124.724490000000000000
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
            'TOTAL PIX:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 124.724490000000000000
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
            '[totalPix]')
          ParentFont = False
        end
      end
    end
  end
  object fdmtb_formasPagto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 55
    Top = 335
  end
  object fdmtb_listaPagtos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 791
    Top = 215
  end
  object fdmtb_listaItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 280
  end
  object fdmtb_listaOrdens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 791
    Top = 127
  end
end
