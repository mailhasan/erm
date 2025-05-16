unit unitPemeriksaan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, DBGrids, DateTimePicker, BCExpandPanels, BCPanel, BCListBox,
  BCButton, ColorSpeedButton, BCButtonFocus, BCMaterialDesignButton, BCMDButton,
  FramView, HtmlView;

type

  { TFormPemeriksaan }

  TFormPemeriksaan = class(TForm)
    BCButtonPemeriksaanCopy: TBCButton;
    BCButtonPemeriksaanHapus: TBCButton;
    BCButtonPemeriksaanTambah: TBCButton;
    BCButtonPemeriksaanUbah: TBCButton;
    BCPanelPemeriksaanAtas: TBCPanel;
    BCPanelPemeriksaanKanan: TBCPanel;
    BCPanelPemeriksaanKiri: TBCPanel;
    BCPaperPanel1: TBCPaperPanel;
    BCPaperPanel2: TBCPaperPanel;
    ComboBoxKesadaran: TComboBox;
    DBGridPemeriksaan: TDBGrid;
    EditPelaksana: TEdit;
    EditNadi: TEdit;
    EditSp: TEdit;
    EditGcs: TEdit;
    EditTglPemriksaan: TEdit;
    EditJamPemriksaan: TEdit;
    EditAlergi: TEdit;
    EditSuhu: TEdit;
    EditTensi: TEdit;
    EditBerat: TEdit;
    EditTb: TEdit;
    EditRR: TEdit;
    EditTgl: TEdit;
    EditNoRawat: TEdit;
    EditNoRm: TEdit;
    EditNam: TEdit;
    EditJam: TEdit;
    Label1: TLabel;
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
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MemoSubjek: TMemo;
    MemoObjek: TMemo;
    MemoAsesmen: TMemo;
    MemoPlan: TMemo;
    MemoIntruksi: TMemo;
    MemoEvaluasi: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure BCButtonPemeriksaanTambahClick(Sender: TObject);
    procedure BCExpandPanels1ArrangePanels(Sender: TObject);
    procedure DBGridPemeriksaanCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private

  public
    procedure tampilDataPemriksaan;
    procedure tampilHtmlView;
    procedure baruPemeriksaan;
  end;

var
  FormPemeriksaan: TFormPemeriksaan;

implementation

{$R *.lfm}
uses unitDm,unitTambahPemeriksaan;

procedure TFormPemeriksaan.baruPemeriksaan;
begin
EditAlergi.Text := ' ';
EditBerat.Text := ' ';
MemoEvaluasi.Text := ' ';
EditGCS.Text := ' ';
MemoIntruksi.Text := ' ';
EditJamPemriksaan.Text := ' ';
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
EditTglPemriksaan.Text := ' ';
EditTb.Text := ' ';
EditPelaksana.Text := ' ';
end;

procedure TFormPemeriksaan.FormShow(Sender: TObject);
begin
  tampilDataPemriksaan; baruPemeriksaan;
end;

procedure TFormPemeriksaan.PageControl1Change(Sender: TObject);
begin

end;

procedure TFormPemeriksaan.Panel1Click(Sender: TObject);
begin

end;

procedure TFormPemeriksaan.BCExpandPanels1ArrangePanels(Sender: TObject);
begin

end;

procedure TFormPemeriksaan.BCButtonPemeriksaanTambahClick(Sender: TObject);
begin
  Application.CreateForm(TFromTambahPemeriksaan, FromTambahPemeriksaan);
  FromTambahPemeriksaan.baru;
  FromTambahPemeriksaan.ShowModal;
end;

procedure TFormPemeriksaan.DBGridPemeriksaanCellClick(Column: TColumn);
var
  alergi,berat,evaluasi,gcs,instruksi,jam_rawat,keluhan,kesadaran,nadi,nip,no_rawat,pemeriksaan,penilaian,
  respirasi,rtl,spo2,suhu_tubuh,tensi,tgl_perawatan,tinggi,nama : string;
begin

  alergi := DBGridPemeriksaan.DataSource.DataSet.FieldByName('alergi').AsString;
  berat := DBGridPemeriksaan.DataSource.DataSet.FieldByName('berat').AsString;
  evaluasi := DBGridPemeriksaan.DataSource.DataSet.FieldByName('evaluasi').AsString;
  gcs := DBGridPemeriksaan.DataSource.DataSet.FieldByName('gcs').AsString;
  instruksi := DBGridPemeriksaan.DataSource.DataSet.FieldByName('instruksi').AsString;
  jam_rawat := DBGridPemeriksaan.DataSource.DataSet.FieldByName('jam_rawat').AsString;
  keluhan := DBGridPemeriksaan.DataSource.DataSet.FieldByName('keluhan').AsString;
  kesadaran := DBGridPemeriksaan.DataSource.DataSet.FieldByName('kesadaran').AsString;
  nadi := DBGridPemeriksaan.DataSource.DataSet.FieldByName('nadi').AsString;
  nip := DBGridPemeriksaan.DataSource.DataSet.FieldByName('nip').AsString;
  //noRawat := DBGridPemeriksaan.DataSource.DataSet.FieldByName('no_rawat').AsString;
  pemeriksaan := DBGridPemeriksaan.DataSource.DataSet.FieldByName('pemeriksaan').AsString;
  penilaian := DBGridPemeriksaan.DataSource.DataSet.FieldByName('penilaian').AsString;
  respirasi := DBGridPemeriksaan.DataSource.DataSet.FieldByName('respirasi').AsString;
  rtl := DBGridPemeriksaan.DataSource.DataSet.FieldByName('rtl').AsString;
  spo2 := DBGridPemeriksaan.DataSource.DataSet.FieldByName('spo2').AsString;
  suhu_tubuh := DBGridPemeriksaan.DataSource.DataSet.FieldByName('suhu_tubuh').AsString;
  tensi := DBGridPemeriksaan.DataSource.DataSet.FieldByName('tensi').AsString;
  tgl_Perawatan := DBGridPemeriksaan.DataSource.DataSet.FieldByName('tgl_perawatan').AsString;
  tinggi := DBGridPemeriksaan.DataSource.DataSet.FieldByName('tinggi').AsString;
  nama := DBGridPemeriksaan.DataSource.DataSet.FieldByName('nama').AsString;

  EditAlergi.Text := alergi;
  EditBerat.Text := berat;
  MemoEvaluasi.Text := evaluasi;
  EditGCS.Text := gcs;
  MemoIntruksi.Text := instruksi;
  EditJamPemriksaan.Text := jam_rawat;
  MemoSubjek.Text := keluhan;
  ComboBoxKesadaran.Text := kesadaran;
  EditNadi.Text := nadi;
  //EditNIP.Text := nip;
  //EditNoRawat.Text := noRawat;
  MemoObjek.Text := pemeriksaan;
  MemoAsesmen.Text := penilaian;
  EditRR.Text := respirasi;
  MemoPlan.Text := rtl;
  EditSp.Text := spo2;
  EditSuhu.Text := suhu_Tubuh;
  EditTensi.Text := tensi;
  EditTglPemriksaan.Text := tgl_Perawatan;
  EditTb.Text := tinggi;
  EditPelaksana.Text := nama;

end;

procedure TFormPemeriksaan.tampilDataPemriksaan;
begin
 with DmKoneksi.ZQueryPemeriksaanRanap do
 begin
  Close;
  SQL.Clear;
  SQL.Text :=
            'SELECT ' +
            '  pemeriksaan_ranap.alergi, ' +
            '  pemeriksaan_ranap.berat, ' +
            '  pemeriksaan_ranap.evaluasi, ' +
            '  pemeriksaan_ranap.gcs, ' +
            '  pemeriksaan_ranap.instruksi, ' +
            '  pemeriksaan_ranap.jam_rawat, ' +
            '  pemeriksaan_ranap.keluhan, ' +
            '  pemeriksaan_ranap.kesadaran, ' +
            '  pemeriksaan_ranap.nadi, ' +
            '  pemeriksaan_ranap.nip, ' +
            '  pemeriksaan_ranap.no_rawat, ' +
            '  pemeriksaan_ranap.pemeriksaan, ' +
            '  pemeriksaan_ranap.penilaian, ' +
            '  pemeriksaan_ranap.respirasi, ' +
            '  pemeriksaan_ranap.rtl, ' +
            '  pemeriksaan_ranap.spo2, ' +
            '  pemeriksaan_ranap.suhu_tubuh, ' +
            '  pemeriksaan_ranap.tensi, ' +
            '  pemeriksaan_ranap.tgl_perawatan, ' +
            '  pemeriksaan_ranap.tinggi, ' +
            '  pegawai.nama ' +
            'FROM pemeriksaan_ranap ' +
            'INNER JOIN pegawai ' +
            '  ON pemeriksaan_ranap.nip = pegawai.nik where pemeriksaan_ranap.no_rawat=:no_rawat order by tgl_perawatan,jam_rawat desc';
  ParamByName('no_rawat').AsString := EditNoRawat.Text;
  Open;
 end;
end;



procedure TFormPemeriksaan.tampilHtmlView;
var
  HTMLText: string;
  No: Integer;
begin
  HTMLText := '<html><head><style>' +
              'body {font-family: Arial; font-size: 14px;}' +
              '.section {margin-bottom: 20px;}' +
              'table {width: 100%; border-collapse: collapse; margin-top: 10px;}' +
              'td, th {border: 1px solid #ccc; padding: 6px; text-align: left;}' +
              'th {background-color: #f0f0f0;}' +
              '</style></head><body>';
  HTMLText:= HTMLText + '<h4> Riwayat Keperawatan </h4>';
  No := 1;

  with DmKoneksi.ZQueryPemeriksaanRanap do
  begin
    First;
    while not EOF do
    begin
      // Bagian informasi utama (Tabel ke bawah)
      HTMLText := HTMLText + '<div class="section">' +
        '<h3>Data Pemeriksaan #' + IntToStr(No) + '</h3>' +
        '<table>' +
        '<tr><th>No : ' + IntToStr(No) + ' Tanggal : '+ FieldByName('tgl_perawatan').AsString + ' Jam : '+ FieldByName('jam_rawat').AsString + ' </th> </tr> '+
        '<tr><th>No. Rawat</th></tr><tr><td>' + FieldByName('no_rawat').AsString + '</td></tr>' +
        '<tr><th>Nama Pegawai</th></tr><tr><td>' + FieldByName('nama').AsString + '</td></tr>' +
        '<tr><th>Keluhan</th></tr><tr><td>' + FieldByName('keluhan').AsString + '</td></tr>' +
        '<tr><th>Pemeriksaan</th></tr><tr><td>' + FieldByName('pemeriksaan').AsString + '</td></tr>' +
        '<tr><th>Penilaian</th></tr><tr><td>' + FieldByName('penilaian').AsString + '</td></tr>' +
        '<tr><th>Instruksi</th></tr><tr><td>' + FieldByName('instruksi').AsString + '</td></tr>' +
        '<tr><th>Evaluasi</th></tr><tr><td>' + FieldByName('evaluasi').AsString + '</td></tr>' +
        '<tr><th>RTL</th></tr><tr><td>' + FieldByName('rtl').AsString + '</td></tr>' +
        '</table>';

      // Bagian pemeriksaan fisik (Tabel ke samping)
      HTMLText := HTMLText +
        '<h4>Pemeriksaan Fisik</h4>' +
        '<table>' +
        '<tr>' +
        '<th>Tensi</th><th>Nadi</th><th>Respirasi</th><th>Suhu</th>' +
        '<th>SPO2</th><th>GCS</th><th>Kesadaran</th>' +
        '<th>Berat</th><th>Tinggi</th><th>Alergi</th>' +
        '</tr><tr>' +
        '<td>' + FieldByName('tensi').AsString + '</td>' +
        '<td>' + FieldByName('nadi').AsString + '</td>' +
        '<td>' + FieldByName('respirasi').AsString + '</td>' +
        '<td>' + FieldByName('suhu_tubuh').AsString + '</td>' +
        '<td>' + FieldByName('spo2').AsString + '</td>' +
        '<td>' + FieldByName('gcs').AsString + '</td>' +
        '<td>' + FieldByName('kesadaran').AsString + '</td>' +
        '<td>' + FieldByName('berat').AsString + '</td>' +
        '<td>' + FieldByName('tinggi').AsString + '</td>' +
        '<td>' + FieldByName('alergi').AsString + '</td>' +
        '</tr></table></div><hr>';

      Inc(No);
      Next;
    end;
  end;

  HTMLText := HTMLText + '</table></body></html>';

  //HTMLViewer1.LoadFromString(HTMLText);
end;

end.

