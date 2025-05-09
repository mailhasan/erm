unit unitDaftarPasienRanap;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  DateTimePicker, BCPanel, BCListBox, BCMaterialEdit, BCButtonFocus,
  BCMaterialDesignButton, BCImageButton, BCMDButtonFocus, BGRAThemeButton,
  BGRAColorTheme, BGRAImageTheme, BCComboBox, BCButton,BCLabel;

type

  { TFormDaftarPasienRanap }

  TFormDaftarPasienRanap = class(TForm)
    BCButtonPemeriksaan: TBCButton;
    BCButtonTampilData: TBCButton;
    BCLabelInformasi: TBCLabel;
    BCMaterialEditCari: TBCMaterialEdit;
    BCPanelAtas: TBCPanel;
    BCPaperPanelTengahAtas: TBCPaperPanel;
    BGRAThemeButtonKeluar: TBGRAThemeButton;
    DBGrid1: TDBGrid;
    procedure BCButtonPemeriksaanClick(Sender: TObject);
    procedure BCButtonTampilDataClick(Sender: TObject);
    procedure BCMaterialEditCariClick(Sender: TObject);
    procedure BCMaterialEditCariKeyPress(Sender: TObject; var Key: char);
    procedure BCMDButtonFocus1Click(Sender: TObject);
    procedure BGRAThemeButtonKeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FormDaftarPasienRanap: TFormDaftarPasienRanap;

implementation

{$R *.lfm}

{ TFormDaftarPasienRanap }
uses unitDm,unitPemeriksaan;

procedure TFormDaftarPasienRanap.BCMDButtonFocus1Click(Sender: TObject);
begin
end;

procedure TFormDaftarPasienRanap.BCMaterialEditCariClick(Sender: TObject);
begin

end;

procedure TFormDaftarPasienRanap.BCButtonTampilDataClick(Sender: TObject);
begin
  if BCMaterialEditCari.Text = '' then
    begin
     with DmKoneksi.ZQueryTampilPasienRanap do
      begin
        Close;
        SQL.Clear;
        SQL.Text :=
            'SELECT ' +
            '    reg_periksa.no_rawat, ' +
            '    pasien.no_rkm_medis, ' +
            '    pasien.nm_pasien, ' +
            '    pasien.alamat, ' +
            '    reg_periksa.p_jawab, ' +
            '    reg_periksa.hubunganpj, ' +
            '    penjab.png_jawab, ' +
            '    kamar.kd_kamar, ' +
            '    kamar.trf_kamar, ' +
            '    kamar_inap.diagnosa_awal, ' +
            '    kamar_inap.diagnosa_akhir, ' +
            '    kamar_inap.tgl_masuk, ' +
            '    kamar_inap.jam_masuk, ' +
            '    kamar_inap.tgl_keluar, ' +
            '    kamar_inap.jam_keluar, ' +
            '    kamar_inap.ttl_biaya, ' +
            '    kamar_inap.stts_pulang, ' +
            '    kamar_inap.lama, ' +
            '    dokter.nm_dokter, ' +
            '    reg_periksa.status_bayar, ' +
            '    pasien.agama ' +
            'FROM kamar_inap ' +
            'JOIN reg_periksa ON kamar_inap.no_rawat = reg_periksa.no_rawat ' +
            'JOIN pasien ON reg_periksa.no_rkm_medis = pasien.no_rkm_medis ' +
            'JOIN penjab ON reg_periksa.kd_pj = penjab.kd_pj ' +
            'JOIN kamar ON kamar_inap.kd_kamar = kamar.kd_kamar ' +
            'JOIN dokter ON reg_periksa.kd_dokter = dokter.kd_dokter '+
            'WHERE kamar_inap.stts_pulang = :status ';
        ParamByName('status').AsString := '-';
        Open;
      end;
    end
    else
    begin
     with DmKoneksi.ZQueryTampilPasienRanap do
      begin
        Close;
        SQL.Clear;
        SQL.Text :=
            'SELECT ' +
            '    reg_periksa.no_rawat, ' +
            '    pasien.no_rkm_medis, ' +
            '    pasien.nm_pasien, ' +
            '    pasien.alamat, ' +
            '    reg_periksa.p_jawab, ' +
            '    reg_periksa.hubunganpj, ' +
            '    penjab.png_jawab, ' +
            '    kamar.kd_kamar, ' +
            '    kamar.trf_kamar, ' +
            '    kamar_inap.diagnosa_awal, ' +
            '    kamar_inap.diagnosa_akhir, ' +
            '    kamar_inap.tgl_masuk, ' +
            '    kamar_inap.jam_masuk, ' +
            '    kamar_inap.tgl_keluar, ' +
            '    kamar_inap.jam_keluar, ' +
            '    kamar_inap.ttl_biaya, ' +
            '    kamar_inap.stts_pulang, ' +
            '    kamar_inap.lama, ' +
            '    dokter.nm_dokter, ' +
            '    reg_periksa.status_bayar, ' +
            '    pasien.agama ' +
            'FROM kamar_inap ' +
            'JOIN reg_periksa ON kamar_inap.no_rawat = reg_periksa.no_rawat ' +
            'JOIN pasien ON reg_periksa.no_rkm_medis = pasien.no_rkm_medis ' +
            'JOIN penjab ON reg_periksa.kd_pj = penjab.kd_pj ' +
            'JOIN kamar ON kamar_inap.kd_kamar = kamar.kd_kamar ' +
            'JOIN dokter ON reg_periksa.kd_dokter = dokter.kd_dokter '+
            'WHERE (pasien.no_rkm_medis LIKE :cari OR pasien.nm_pasien LIKE :cari) '+
            'and kamar_inap.stts_pulang = :status ';
        ParamByName('cari').AsString := '%' + Trim(BCMaterialEditCari.Text) + '%';
        ParamByName('status').AsString := '-';
        Open;
      end;
    end;
end;

procedure TFormDaftarPasienRanap.BCButtonPemeriksaanClick(Sender: TObject);
var
  noRawat,noRM,nama,tglDaftar,jamDaftar: string;
begin
  Application.CreateForm(TFormPemeriksaan, FormPemeriksaan);
  with FormPemeriksaan do
   begin
    noRawat := DBGrid1.DataSource.DataSet.FieldByName('no_rawat').AsString;
    noRM := DBGrid1.DataSource.DataSet.FieldByName('no_rkm_medis').AsString;
    nama := DBGrid1.DataSource.DataSet.FieldByName('nm_pasien').AsString;
    tglDaftar := DBGrid1.DataSource.DataSet.FieldByName('tgl_masuk').AsString;
    jamDaftar := DBGrid1.DataSource.DataSet.FieldByName('jam_masuk').AsString;

    EditNoRawat.Text:= noRawat;
    EditNoRm.Text:= noRM;
    EditTgl.Text:= tglDaftar;
    EditJam.Text:= jamDaftar;
    ShowModal;
   end;
end;

procedure TFormDaftarPasienRanap.BCMaterialEditCariKeyPress(Sender: TObject;
  var Key: char);
begin
  if Key=#13 then
  begin
    Key:=#0;
  end;
end;

procedure TFormDaftarPasienRanap.BGRAThemeButtonKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormDaftarPasienRanap.FormShow(Sender: TObject);
begin
  BCMaterialEditCari.Text:='';
end;

end.

