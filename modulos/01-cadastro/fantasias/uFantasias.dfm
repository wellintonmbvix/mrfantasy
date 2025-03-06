inherited fFantasias: TfFantasias
  Caption = 'Mister Fantasy - Cadastro de Produtos'
  ClientHeight = 362
  ClientWidth = 725
  OnClose = FormClose
  ExplicitWidth = 731
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 15
  inherited shp1: TShape
    Top = 295
    Width = 725
    ExplicitTop = 295
    ExplicitWidth = 734
  end
  inherited pnlBotoes: TPanel
    Top = 297
    Width = 725
    ExplicitTop = 297
    ExplicitWidth = 725
    inherited sbtnNovo: TSpeedButton
      OnClick = sbtnNovoClick
    end
    inherited sbtnDuplicar: TSpeedButton
      OnClick = sbtnDuplicarClick
    end
    inherited sbtnCancelar: TSpeedButton
      OnClick = sbtnCancelarClick
    end
    inherited sbtnSalvar: TSpeedButton
      OnClick = sbtnSalvarClick
    end
    inherited sbtnDeletar: TSpeedButton
      OnClick = sbtnDeletarClick
    end
    inherited sbtnPesquisar: TSpeedButton
      Left = 524
      Margins.Left = 3
      OnClick = sbtnPesquisarClick
      ExplicitLeft = 595
    end
    inherited sbtnAnterior: TSpeedButton
      Left = 370
      OnClick = sbtnAnteriorClick
      ExplicitLeft = 441
    end
    inherited sbtnProximo: TSpeedButton
      Left = 441
      OnClick = sbtnProximoClick
      ExplicitLeft = 512
    end
    inherited sbtnSair: TSpeedButton
      Left = 657
      ExplicitLeft = 666
    end
    inherited shp2: TShape
      Left = 360
      Margins.Left = 5
      Margins.Right = 5
      ExplicitLeft = 431
    end
    inherited shp3: TShape
      Left = 514
      Margins.Left = 5
      Margins.Right = 5
      ExplicitLeft = 585
    end
  end
  inherited pnlDados: TPanel
    Width = 725
    Height = 295
    ExplicitWidth = 725
    ExplicitHeight = 295
    object Label1: TLabel
      Left = 19
      Top = 58
      Width = 58
      Height = 16
      Caption = 'Descri'#231#227'o'
    end
    object JvLabel1: TJvLabel
      Left = 25
      Top = 176
      Width = 69
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Custo'
      FocusControl = jvvedt_custo
      Layout = tlCenter
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object JvLabel2: TJvLabel
      Left = 105
      Top = 176
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Venda'
      FocusControl = jvvedt_custo
      Layout = tlCenter
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object JvLabel3: TJvLabel
      Left = 181
      Top = 176
      Width = 77
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Aluguel'
      FocusControl = jvvedt_custo
      Layout = tlCenter
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object JvLabel4: TJvLabel
      Left = 264
      Top = 176
      Width = 93
      Height = 16
      Caption = 'Tipo de Produto'
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object JvLabel5: TJvLabel
      Left = 19
      Top = 232
      Width = 50
      Height = 16
      Alignment = taCenter
      Caption = 'Estoque'
      FocusControl = jvvedt_estoque
      Layout = tlCenter
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object JvLabel6: TJvLabel
      Left = 101
      Top = 232
      Width = 79
      Height = 16
      Alignment = taCenter
      Caption = 'Estoque Min.'
      FocusControl = jvvedt_estoquemin
      Layout = tlCenter
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object JvLabel7: TJvLabel
      Left = 182
      Top = 232
      Width = 40
      Height = 16
      Caption = 'Status'
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object Label2: TLabel
      Left = 482
      Top = 2
      Width = 113
      Height = 16
      Caption = 'Imagem do Produto'
    end
    object sbtAddImagem: TSpeedButton
      Left = 482
      Top = 257
      Width = 186
      Height = 32
      Caption = 'Adicionar Imagem'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFBEBEBEBEBEBEBEBEBEBEBEBEB3B3B3B0B0B0B2B2B2B0
        B0B0B1B1B1B2B2B2B2B2B2BABABABFBFBFBEBEBEBEBEBEBEBEBE525252525252
        525252535353A8A8A8C4C4C4B9B9B9BFBFBFB8B8B8B0B0B0B8B8B87676765252
        525353535252525252525555555555555353535B5B5BD5D5D5BEBEBEDEDEDEC5
        C5C5EFEFEFFEFEFEFFFFFF949494525252575757555555555555525252535353
        525252606060ACACAC909090E0E0E0A0A0A05555555C5C5CA6A6A69A9A9A5252
        52555555525252525252525252535353525252606060ABABAB9F9F9FFFFFFFBF
        BFBF5555556262629494949B9B9B525252555555525252525252535353535353
        525252606060B3B3B3525252717171525252606060A6A6A69F9F9F9A9A9A5252
        52555555535353535353525252535353525252575757BBBBBBA7A7A79D9D9DA5
        A5A5A5A5A5949494C0C0C08C8C8C525252545454525252525252646464646464
        6464646363636868687171717272727171717171717373736E6E6E6464646464
        64646464646464646464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D2D2D2D2
        D2D2D2D2D2D2D3D3D3D3D3D3D4D4D4D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5D5D5D552525252525252525252525252525252525252525252
        5252525252525252525252525252525252525252525252525252565656565656
        5656565656565757575353536F6F6F8686868282828383838383838383838383
        83838383838383838383525252525252525252525252555555525252B2B2B2FF
        FFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBEBEBEBE
        BEBEBEBEBEBEBFBFBFB9B9B9E1E1E1FFFFFFFCFCFCFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = sbtAddImagemClick
    end
    object JvLabel8: TJvLabel
      Left = 264
      Top = 232
      Width = 73
      Height = 16
      Caption = 'Tipo de Item'
      Transparent = True
      HotTrackFont.Charset = ANSI_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Product Sans'
      HotTrackFont.Style = []
    end
    object ledt_idproduto: TLabeledEdit
      Left = 19
      Top = 24
      Width = 49
      Height = 24
      TabStop = False
      Alignment = taCenter
      Color = clMenu
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'C'#243'digo'
      NumbersOnly = True
      TabOrder = 0
      OnExit = ledt_idprodutoExit
    end
    object ledt_nome: TLabeledEdit
      Left = 74
      Top = 24
      Width = 335
      Height = 24
      EditLabel.Width = 101
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome do Produto'
      TabOrder = 1
    end
    object mem_descricao: TMemo
      Left = 19
      Top = 78
      Width = 390
      Height = 89
      ScrollBars = ssVertical
      TabOrder = 2
      OnEnter = mem_descricaoEnter
      OnExit = mem_descricaoExit
    end
    object jvvedt_custo: TJvValidateEdit
      Left = 18
      Top = 196
      Width = 76
      Height = 24
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      DisplayPrefix = 'R$ '
      EditText = '0,00'
      TabOrder = 3
    end
    object jvvedt_venda: TJvValidateEdit
      Left = 100
      Top = 196
      Width = 76
      Height = 24
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      DisplayPrefix = 'R$ '
      EditText = '0,00'
      TabOrder = 4
      OnChange = jvvedt_vendaChange
      OnClick = jvvedt_vendaClick
      OnEnter = jvvedt_vendaEnter
    end
    object jvvedt_aluguel: TJvValidateEdit
      Left = 182
      Top = 196
      Width = 76
      Height = 24
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      DisplayPrefix = 'R$ '
      EditText = '0,00'
      TabOrder = 5
      OnChange = jvvedt_aluguelChange
      OnClick = jvvedt_vendaClick
      OnEnter = jvvedt_vendaEnter
    end
    object jvvedt_estoque: TJvValidateEdit
      Left = 18
      Top = 252
      Width = 76
      Height = 24
      Alignment = taCenter
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      MaxValue = 999999.990000000000000000
      TabOrder = 7
    end
    object jvvedt_estoquemin: TJvValidateEdit
      Left = 100
      Top = 252
      Width = 76
      Height = 24
      Alignment = taCenter
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      EditText = '0'
      MaxValue = 999999.990000000000000000
      TabOrder = 8
    end
    object cbox_tipo: TComboBox
      Left = 264
      Top = 196
      Width = 145
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'Fantasia Masculina'
      Items.Strings = (
        'Fantasia Masculina'
        'Fantasia Feminina'
        'Fantasia Infantil'
        'Mascaras'
        'Perucas'
        'Acess'#243'rios'
        'M'#225'gica e Outros')
    end
    object cbox_status: TComboBox
      Left = 182
      Top = 252
      Width = 76
      Height = 24
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 9
      Text = 'Ativo'
      Items.Strings = (
        'Inativo'
        'Ativo')
    end
    object pnlImagem: TPanel
      Left = 482
      Top = 25
      Width = 186
      Height = 226
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 10
      object imgFoto: TImage
        Left = 0
        Top = 0
        Width = 182
        Height = 222
        Align = alClient
        AutoSize = True
        Center = True
        Stretch = True
        Transparent = True
        ExplicitLeft = 56
        ExplicitTop = 48
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
    object cbox_itemvenda: TComboBox
      Left = 264
      Top = 252
      Width = 76
      Height = 24
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 11
      Text = 'Ambos'
      Items.Strings = (
        'Aluguel'
        'Venda'
        'Ambos')
    end
  end
  object opgImage: TOpenPictureDialog
    DefaultExt = '*.jpg'
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 544
    Top = 72
  end
end
