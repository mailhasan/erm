unit unitUtama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, ActnList, BCMaterialDesignButton, BCExpandPanels, BCListBox, BCPanel,
  BCButton, BCButtonFocus, BCMDButton, BCMDButtonFocus, ColorSpeedButton,
  BCImageButton, BGRAThemeButton, BCMaterialEdit, BGRAImageTheme, BCLabel;

type

  { TFormUtama }

  TFormUtama = class(TForm)
    ActionRawatInap: TAction;
    ActionList1: TActionList;
    BCButtonRawatInap: TBCButton;
    BCPanelAtas: TBCPanel;
    BCPaperPanelTengahKonten: TBCPaperPanel;
    BCPaperPanelTengah: TBCPaperPanel;
    BGRAImageThemeBtnKeluar: TBGRAImageTheme;
    StatusBarErm: TStatusBar;
    procedure ActionRawatInapExecute(Sender: TObject);
  private

  public

  end;

var
  FormUtama: TFormUtama;

implementation

{$R *.lfm}

{ TFormUtama }
uses unitDaftarPasienRanap;

procedure TFormUtama.ActionRawatInapExecute(Sender: TObject);
begin
  FormDaftarPasienRanap := TFormDaftarPasienRanap.Create(Self);
  FormDaftarPasienRanap.BorderStyle := bsNone;         // Hilangkan border form
  FormDaftarPasienRanap.Parent := BCPaperPanelTengahKonten;    // Masukkan form ke dalam panel
  FormDaftarPasienRanap.Align := alClient;             // Agar memenuhi panel
  FormDaftarPasienRanap.BCLabelInformasi.Caption:= 'DAFTAR DATA PASIEN RAWAT INAP';
  FormDaftarPasienRanap.Show;
end;

end.

