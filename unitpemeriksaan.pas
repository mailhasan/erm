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
    BCPanel1: TBCPanel;
    BCPanel2: TBCPanel;
    BCPaperPanel1: TBCPaperPanel;
    BCPaperPanel2: TBCPaperPanel;
    EditTgl: TEdit;
    EditNoRawat: TEdit;
    EditNoRm: TEdit;
    EditNam: TEdit;
    EditJam: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure BCExpandPanels1ArrangePanels(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private

  public
    procedure tampilDataPemriksaan;
    procedure tampilHtmlView;

  end;

var
  FormPemeriksaan: TFormPemeriksaan;

implementation

{$R *.lfm}
uses unitDm;

procedure TFormPemeriksaan.FormShow(Sender: TObject);
begin
  //tampilDataPemriksaan; tampilHtmlView;
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
            '  ON pemeriksaan_ranap.nip = pegawai.nik where pemeriksaan_ranap.no_rawat=:no_rawat order by tgl_perawatan,jam_rawat asc';
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

