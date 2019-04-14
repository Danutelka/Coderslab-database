<img alt="Logo" src="http://coderslab.pl/svg/logo-coderslab.svg" width="400">

# Relacje pomiędzy tabelami, relacja 1-1

**Uwaga: Jeśli w poleceniu widnieje "napisz stronę", oznacza to, że należy
napisać program w Pythonie, używając Flaska, który będzie się komunikował z 
użytkownikiem za pomocą stron WWW i protokołu HTTP.**

### Zadanie 1 &ndash; zadania rozwiązywane z wykładowcą
Stwórz nową tabelę ```UserAddress``` zawierającą:
* city: string
* street: string
* house_nr: string

Tabela ```UserAddress``` ma być połączona relacją jeden do jednego z tabelą 
```Users```. Napisz kilka zapytań SQL, które wprowadzą adresy dla istniejących 
już użytkowników.

---

### Zadanie 2 &ndash; import bazy danych
Jeżeli nie masz bazy danych z wczoraj albo masz ją niekompletną, to usuń ją i 
stwórz nową bazę danych o nazwie ```cinema_db```. Następnie zaimportuj do niej 
dane z pliku **kino.sql**. Są to tabele powypełniane dużą ilością danych. 
Takie jak wczoraj, brakuje tylko tabeli płatności.

### Zadanie 3.
Stwórz tabelę do płatności. Ma mieć takie same dane jak w zadaniach z 
poprzedniego dnia, ale z tabelą `Bilety` ma być powiązana relacją jeden do 
jednego (wpłynie to na kolumnę **id**). Relacja między biletem a płatnością 
jest następująca: bilet ma 1 lub 0 płatności (jest wtedy nieopłacony) &ndash; 
płatność musi być przypisana do biletu.

Używając Flaska, napisz stronę, na której można kupić bilet i wybrać sposób 
płatności (może go nie być). Następnie napisz stronę, na której możemy pokazać 
wszystkie bilety opłacona za pomocą:

* karty,
* gotówki,
* przelewu,
* nieopłacone (czyli takie, które nie mają płatności w systemie).

Najpierw przetestuj zapytania SQL w konsoli lub panelu administracyjnym, 
dopiero potem napisz kod Pythona.
