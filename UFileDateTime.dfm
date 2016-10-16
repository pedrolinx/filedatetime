object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Seta Data/Hora'
  ClientHeight = 149
  ClientWidth = 469
  Color = clBtnFace
  Constraints.MaxHeight = 180
  Constraints.MinHeight = 180
  Constraints.MinWidth = 410
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    469
    149)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = 'Arquivo:'
  end
  object btnProcura: TcxButton
    Left = 8
    Top = 120
    Width = 91
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Procurar'
    TabOrder = 1
    OnClick = btnProcuraClick
  end
  object btnSetar: TcxButton
    Left = 371
    Top = 120
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnSetarClick
  end
  object edtArquivo: TcxTextEdit
    Left = 8
    Top = 26
    Anchors = [akLeft, akTop, akRight]
    Properties.ReadOnly = True
    Properties.OnChange = edtArquivoPropertiesChange
    TabOrder = 3
    Width = 454
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 52
    Caption = 'Cria'#231#227'o:'
  end
  object cxLabel3: TcxLabel
    Left = 170
    Top = 52
    Anchors = [akTop]
    AutoSize = False
    Caption = #218'ltimo Acesso:'
    Height = 17
    Width = 130
  end
  object cxLabel4: TcxLabel
    Left = 332
    Top = 52
    Anchors = [akTop, akRight]
    Caption = #218'ltima Altera'#231#227'o:'
  end
  object dtpCriacao: TcxDateEdit
    Left = 8
    Top = 70
    Properties.Kind = ckDateTime
    TabOrder = 7
    Width = 130
  end
  object dtpUltAcesso: TcxDateEdit
    Left = 170
    Top = 70
    Anchors = [akTop]
    Properties.Kind = ckDateTime
    TabOrder = 8
    Width = 130
  end
  object dtpUltAlteracao: TcxDateEdit
    Left = 332
    Top = 70
    Anchors = [akTop, akRight]
    Properties.Kind = ckDateTime
    TabOrder = 9
    Width = 130
  end
  object chkAltCriacao: TcxCheckBox
    Left = 8
    Top = 91
    Caption = 'Alterar'
    TabOrder = 10
  end
  object chkAltUltAcesso: TcxCheckBox
    Left = 170
    Top = 91
    Anchors = [akTop]
    AutoSize = False
    Caption = 'Alterar'
    TabOrder = 11
    Height = 21
    Width = 130
  end
  object chkAltUltAlteracao: TcxCheckBox
    Left = 332
    Top = 91
    Anchors = [akTop, akRight]
    Caption = 'Alterar'
    TabOrder = 12
  end
  object OpenDialog1: TOpenDialog
    Left = 288
    Top = 8
  end
end
