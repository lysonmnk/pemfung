# Praktikum Pemrograman Fungsional: Tipe Bentukan Point

Repositori ini berisi materi dan implementasi praktikum tipe bentukan `Point` menggunakan bahasa pemrograman Haskell.

## Informasi Praktikum

| Atribut | Keterangan |
|---|---|
| Kode Dokumen | Praktikum6/11S1111-PEMFUNG |
| Mata Kuliah | Pemrograman Fungsional |
| Tanggal | 06 Oktober 2026 |
| Semester | 1 (Gasal) |
| Topik | Tipe Bentukan: Point |
| Minggu / Pertemuan / Sesi | 05 / 01 / 01-02 |
| Aktivitas | Praktikum |
| Durasi | 170 menit |
| Setoran | Dokumen laporan PDF |
| Tempat Penyerahan | https://ecourse.del.ac.id/ |

## Daftar Isi

1. [Tujuan](#tujuan)
2. [Penilaian](#penilaian)
3. [Persiapan Praktikum](#persiapan-praktikum)
4. [Dokumen Laporan](#dokumen-laporan)
5. [Aktivitas Praktikum](#aktivitas-praktikum)
   - [Aktivitas 1: Notasi Fungsional Tipe Bentukan](#aktivitas-1-notasi-fungsional-tipe-bentukan)
   - [Aktivitas 2: Implementasi Tipe Bentukan](#aktivitas-2-implementasi-tipe-bentukan)
   - [Aktivitas 3: Melengkapi Fungsi Predikat dan Operator](#aktivitas-3-melengkapi-fungsi-predikat-dan-operator)
6. [Struktur Proyek](#struktur-proyek)
7. [Cara Menjalankan Program](#cara-menjalankan-program)

---

## Tujuan

1. Mahasiswa mampu memahami dan menuliskan notasi fungsional untuk tipe bentukan.
2. Mahasiswa mampu merealisasikan tipe bentukan pada notasi fungsional ke bahasa pemrograman Haskell.

## Penilaian

| No | Kriteria | Bobot (%) |
|---|---|---|
| 1 | Menuliskan notasi fungsional tipe bentukan | 25 |
| 2 | Mengimplementasikan tipe bentukan | 25 |
| 3 | Melengkapi fungsi predikat dan operator pada tipe Point | 50 |
| | **Total** | **100** |

## Persiapan Praktikum

Buat workspace baru pada Visual Studio Code dengan format penamaan:

```
{username}-pemfung-praktikum-6
```

## Dokumen Laporan

Laporan disusun menggunakan Template Laporan Praktikum dan Contoh Laporan Praktikum yang disediakan. Sebelum diunggah ke E-Course, ubah nama berkas dengan format:

```
{NIM}-pemfung-laporan-praktikum-5.pdf
```

Contoh:

```
11S20029-pemfung-laporan-praktikum-5.pdf
```

---

## Aktivitas Praktikum

### Aktivitas 1: Notasi Fungsional Tipe Bentukan

Bagian ini membahas cara menuliskan notasi fungsional untuk tipe `Point`. Pelajari diktat untuk penulisan notasi fungsional yang lebih lengkap.

#### Definisi Type

```
type point : < x: integer, y: integer >
{ <x,y> adalah sebuah point (titik) dalam koordinat kartesius
  dengan x adalah absis dan y adalah ordinat }
```

#### Definisi dan Spesifikasi Selektor

```
absis : Point -> integer
{ absis(p) memberikan absis dari Point p }

ordinat : Point -> integer
{ ordinat(p) memberikan ordinat dari Point p }
```

#### Definisi dan Spesifikasi Konstruktor

```
makePoint : 2 integer -> Point
{ makePoint(x,y) membentuk sebuah Point p dari x dan y
  dengan x sebagai absis dan y sebagai ordinat }
```

#### Definisi dan Spesifikasi Predikat

```
isOrigin : Point -> boolean
{ isOrigin(p) mengembalikan nilai benar jika titik p adalah titik pusat (0,0) }

kuadran : Point -> integer
{ kuadran(p) mengembalikan lokasi kuadran dari titik p }
```

---

### Aktivitas 2: Implementasi Tipe Bentukan

Bagian ini merealisasikan notasi fungsional ke dalam bahasa Haskell. Lakukan proses compile dan run program secara mandiri.

#### Realisasi Haskell untuk Definisi Type

```haskell
data Point = Point { x :: Int, y :: Int } deriving Show
```

#### Realisasi Haskell untuk Selektor

```haskell
absis :: Point -> Int
absis point = x point

ordinat :: Point -> Int
ordinat point = y point
```

#### Realisasi Haskell untuk Konstruktor

```haskell
makePoint :: Int -> Int -> Point
makePoint x y = Point { x = x, y = y }
```

#### Realisasi Haskell untuk Predikat

```haskell
isOrigin :: Point -> Bool
isOrigin p = absis p == 0 && ordinat p == 0

kuadran :: Point -> String
kuadran p
  | absis p > 0 && ordinat p > 0 = "1"
  | absis p < 0 && ordinat p > 0 = "2"
  | absis p < 0 && ordinat p < 0 = "3"
  | absis p > 0 && ordinat p < 0 = "4"
  | otherwise                    = "Lainnya"
```

#### Aplikasi

| Ekspresi | Hasil |
|---|---|
| `isOrigin (makePoint 2 (-2))` | `False` |
| `isOrigin (makePoint 2 2)` | `False` |
| `isOrigin (makePoint 0 0)` | `True` |
| `isOrigin (makePoint (-2) (-2))` | `False` |
| `isOrigin (makePoint (-2) 2)` | `False` |
| `kuadran (makePoint 2 (-2))` | `4` |
| `kuadran (makePoint 2 2)` | `1` |
| `kuadran (makePoint 0 0)` | `Lainnya` |
| `kuadran (makePoint (-2) (-2))` | `3` |
| `kuadran (makePoint (-2) 2)` | `2` |

---

### Aktivitas 3: Melengkapi Fungsi Predikat dan Operator

Lengkapi fungsi pada tipe bentukan `Point`. Buat notasi fungsional secara lengkap hingga terdapat realisasi Haskell dan aplikasi pada Laporan Praktikum.

#### Fungsi yang Harus Ditambahkan

| No | Fungsi | Deskripsi |
|---|---|---|
| 1 | `isOnSbY(p)` | Memeriksa apakah titik `p` berada pada sumbu Y. |
| 2 | `isEqual(p1, p2)` | Memeriksa apakah titik `p1` sama dengan titik `p2`. |
| 3 | `translasiSbY(p, n)` | Mengembalikan titik hasil translasi titik `p` searah sumbu Y sejauh `n`. |
| 4 | `jarak(p1, p2)` | Mengembalikan nilai real yang merupakan jarak antara titik `p1` dan `p2`. |

#### Kerangka Program `tipePoint.hs`

```haskell
-- Definisi tipe data Point
-- <x,y> adalah sebuah point (titik) dalam koordinat kartesius
-- dengan x adalah absis dan y adalah ordinat
data Point = Point { x :: Int, y :: Int } deriving Show

-- Realisasi Selektor
-- absis(p) memberikan absis dari Point p
absis :: Point -> Int
absis point = x point

-- ordinat(p) memberikan ordinat dari Point p
ordinat :: Point -> Int
ordinat point = y point

-- Realisasi Konstruktor
-- makePoint(x,y) membentuk sebuah Point p dari x dan y
-- dengan x sebagai absis dan y sebagai ordinat
makePoint :: Int -> Int -> Point
makePoint x y = Point { x = x, y = y }

-- Realisasi Predikat
-- isOrigin(p) mengembalikan nilai benar jika titik p adalah titik pusat (0,0)
isOrigin :: Point -> Bool
isOrigin p = absis p == 0 && ordinat p == 0
```

#### Pemanggilan Fungsi pada `main`

```haskell
-- memanggil fungsi isOnSbY(p)
putStrLn $ "isOnSbY(p1) = " ++ show (isOnSbY p1)
putStrLn $ "isOnSbY(p2) = " ++ show (isOnSbY p2)

-- memanggil fungsi isEqual(p1, p2)
putStrLn $ "isEqual(p1, p2) = " ++ show (isEqual p1 p2)

-- memanggil fungsi translasiSbY(p, n)
putStrLn $ "translasiSbY(p1, n) = " ++ show (translasiSbY p1 n)
putStrLn $ "translasiSbY(p2, n) = " ++ show (translasiSbY p2 n)

-- memanggil fungsi jarak(p1, p2)
putStrLn $ "jarak(p1, p2) = " ++ show (jarak p1 p2)
```

#### Hasil yang Diharapkan

Input:

| Variabel | Nilai |
|---|---|
| Absis `p1` | 10 |
| Ordinat `p1` | 1 |
| Absis `p2` | 8 |
| Ordinat `p2` | 1 |
| `n` | 1 |

Output:

```
p1 = Point {x = 10, y = 1}
p2 = Point {x = 8, y = 1}
n = 1
isOnSbY(p1) = False
isOnSbY(p2) = False
isEqual(p1, p2) = False
translasiSbY(p1, n) = Point {x = 10, y = 2}
translasiSbY(p2, n) = Point {x = 8, y = 2}
jarak(p1, p2) = 2.0
```

---

## Struktur Proyek

```
{username}-pemfung-praktikum-6/
├── tipePoint.hs
├── README.md
└── {NIM}-pemfung-laporan-praktikum-5.pdf
```

## Cara Menjalankan Program

Pastikan GHC (Glasgow Haskell Compiler) telah terpasang, kemudian jalankan salah satu perintah berikut dari direktori proyek.

Menjalankan secara langsung:

```bash
runghc tipePoint.hs
```

Compile terlebih dahulu, lalu jalankan:

```bash
ghc tipePoint.hs -o tipePoint
./tipePoint
```

Menggunakan interpreter interaktif:

```bash
ghci tipePoint.hs
```

---

## Catatan

Dokumen sumber memuat label "Praktikum 5" pada beberapa halaman, sedangkan kode dokumen dan nama workspace menggunakan "Praktikum 6". README ini mengikuti format penamaan sebagaimana tertulis pada dokumen sumber.
