inherited frmFantasias: TfrmFantasias
  Caption = 'Mister Fantasy - Cadastro de Produtos'
  ClientHeight = 454
  ClientWidth = 757
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 763
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 15
  inherited shp1: TShape
    Top = 387
    Width = 757
    ExplicitTop = 295
    ExplicitWidth = 734
  end
  inherited pnlBotoes: TPanel
    Top = 389
    Width = 757
    ExplicitTop = 389
    ExplicitWidth = 757
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
      Left = 602
      Margins.Left = 3
      OnClick = sbtnPesquisarClick
      ExplicitLeft = 595
    end
    inherited sbtnAnterior: TSpeedButton
      Left = 448
      ExplicitLeft = 441
    end
    inherited sbtnProximo: TSpeedButton
      Left = 519
      ExplicitLeft = 512
    end
    inherited sbtnSair: TSpeedButton
      Left = 689
      ExplicitLeft = 666
    end
    inherited shp2: TShape
      Left = 360
      Margins.Left = 5
      Margins.Right = 5
      ExplicitLeft = 431
    end
    inherited shp3: TShape
      Left = 592
      Margins.Left = 5
      Margins.Right = 5
      ExplicitLeft = 514
    end
    inherited sbtnListaTodos: TSpeedButton
      Left = 377
      ExplicitLeft = 377
    end
  end
  inherited pnlDados: TPanel
    Width = 757
    Height = 387
    ExplicitWidth = 757
    ExplicitHeight = 387
    object Label1: TLabel
      Left = 19
      Top = 58
      Width = 58
      Height = 16
      Caption = 'Descri'#231#227'o'
    end
    object JvLabel1: TJvLabel
      Left = 25
      Top = 269
      Width = 69
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Custo'
      FocusControl = vlrcusto
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
      Top = 269
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Venda'
      FocusControl = vlrcusto
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
      Top = 269
      Width = 77
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Aluguel'
      FocusControl = vlrcusto
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
      Top = 269
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
      Top = 325
      Width = 50
      Height = 16
      Alignment = taCenter
      Caption = 'Estoque'
      FocusControl = estoque
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
      Top = 325
      Width = 79
      Height = 16
      Alignment = taCenter
      Caption = 'Estoque Min.'
      FocusControl = estoquemin
      Layout = tlCenter
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
      Left = 524
      Top = 337
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
      Left = 182
      Top = 325
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
    object idtbproduto: TLabeledEdit
      Left = 19
      Top = 24
      Width = 72
      Height = 24
      TabStop = False
      Alignment = taCenter
      Color = clMenu
      EditLabel.Width = 40
      EditLabel.Height = 16
      EditLabel.Caption = 'C'#243'digo'
      NumbersOnly = True
      TabOrder = 0
      OnExit = idtbprodutoExit
    end
    object nome: TLabeledEdit
      Left = 97
      Top = 24
      Width = 368
      Height = 24
      EditLabel.Width = 101
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome do Produto'
      TabOrder = 1
    end
    object descricao: TMemo
      Left = 19
      Top = 78
      Width = 446
      Height = 185
      ScrollBars = ssVertical
      TabOrder = 2
      OnEnter = descricaoEnter
      OnExit = descricaoExit
    end
    object vlrcusto: TJvValidateEdit
      Left = 18
      Top = 289
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
    object vlrvenda: TJvValidateEdit
      Left = 100
      Top = 289
      Width = 76
      Height = 24
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      DisplayPrefix = 'R$ '
      EditText = '0,00'
      TabOrder = 4
      OnChange = vlrvendaChange
      OnClick = vlrvendaClick
      OnEnter = vlrvendaEnter
    end
    object vlraluguel: TJvValidateEdit
      Left = 182
      Top = 289
      Width = 76
      Height = 24
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      DisplayPrefix = 'R$ '
      EditText = '0,00'
      TabOrder = 5
      OnChange = vlraluguelChange
      OnClick = vlrvendaClick
      OnEnter = vlrvendaEnter
    end
    object estoque: TJvValidateEdit
      Left = 18
      Top = 345
      Width = 76
      Height = 24
      Alignment = taCenter
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      MaxValue = 999999.990000000000000000
      TabOrder = 7
    end
    object estoquemin: TJvValidateEdit
      Left = 100
      Top = 345
      Width = 76
      Height = 24
      Alignment = taCenter
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      EditText = '0'
      MaxValue = 999999.990000000000000000
      TabOrder = 8
    end
    object tipo: TComboBox
      Left = 264
      Top = 289
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
    object pnlImagem: TPanel
      Left = 482
      Top = 25
      Width = 255
      Height = 306
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 9
      object imgFoto: TImage
        Left = 0
        Top = 0
        Width = 251
        Height = 302
        Align = alClient
        AutoSize = True
        Center = True
        Proportional = True
        Stretch = True
        Transparent = True
        ExplicitLeft = 56
        ExplicitTop = 48
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
    object itemvenda: TComboBox
      Left = 182
      Top = 345
      Width = 76
      Height = 24
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 10
      Text = 'Ambos'
      Items.Strings = (
        'Aluguel'
        'Venda'
        'Ambos')
    end
  end
  object ativo: TCheckBox
    Left = 264
    Top = 347
    Width = 103
    Height = 17
    Caption = 'Produto Inativo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Product Sans'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object opgImage: TOpenPictureDialog
    DefaultExt = '*.jpg'
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 544
    Top = 72
  end
end
