@runghc src\tipePoint.hs < test\input.txt > test\hasil.txt
@fc test\hasil.txt test\expected.txt && echo SEMUA COCOK
