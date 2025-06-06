unit unitTambahPemeriksaan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DateTimePicker, BCListBox, BGRAThemeButton, BCPanel, BCButton;

type

  { TFromTambahPemeriksaan }

  TFromTambahPemeriksaan = class(TForm)
    BCButtonSimpan: TBCButton;
    BCPanel1: TBCPanel;
    BCPanel2: TBCPanel;
    BCPanel3: TBCPanel;
    ComboBoxKesadaran: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
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
    procedure BCButtonSimpanClick(Sender: TObject);
    procedure BGRAThemeButtonKeluarClick(Sender: TObject);
  private

  public
    procedure baru;

  end;

var
  FromTambahPemeriksaan: TFromTambahPemeriksaan;

implementation

{$R *.lfm}
uses unitDm, unitPemeriksaan;

{ TFromTambahPemeriksaan }
procedure TFromTambahPemeriksaan.baru;
begin
EditAlergi.Text := ' ';
EditBerat.Text := ' ';
MemoEvaluasi.Text := ' ';
EditGCS.Text := ' ';
MemoIntruksi.Text := ' ';
//EditJamPemriksaan.Text := ' ';
MemoSubjek.Text := ' ';
ComboBoxKesadaran.Text := ' ';
EditNadi.Text := ' ';
//EditNIP.Text := ' ';
//EditNoRawat.Text := ' ';
MemoObjek.Text := ' ';
MemoAsesmen.Text := ' ';
EditRR.Text := ' ';
MemoPlan.Text := ' ';
EditSp.Text := ' ';
EditSuhu.Text := ' ';
EditTensi.Text := ' ';
//EditTglPemriksaan.Text := ' ';
EditTb.Text := ' ';
//EditPelaksana.Text := ' ';
BCButtonSimpan.Caption:= 'Simpan';
end;

procedure TFromTambahPemeriksaan.BGRAThemeButtonKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFromTambahPemeriksaan.BCButtonSimpanClick(Sender: TObject);
var
  IsEditMode: Boolean;
begin
  // Tentukan mode berdasarkan caption tombol
  IsEditMode := (LowerCase(Trim(btnSimpan.Caption)) = 'update');

  // Validasi: Pastikan semua Memo wajib diisi
  if Trim(MemoIntruksi.Text) = '' then
  begin
    ShowMessage('Instruksi tidak boleh kosong.');
    MemoIntruksi.SetFocus;
    Exit;
  end;

  if Trim(MemoSubjek.Text) = '' then
  begin
    ShowMessage('Keluhan (Subjektif) tidak boleh kosong.');
    MemoSubjek.SetFocus;
    Exit;
  end;

  if Trim(MemoObjek.Text) = '' then
  begin
    ShowMessage('Pemeriksaan (Objektif) tidak boleh kosong.');
    MemoObjek.SetFocus;
    Exit;
  end;

  if Trim(MemoAsesmen.Text) = '' then
  begin
    ShowMessage('Penilaian (Asesmen) tidak boleh kosong.');
    MemoAsesmen.SetFocus;
    Exit;
  end;

  if Trim(MemoPlan.Text) = '' then
  begin
    ShowMessage('Rencana Tindak Lanjut (Plan) tidak boleh kosong.');
    MemoPlan.SetFocus;
    Exit;
  end;

  // Proses simpan/update
  with DmKoneksi.ZQueryPemeriksaanRanap do
  begin
    Close;
    SQL.Clear;

    if IsEditMode then
    begin
      SQL.Text :=
        'UPDATE pemeriksaan_ranap SET ' +
        'alergi = :alergi, berat = :berat, evaluasi = :evaluasi, gcs = :gcs, instruksi = :instruksi, ' +
        'jam_rawat = :jam_rawat, keluhan = :keluhan, kesadaran = :kesadaran, nadi = :nadi, ' +
        'nip = :nip, pemeriksaan = :pemeriksaan, penilaian = :penilaian, respirasi = :respirasi, ' +
        'rtl = :rtl, spo2 = :spo2, suhu_tubuh = :suhu_tubuh, tensi = :tensi, tinggi = :tinggi ' +
        'WHERE no_rawat = :no_rawat AND tgl_perawatan = :tgl_perawatan';
    end
    else
    begin
      SQL.Text :=
        'INSERT INTO pemeriksaan_ranap (' +
        'alergi, berat, evaluasi, gcs, instruksi, jam_rawat, keluhan, kesadaran, ' +
        'nadi, nip, no_rawat, pemeriksaan, penilaian, respirasi, rtl, spo2, ' +
        'suhu_tubuh, tensi, tgl_perawatan, tinggi) ' +
        'VALUES (:alergi, :berat, :evaluasi, :gcs, :instruksi, :jam_rawat, :keluhan, :kesadaran, ' +
        ':nadi, :nip, :no_rawat, :pemeriksaan, :penilaian, :respirasi, :rtl, :spo2, ' +
        ':suhu_tubuh, :tensi, :tgl_perawatan, :tinggi)';
    end;

    // Isi parameter
    ParamByName('alergi').AsString        := Trim(EditAlergi.Text);
    ParamByName('berat').AsFloat          := StrToFloatDef(EditBerat.Text, 0);
    ParamByName('evaluasi').AsString      := MemoEvaluasi.Text;
    ParamByName('gcs').AsString           := EditGCS.Text;
    ParamByName('instruksi').AsString     := MemoIntruksi.Text;
    ParamByName('jam_rawat').AsString     := FormatDateTime('hh:nn:ss', Time);
    ParamByName('keluhan').AsString       := MemoSubjek.Text;
    ParamByName('kesadaran').AsString     := ComboBoxKesadaran.Text;
    ParamByName('nadi').AsInteger         := StrToIntDef(EditNadi.Text, 0);
    ParamByName('nip').AsString           := ''; // Sesuaikan
    ParamByName('no_rawat').AsString      := FormPemeriksaan.EditNoRawat.Text;
    ParamByName('pemeriksaan').AsString   := MemoObjek.Text;
    ParamByName('penilaian').AsString     := MemoAsesmen.Text;
    ParamByName('respirasi').AsInteger    := StrToIntDef(EditRR.Text, 0);
    ParamByName('rtl').AsString           := MemoPlan.Text;
    ParamByName('spo2').AsInteger         := StrToIntDef(EditSp.Text, 0);
    ParamByName('suhu_tubuh').AsFloat     := StrToFloatDef(EditSuhu.Text, 0);
    ParamByName('tensi').AsString         := EditTensi.Text;
    ParamByName('tgl_perawatan').AsDate   := DateTimePicker1.Date;
    ParamByName('tinggi').AsFloat         := StrToFloatDef(EditTb.Text, 0);

    try
      ExecSQL;
      if IsEditMode then
        ShowMessage('Data berhasil diperbarui.')
      else
        ShowMessage('Data berhasil disimpan.');
    except
      on E: Exception do
        ShowMessage('Gagal menyimpan data: ' + E.Message);
    end;
  end;
end;

end.

