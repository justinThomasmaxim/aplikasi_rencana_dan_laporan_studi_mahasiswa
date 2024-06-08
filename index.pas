Program Data_Mahasiswa;
Uses crt;

{------------TYPE RECORD------------}

  Type Tabel_Mhs = Record
     nim : String;
     nama: String;
  End;

  Type Tabel_MK = Record
     kode_MK : String;
     Nama_MK : String;
     jum_SKS : String;
  End;

  Type Tabel_Nilai = Record
     tugas     : Real;
     UTS       : Real;
     UAS       : Real;
     nil_Angka : Real;
     nil_Huruf : Char;
  End;

Var
  Mhs  : Array[1..100] of Tabel_Mhs;  
  MK   : Array[1..100] of Tabel_MK;
  Nilai: Array[1..100] of Tabel_Nilai;
  Angka: Real;
  i, n : Integer;
  pilih : Integer;
  ulang : char;


  {---PROCEDURE INPUT DATA MAHASISWA---}

     Procedure Mahasiswa;
     Begin
      With Mhs[i] do
        Begin          
          write('NIM Mahasiswa    : ');readln(nim);
          write('Nama Mahasiswa   : ');readln(nama);
          Writeln;
        End;
      End;

  
  {---PROCEDURE INPUT MATAKULIAH---}

      Procedure Mata_Kuliah(nim : string);
      var i : Integer;
      Begin
      for i:=1 to n do
      begin
      if Mhs[i].nim = nim then
      begin
       With MK[i] do
         Begin
           Write('Kode Mata Kuliah : ');readln(kode_MK);
           Write('Nama Mata Kuliah : ');readln(Nama_MK);
           Write('Jumlah SKS       : ');readln(jum_SKS);
           Writeln;
         End;
         end;
         end;
      End;

  {---FUNCTION HITUNG NILAI ANGKA---}

      Function Nilai_Mhs(tugas,UTS,UAS : Real; Var nil_Angka : Real) : Real; 
      Begin
        nil_Angka:= (0.2 * tugas) + (0.3 * UTS) + (0.5 * UAS);
        Nilai_Mhs:= nil_Angka;
      End;


{-------------Procedure Hapus---------------}

Procedure HapusData(nim: String);
var
  i : Integer;
begin
  for i := 1 to n do
  begin
    if Mhs[i].nim = nim then
    begin
      // Menghapus data mahasiswa dengan NIM yang diberikan
      Mhs[i].nim := '';
      Mhs[i].nama := '';
      MK[i].kode_MK := '';
      MK[i].nama_MK := '';
      MK[i].jum_SKS := '';
    end;
  end;
end;


{-----------PROGRAM UTAMA----------}

Begin
    ulang:='n';
    repeat
    Clrscr;
        writeln(' 1. TAMBAHKAN DATA MAHASISWA');
        writeln(' 2. PILIH MATA KULIAH');
        writeln(' 3. INPUT NILAI');
        writeln(' 4. TAMPILKAN SEMUA DATA MAHASISWA');
        writeln(' 5. HAPUS DATA MAHASISWA');
        writeln;
    write(' Pilih Program : ');readln(pilih);
    case pilih of
1:begin
clrscr;

Write('Jumlah Data : ');readln(n);
Writeln;

For i:= 1 to n do
Begin
Writeln('Input data ke-',i);
Writeln('-------');
Mahasiswa;
end;
end;
2:begin
  with Mhs[i] do 
  begin 
    Write('Masukkan NIM : ');
    Readln(Mhs[i+1].nim);
    Mata_Kuliah(Mhs[i+1].nim);
    end; 
    end;
3:begin
with Mhs[i] do 
begin
With Nilai[i] do
   Begin
   Write('Masukkan NIM : ');
    Readln(Mhs[i+1].nim);
    for i:=1 to n do
    if Mhs[i].nim = nim then
      begin
     Write('Nilai Tugas      : ');readln(tugas);
     Write('Nilai UTS        : ');readln(UTS);
     Write('Nilai UAS        : ');readln(UAS);
     Writeln('Nilai Angka      : ',Nilai_Mhs(tugas,UTS,UAS,nil_Angka):0:2);
     Angka:=Nilai_Mhs(tugas,UTS,UAS,nil_Angka);
      if Angka >= 81 then
         nil_Huruf:= 'A'
      Else if Angka >= 71 then
         nil_Huruf:= 'B'
      Else if Angka >= 61 then
         nil_Huruf:= 'C'
      Else if Angka >= 51 then
         nil_Huruf:= 'D'
      Else if Angka < 51 then
         nil_Huruf:= 'E';
     Writeln('Nilai Huruf      : ',nil_Huruf);readln;
   End;
   end;
   end;
   end;

{---MENAMPILKAN DATA DALAM BENTUK TABEL---}

4:Begin
Clrscr;
gotoxy(1,2);Writeln('DATA REPORT':45);
gotoxy(1,4);Writeln('[----][-------------][---------------][-----------][-----------][-------][-----]');
gotoxy(1,5);Writeln('[ NO ][     NIM     ][      Nama     ][  Kode MK  ][  Nama MK  ][  N.A  ][ N.H ]');
gotoxy(1,6);Writeln('[----][-------------][---------------][-----------][-----------][-------][-----]');

For i:= 1 to n do
 Begin
  gotoxy(1,6+i);Write('[    ][             ][               ][           ][           ][       ][     ]');
  gotoxy(3,6+i);Write(i);
  gotoxy(9,6+i);Write(Mhs[i].nim);
  gotoxy(24,6+i);Write(Mhs[i].nama);
  gotoxy(41,6+i);Write(Mk[i].Kode_MK);
  gotoxy(54,6+i);Write(Mk[i].nama_MK);
  gotoxy(67,6+i);Write(Nilai[i].nil_Angka:0:2);
  gotoxy(77,6+i);Write(Nilai[i].nil_Huruf);
  writeln;
 End;
 end;
 5:begin
    // Meminta pengguna untuk memasukkan NIM mahasiswa yang akan dihapus
    with Mhs[i] do
    begin 
    with MK[i] do 
    begin
    Write('Masukkan NIM mahasiswa yang akan dihapus: ');
    Readln(Mhs[i+1].nim);
    HapusData(Mhs[i+1].nim);
    end;
    end;
  end;
 end;
 Write(' Ulang {y/n : }? ');readln(ulang);
 until ulang='n';
 end.
