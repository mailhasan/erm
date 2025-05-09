program ERMDokter;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unitUtama, zcomponent, unitDaftarPasienRanap, unitDm, datetimectrls,
  unitPemeriksaan
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='ERM Dokter V.1';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFormUtama, FormUtama);
  Application.CreateForm(TFormDaftarPasienRanap, FormDaftarPasienRanap);
  Application.CreateForm(TDmKoneksi, DmKoneksi);
  Application.CreateForm(TFormPemeriksaan, FormPemeriksaan);
  Application.Run;
end.

