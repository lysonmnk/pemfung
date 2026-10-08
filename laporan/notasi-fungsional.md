# NOTASI FUNGSIONAL TIPE POINT

## TYPE POINT

### DEFINISI TYPE
type point : < x: integer, y: integer >
{ <x,y> adalah sebuah point (titik) dalam koordinat kartesius dengan x adalah absis dan y adalah ordinat }

### DEFINISI DAN SPESIFIKASI SELEKTOR
absis : Point → integer
{ absis(p) memberikan absis dari Point p }

ordinat : Point → integer
{ ordinat(p) memberikan ordinat dari Point p }

### DEFINISI DAN SPESIFIKASI KONSTRUKTOR
makePoint : 2 integer → Point
{ makePoint(x,y) membentuk sebuah Point p dari x dan y dengan x sebagai absis dan y sebagai ordinat }

### DEFINISI DAN SPESIFIKASI PREDIKAT
isOrigin : Point → boolean
{ isOrigin(p) mengembalikan nilai benar jika titik p adalah titik pusat (0,0) }

kuadran : Point → string
{ kuadran(p) mengembalikan lokasi kuadran dari titik p: "1", "2", "3", "4", atau "Lainnya" jika titik berada pada sumbu atau titik pusat }

isOnSbY : Point → boolean
{ isOnSbY(p) mengembalikan nilai benar jika titik p berada pada sumbu Y, yaitu absis(p) = 0 }

isEqual : 2 Point → boolean
{ isEqual(p1,p2) mengembalikan nilai benar jika titik p1 sama dengan titik p2 }

### DEFINISI DAN SPESIFIKASI OPERATOR
translasiSbY : Point, integer → Point
{ translasiSbY(p,n) mengembalikan sebuah titik hasil translasi titik p, searah sumbu Y, sejauh n }

jarak : 2 Point → real
{ jarak(p1,p2) mengembalikan sebuah nilai real, merupakan jarak antara titik p1 dan p2 }

---

## REALISASI FUNGSIONAL (4 FUNGSI TAMBAHAN)

### isOnSbY
isOnSbY(p) :
    absis(p) = 0

### isEqual
isEqual(p1,p2) :
    absis(p1) = absis(p2) and ordinat(p1) = ordinat(p2)

### translasiSbY
translasiSbY(p,n) :
    makePoint(absis(p), ordinat(p) + n)

### jarak
jarak(p1,p2) :
    sqrt( (absis(p1) - absis(p2))^2 + (ordinat(p1) - ordinat(p2))^2 )

---

## REALISASI HASKELL

### Definisi type
```haskell
data Point = Point { x :: Int, y :: Int } deriving Show
```

### Selektor
```haskell
absis :: Point -> Int
absis point = x point

ordinat :: Point -> Int
ordinat point = y point
```

### Konstruktor
```haskell
makePoint :: Int -> Int -> Point
makePoint x y = Point { x = x, y = y }
```

### Predikat
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

isOnSbY :: Point -> Bool
isOnSbY p = absis p == 0

isEqual :: Point -> Point -> Bool
isEqual p1 p2 = absis p1 == absis p2 && ordinat p1 == ordinat p2
```

### Operator
```haskell
translasiSbY :: Point -> Int -> Point
translasiSbY p n = makePoint (absis p) (ordinat p + n)

jarak :: Point -> Point -> Double
jarak p1 p2 = sqrt (dx * dx + dy * dy)
  where
    dx = fromIntegral (absis p1 - absis p2)
    dy = fromIntegral (ordinat p1 - ordinat p2)
```

---

## APLIKASI

### isOnSbY
⇒ (isOnSbY (makePoint 10 1))
False
⇒ (isOnSbY (makePoint 8 1))
False
⇒ (isOnSbY (makePoint 0 5))
True
⇒ (isOnSbY (makePoint 0 2))
True

### isEqual
⇒ (isEqual (makePoint 10 1) (makePoint 8 1))
False
⇒ (isEqual (makePoint 3 3) (makePoint 3 3))
True

### translasiSbY
⇒ (translasiSbY (makePoint 10 1) 1)
Point {x = 10, y = 2}
⇒ (translasiSbY (makePoint 8 1) 1)
Point {x = 8, y = 2}
⇒ (translasiSbY (makePoint 0 5) (-2))
Point {x = 0, y = 3}

### jarak
⇒ (jarak (makePoint 10 1) (makePoint 8 1))
2.0
⇒ (jarak (makePoint 0 5) (makePoint 3 9))
5.0
⇒ (jarak (makePoint 3 3) (makePoint 3 3))
0.0

---

## APLIKASI isOrigin DAN kuadran

⇒ (isOrigin (makePoint 2 (-2)))
False
⇒ (isOrigin (makePoint 2 2))
False
⇒ (isOrigin (makePoint 0 0))
True
⇒ (isOrigin (makePoint (-2) (-2)))
False
⇒ (isOrigin (makePoint (-2) 2))
False

⇒ (kuadran (makePoint 2 (-2)))
4
⇒ (kuadran (makePoint 2 2))
1
⇒ (kuadran (makePoint 0 0))
Lainnya
⇒ (kuadran (makePoint (-2) (-2)))
3
⇒ (kuadran (makePoint (-2) 2))
2

## ANALISIS TAHAPAN

1. **Definisi type**: titik pada koordinat kartesius dimodelkan sebagai pasangan `<x, y>` bertipe integer, direalisasikan di Haskell dengan `data Point = Point { x :: Int, y :: Int }`.
2. **Selektor**: `absis` dan `ordinat` mengambil komponen dari sebuah Point. Fungsi lain mengakses komponen lewat selektor ini.
3. **Konstruktor**: `makePoint` membentuk Point dari dua integer. Semua Point dalam program dibuat lewat konstruktor ini.
4. **Predikat**: `isOrigin`, `isOnSbY`, dan `isEqual` mengembalikan nilai boolean untuk memeriksa sifat sebuah titik atau hubungan dua titik. `kuadran` mengembalikan string yang menunjukkan lokasi titik.
5. **Operator**: `translasiSbY` menghasilkan Point baru hasil translasi, dan `jarak` menghasilkan nilai real.
6. **Realisasi dan aplikasi**: setiap spesifikasi diterjemahkan ke Haskell dengan tipe yang sesuai, lalu diuji dengan beberapa kasus untuk memastikan hasilnya sesuai spesifikasi.

Pada `jarak`, selisih koordinat bertipe `Int` diubah ke `Double` dengan `fromIntegral` karena `sqrt` membutuhkan tipe pecahan.