<img alt="Logo" src="http://coderslab.pl/svg/logo-coderslab.svg" width="400">

# PostgreSQL - Snippety
> Krótkie kawałki kodu, które pokazują zależności, rozwiązują popularne problemy oraz pokazują jak używać niektórych funkcji.


#### 1. Jak połączyć się z bazą danych w Pythonie?

```python
from psycopg2 import connect

cnx = connect(user=<login>, 
              password=<hasło>,
              host=<ip-serwera>, 
              database=<nazwa-bazy>
             )
```

#### 2. Jak z konsoli połączyć się z bazą danych?

```SQL
psql -h hostname -U username -W -d databasename
```

Możemy także samodzielnie przełączyć się na bazę danych: 
```SQL
\c dbName
```
Aby sprawdzić liczbę tabel w bazie:
```SQL
\dt
```

#### 3. Jak usunąć wszystko rekordy z tabeli?

```SQL
DELETE FROM tableName;
```

#### 4. Jak pobrać szczegółowe informacje (klucze itp.) z pobranych rekordów?

Dodajemy do naszego zapytania na początku `EXPLAIN` np.  
```SQL
\d tableName 
```

#### 5. Jak obliczyć ilość rekordów w tabeli?

```SQL
SELECT COUNT(anyColumnName) as count FROM tableName;
```

#### 6. Jaki zakres danych przechowuje typ `varchar`?

W najnowszych wersjach MySQL `varchar` może przyjąć `65.535` znaków. Różnica występuje w zajętości pamięci przez rekord, w przypadku jeśli typ to maksymalnie `varchar(255)` długość pola zajmuje 1 bajt, w przypadku dowolnie dłuższej wielkości pola np. `varchar(1500)` długość będzie zajmować 2 bajty.

#### 7. Czy można przechowywać liczby jako `text`?

Tak, ale nie należy tego robić, typy danych dla liczb np. `int` działają dużo szybciej w przypadku sortowania i pobierania danych.

#### 8. Jakiego typu danych użyć do przechowania ceny?

**Zdecydowanie** `numeric` ponieważ przechowuje on dokładną wartość i nie wynikną problemy w przypadku operacji arytmetycznych.
Definicja `numeric(6,2)` oznacza, iż liczba w sumie (przed i po przecinku) ma mieć `6` cyfr, a tylko po przecinku `2`.


#### 9. Jak wykonać backup bazy danych?

**Backup pojedynczej bazy danych**
```Shell
pg_dump -U postgres -h 127.0.0.1 db > db_dump.sql 
```
Syntax
```Shell
pg_dump -U [user_name] -h [host] database > [file].sql 
```

#### 10. Jak przywrócić backup bazy danych?
```Shell
psql -U postgres -f db_dump.sql -h 127.0.0.1 db
```
Syntax
```Shell
psql -U [user_name] -f [file_name] -h [host] database_name
```

#### 11. Jak wygenerować kod `sql` tworzący tabele? (bez zawartości)

```SQL
pg_dump -s database 
```

Oczywiście musisz również podac przełączniki, definiujące użytkownika, serwer, itp.

#### 12. Jak masowo zamienić string we wszystkich rekordach w kolumnie?

```SQL
UPDATE   TABLE
SET      COLUMN = REPLACE(COLUMN, search_string, replace_string)
WHERE    COLUMN LIKE '%search_string%'
```
np.
```SQL
UPDATE   TableName
SET      PDF_NAME = REPLACE(PDF_NAME, '+', '_')
WHERE    PDF_NAME LIKE '%+%'
```

#### 13. Jak w `where` dodać warunek `x dni` temu?

```SQL
WHERE my_date >= CURRENT_TIMESTAMP - INTERVAL '5 days';
```


#### 14. Jak usunąć rekordy o zduplikowanej wartości wybranej kolumny, pozostawiając jeden rekord z daną wartością?

Założenie, nasza tabela wygląda następująco:
```SQL
+----+--------+
| id | name   |
+----+--------+
| 1  | google |
| 2  | yahoo  |
| 3  | msn    |
| 4  | google | <-- duplikat
| 5  | google | <-- duplikat
| 6  | yahoo  | <-- duplikat
+----+--------+
```

Chcemy osiągnąć:
```SQL
+----+--------+
| id | name   |
+----+--------+
| 1  | google |
| 2  | yahoo  |
| 3  | msn    |
+----+--------+
```

Wykonujemy zapytanie:
```SQL
DELETE n1 FROM names n1, names n2 WHERE n1.id > n2.id AND n1.name = n2.name
```

Gdzie:
```
n1, n2 - aliasy tej samej tabeli
n1.name = n2.name - porównanie wartości rekordów czy są takie same, name to nazwa kolumny, w której szukamy duplikatów
n1.id > n2.id - usuwa rekordy, pozostawiając pojedynczy rekord z najniższym id
```

#### 15. Jak pobierać unikalny rekord?

Jeśli chcemy sprawdzić czy istnieje w naszej tabeli jakikolwiek `user` gdzie `city` to `Warsaw`
Zamiast
```SQL
SELECT * FROM user WHERE city = 'Warsaw';
```
Wydajniej zadziała
```SQL
SELECT * FROM user WHERE city = 'Warsaw' LIMIT 1;
```

`LIMIT 1` spowoduje zatrzymanie dalszego przeszukiwania tabeli po znalezieniu pierwszego rekordu spełniającego warunek `WHERE`.

#### 16. Jak wykonywać zapytania na kolumnach tekstowych z indexem?
 
 Jeśli dodaliśmy indeks do kolumny tekstowej, indeks zostanie użyty jedynie jeśli w zapytaniu `LIKE` na początku wzorca nie znajdzie się znak dowolnego znaku czyli `%`.
 
 Nie użyje indeksu:
```SQL
SELECT * FROM user WHERE city LIKE '%War%';
```
Użyje indeksu:
```SQL
SELECT * FROM user WHERE city LIKE 'War%';
```

#### 17. Czy istnieje różnica przy użyciu `varchar(10)` a `text` dla stringów mających max. 10 znaków?

Tak, zawsze używaj najmniejszego możliwego zakresu danych, w których mieści się zakładana wartość.  
Mniejszy zakres to mniej użytej pamięci jak również szybsze wyszukiwanie.

#### 18. Jak prawidłowo pobierać dane z tabel?

Jeśli to możliwe, nie pobierajmy wszystkich kolumn z tabeli a więc zamiast:
```SQL
SELECT * FROM users
```
użyj
```SQL
SELECT col1, col2, col3 FROM users
```

Dzięki temu przesłane będzie mniej danych, co zoptymalizuje szybkość działania.

#### 19. Jak przechować adres IP użytkownika w bazie danych?
 
 Adres IP składa się minimalnie z 7 znaków `1.1.1.1` a maksymalnie z 15 znaków `192.168.154.199`.  
 Pierwszym typem, który przychodzi na myśl do użycia w kolumnie jest `varchar`.  
 Lepszym rozwiązaniem będzie tutaj użycie typu `inet`.
