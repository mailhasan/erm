unit unitDm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDmKoneksi }

  TDmKoneksi = class(TDataModule)
    DataSourcePemeriksaanRanap: TDataSource;
    DataSourceTampilPasienRanap: TDataSource;
    ZConnectionSik: TZConnection;
    ZQueryPemeriksaanRanap: TZQuery;
    ZQueryTampilPasienRanap: TZQuery;
    procedure ZConnectionSikAfterConnect(Sender: TObject);
  private

  public

  end;

var
  DmKoneksi: TDmKoneksi;

implementation

{$R *.lfm}

{ TDmKoneksi }

procedure TDmKoneksi.ZConnectionSikAfterConnect(Sender: TObject);
begin
  ZQueryTampilPasienRanap.Active:= True;
  ZQueryPemeriksaanRanap.Active:= True;
end;

end.

