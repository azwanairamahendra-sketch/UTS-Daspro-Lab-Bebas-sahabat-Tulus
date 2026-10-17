program SmartCash;
uses crt;

var
  pilihan, jumlahJenisBarang, i, jumlah: integer;
  totalBelanja, diskon, totalBayar, hargaSatuan, subtotal: real;
  namaBarang: string;

begin
  // Menu Interaktif berbasis perulangan (repeat-until)
  repeat
    clrscr;
    writeln('===================================');
    writeln('          APLIKASI SMART CASH      ');
    writeln('===================================');
    writeln('1. Hitung Transaksi Penjualan');
    writeln('2. Tentang Program');
    writeln('3. Keluar');
    write('Pilih menu (1-3): ');
    readln(pilihan);

    // Struktur Pengkondisian (case-of)
    case pilihan of
      1:
      begin
        clrscr;
        writeln('--- MENU TRANSAKSI KASIR ---');
        write('Masukkan jumlah jenis barang (ketik 0 untuk batal): ');
        readln(jumlahJenisBarang);
        
        // Kontrol Perulangan & Peloncatan (continue)
        if jumlahJenisBarang = 0 then
        begin
          writeln('Transaksi dibatalkan. Kembali ke menu utama...');
          delay(1500);
          continue;
        end;
        
        totalBelanja := 0;
        
        // Struktur Perulangan (for-to-do) untuk data berulang
        for i := 1 to jumlahJenisBarang do
        begin
          writeln('-----------------------------------');
          writeln('Barang ke-', i);
          
          // Konsep Dasar & I/O (write, readln)
          write('Nama barang: ');
          readln(namaBarang);
          write('Harga satuan (Rp): ');
          readln(hargaSatuan);
          write('Jumlah barang yang dibeli: ');
          readln(jumlah);
          
          // Perhitungan otomatis harga satuan dikali jumlah barang
          subtotal := hargaSatuan * jumlah;
          writeln('Subtotal untuk ', namaBarang, ': Rp ', subtotal:0:2);
          
          totalBelanja := totalBelanja + subtotal;
        end;

        writeln('-----------------------------------');
        writeln('Total Belanja awal: Rp ', totalBelanja:0:2);

        // Struktur Pengkondisian (if-then-else) untuk diskon
        if totalBelanja > 100000 then
        begin
          diskon := totalBelanja * 0.10;
          writeln('Selamat! Anda mendapatkan diskon 10%: Rp ', diskon:0:2);
        end
        else
        begin
          diskon := 0;
          writeln('Tidak ada diskon untuk total belanja di bawah Rp 100.000.');
        end;

        totalBayar := totalBelanja - diskon;
        writeln('Total yang harus dibayar: Rp ', totalBayar:0:2);
        writeln('-----------------------------------');
        write('Tekan Enter untuk kembali ke menu...');
        readln;
      end;

      2:
      begin
        clrscr;
        writeln('--- TENTANG SMART CASH ---');
        writeln('Aplikasi kasir sederhana untuk memenuhi');
        writeln('tugas UTS Dasar Pemrograman IKLC USU.');
        writeln('-----------------------------------');
        write('Tekan Enter untuk kembali ke menu...');
        readln;
      end;

      3:
      begin
        writeln('Terima kasih telah menggunakan Smart Cash!');
      end;
    else
      begin
        writeln('Pilihan tidak valid! Silakan coba lagi.');
        readln;
      end;
    end;

  until pilihan = 3;
end.