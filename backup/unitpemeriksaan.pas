unit unitPemeriksaan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DateTimePicker, BCExpandPanels, BCPanel, BCListBox, FramView, HtmlView;

type

  { TFormPemeriksaan }

  TFormPemeriksaan = class(TForm)
    BCPaperPanel1: TBCPaperPanel;
    BCPaperPanel2: TBCPaperPanel;
    EditTgl: TEdit;
    EditNoRawat: TEdit;
    EditNoRm: TEdit;
    EditNam: TEdit;
    EditJam: TEdit;
    HtmlViewer1: THtmlViewer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
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
  tampilDataPemriksaan; tampilHtmlView;
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
            '  pemeriksaan_ranap.tinggi ' +
            'FROM sikDrSalim1.pemeriksaan_ranap ' +
            'INNER JOIN sikDrSalim1.pegawai ' +
            '  ON pemeriksaan_ranap.nip = pegawai.nik';
  Open;
 end;
end;



procedure TFormPemeriksaan.tampilHtmlView;
var
 html: string;
begin
 html :=
    '<html>' +
    '<head>' +
    '<style>' +
    'table { width: 100%; border-collapse: collapse; }' +
    'th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }' +
    'th { background-color: #f2f2f2; }' +
    '@media screen and (max-width: 600px) {' +
    '  table, thead, tbody, th, td, tr { display: block; }' +
    '  tr { margin-bottom: 15px; }' +
    '  td { border: none; position: relative; padding-left: 50%; }' +
    '  td:before { content: attr(data-label); position: absolute; left: 10px; top: 8px; font-weight: bold; }' +
    '}' +
    '</style>' +
    '</head>' +
    '<body>' +
    '<h2>Daftar Obat</h2>' +
    '<table>' +
    '<thead><tr><th>Nama</th><th>Harga</th><th>Stok</th></tr></thead>' +
    '<tbody>';

    DmKoneksi.ZQueryPemeriksaanRanap.First;
    while not DmKoneksi.ZQueryPemeriksaanRanap.EOF do
    begin
      html := html + '<tr>' +
        '<td data-label="Nama">' + DmKoneksi.ZQueryPemeriksaanRanap.FieldByName('no_rawat').AsString + '</td>' +
        '<td data-label="Harga">' + DmKoneksi.ZQueryPemeriksaanRanap.FieldByName('tgl_perawatan').AsString + '</td>' +
        '<td data-label="Stok">' + DmKoneksi.ZQueryPemeriksaanRanap.FieldByName('jam_rawat').AsString + '</td>' +
        '</tr>' +
        '<tr><th>Nama</th><th>Harga</th><th>Stok</th></tr> ;
      DmKoneksi.ZQueryPemeriksaanRanap.Next;
    end;

    html := html +
      '</tbody>' +
      '</table>' +

     '<h2>Daftar Obat</h2>' +
      '<table>' +
      '<thead><tr><th>Nama</th><th>Harga</th><th>Stok</th></tr></thead>' +
      '<tbody>';

    DmKoneksi.ZQueryPemeriksaanRanap.First;
    while not DmKoneksi.ZQueryPemeriksaanRanap.EOF do
    begin
      html := html + '<tr>' +
        '<td data-label="Nama">' + DmKoneksi.ZQueryPemeriksaanRanap.FieldByName('no_rawat').AsString + '</td>' +
        '<td data-label="Harga">' + DmKoneksi.ZQueryPemeriksaanRanap.FieldByName('tgl_perawatan').AsString + '</td>' +
        '<td data-label="Stok">' + DmKoneksi.ZQueryPemeriksaanRanap.FieldByName('jam_rawat').AsString + '</td>' +
        '</tr>';
      DmKoneksi.ZQueryPemeriksaanRanap.Next;
    end;

    html := html +
      '</tbody>' +
      '</table>' +


    '</body></html>';
 HTMLViewer1.LoadFromString(html);
end;

end.

