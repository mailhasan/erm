unit unitTambahPemeriksaan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, BCListBox,
  BGRAThemeButton, BCPanel;

type

  { TFromTambahPemeriksaan }

  TFromTambahPemeriksaan = class(TForm)
    BCPanel1: TBCPanel;
    BCPanel2: TBCPanel;
    BCPanel3: TBCPanel;
    ComboBoxKesadaran: TComboBox;
    EditAlergi: TEdit;
    EditBerat: TEdit;
    EditGcs: TEdit;
    EditNadi: TEdit;
    EditRR: TEdit;
    EditSp: TEdit;
    EditSuhu: TEdit;
    EditTb: TEdit;
    EditTensi: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MemoAsesmen: TMemo;
    MemoEvaluasi: TMemo;
    MemoIntruksi: TMemo;
    MemoObjek: TMemo;
    MemoPlan: TMemo;
    MemoSubjek: TMemo;
    procedure BGRAThemeButtonKeluarClick(Sender: TObject);
  private

  public

  end;

var
  FromTambahPemeriksaan: TFromTambahPemeriksaan;

implementation

{$R *.lfm}

{ TFromTambahPemeriksaan }

procedure TFromTambahPemeriksaan.BGRAThemeButtonKeluarClick(Sender: TObject);
begin
  Close;
end;

end.

