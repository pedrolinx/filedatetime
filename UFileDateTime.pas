unit UFileDateTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, System.IOUtils, cxCheckBox, System.Win.Registry;

type
  TfrmPrincipal = class(TForm)
    cxLabel1: TcxLabel;
    OpenDialog1: TOpenDialog;
    btnProcura: TcxButton;
    btnSetar: TcxButton;
    edtArquivo: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    dtpCriacao: TcxDateEdit;
    dtpUltAcesso: TcxDateEdit;
    dtpUltAlteracao: TcxDateEdit;
    chkAltCriacao: TcxCheckBox;
    chkAltUltAcesso: TcxCheckBox;
    chkAltUltAlteracao: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnProcuraClick(Sender: TObject);
    procedure btnSetarClick(Sender: TObject);
    procedure edtArquivoPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetaDataHora(pArquivo: string);
    procedure BuscaDataArquivo(pArquivo: string);
    procedure Instalar;
    procedure Desinstalar;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnProcuraClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtArquivo.Text := '';
    edtArquivo.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmPrincipal.btnSetarClick(Sender: TObject);
begin
  if FileExists(edtArquivo.Text) then
    SetaDataHora(edtArquivo.Text);
end;

procedure TfrmPrincipal.BuscaDataArquivo(pArquivo: string);
begin
  dtpCriacao.Date      := TFile.GetCreationTime(pArquivo);
  dtpUltAcesso.Date    := TFile.GetLastAccessTime(pArquivo);
  dtpUltAlteracao.Date := TFile.GetLastWriteTime(pArquivo);
end;

procedure TfrmPrincipal.edtArquivoPropertiesChange(Sender: TObject);
begin
  if FileExists(edtArquivo.Text) then
    BuscaDataArquivo(edtArquivo.Text);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if ParamCount > 0 then
  begin
    if LowerCase(ParamStr(1)) = '/install' then
    begin
      Instalar;
      Application.Terminate;
    end;
    if LowerCase(ParamStr(1)) = '/uninstall' then
    begin
      Desinstalar;
      Application.Terminate;
    end;
    edtArquivo.Text := ParamStr(1);
  end;
end;

procedure TfrmPrincipal.SetaDataHora(pArquivo: string);
begin
  if chkAltCriacao.Checked then
    TFile.SetCreationTime(pArquivo, dtpCriacao.Date);
  if chkAltUltAcesso.Checked then
    TFile.SetLastAccessTime(pArquivo, dtpUltAcesso.Date);
  if chkAltUltAlteracao.Checked then
    TFile.SetLastWriteTime(pArquivo, dtpUltAlteracao.Date);
end;

procedure TfrmPrincipal.Instalar;
var
  mReg: TRegistry;
begin
  mReg := TRegistry.Create(KEY_ALL_ACCESS);
  mReg.RootKey := HKEY_CLASSES_ROOT;

  if mReg.OpenKey('*\shell\FileDTime', True) then
  begin
    mReg.WriteString('','Altera Data/Hora');
  end;
  mReg.CloseKey();
  if mReg.OpenKey('*\shell\FileDTime\command', True) then
  begin
    mReg.WriteString('', Application.ExeName + ' "%1"');
  end;
  mReg.CloseKey();

  mReg.Free;
end;

procedure TfrmPrincipal.Desinstalar;
var
  mReg: TRegistry;
begin
  mReg := TRegistry.Create(KEY_ALL_ACCESS);
  mReg.RootKey := HKEY_CLASSES_ROOT;

  try
    mReg.DeleteKey('*\shell\FileDTime\command');
    mReg.DeleteKey('*\shell\FileDTime');
  finally
    mReg.Free;
  end;
end;

end.
