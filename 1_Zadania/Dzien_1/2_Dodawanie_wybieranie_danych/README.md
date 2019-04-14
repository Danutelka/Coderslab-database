<img alt="Logo" src="http://coderslab.pl/svg/logo-coderslab.svg" width="400">

# Podstawowa praca z SQL - dodawanie i wybieranie danych

### Zadanie 1 &ndash; zadania rozwiązywane z wykładowcą
Napisz zapytania SQL, żeby wypełnić każdą tabelę w bazie danych o nazwie ```exercises_db``` co najmniej kilkoma wpisami. 
Napisz funkcję, która przyjmie słownik z odpowiednimi parametrami i będzie dodawała nowe produkty do bazy danych.

### Zadanie 2 &ndash; zadania rozwiązywane z wykładowcą
Używając Flaska, napisz program, który wyświetli na stronie wszystkie produkty znajdujące się w bazie danych o nazwie ```exercises_db```.

**Podpowiedź:** Program powinien uruchamiać zapytanie SQL, które wybiera wszystkie wpisy z odpowiedniej tabeli, po czym wyświetla je na ekranie.

---

### Zadanie 3.
Napisz zapytania SQL, które:
1. Dodawanie:
* dodadzą 4 nowe filmy,
* dodadzą po jednym bilecie do każdego filmu.

2. Wybieranie:
* Wybiorą wszystkie filmy na literę W,
* wybiorą wszystkie bilety, których cena jest większa niż 15.30,
* wybiorą wszystkie bilety, których ilość (liczba) jest większa niż trzy.

### Zadanie 4.
Napisz zapytania SQL, żeby wypełnić każdą tabelę w bazie danych o nazwie `cinemas_db` co najmniej kilkoma wpisami 
(dodaj je jako komentarz na górze pliku Pythona).

1. W pliku **B4.html** jest formularz służący do tworzenia nowych wpisów w tablicach. Przeanalizuj HTML i użyj tego kodu w dalszej części zadania.
2. Używając Flaska, napisz program, który będzie wkładał przesyłane informacje do odpowiedniej tabeli w bazie danych. 

Przeprowadź też dodatkową walidację danych:

* Dla Filmu rating musi być w zakresie od 0 do 10.

Sprawdź, czy tabela zawierająca dane o filmach ma wszystkie potrzebne Ci pola. Jeśli nie – zmodyfikuj ją. 