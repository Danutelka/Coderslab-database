<img alt="Logo" src="http://coderslab.pl/svg/logo-coderslab.svg" width="400">

# Python i bazy danych &ndash; praca domowa &ndash; Dzień 2

* zobaczyć wszystkie filmy (w stronie filmu zobaczyć opis, rating + listę kin, która go wyświetla),
* zobaczyć wszystkie kina (na stronie kina wypisz wszystkie filmy + seanse w tym kinie),
* kupić bilet na dany seans,
* zapłacić za bilet.
* Stwórz panel administracyjny dla sieci kin. Powinna w nim być możliwość dodawania kin, filmów, seansów, zarządzania biletami (sprawdzanie płatności itp).

----

### Zadanie: poćwicz SQL (*)

W repozytorium z zadaniami domowymi znajdziesz zrzut bazy danych **football.sql**. Jest to baza danych z wynikami Ligi Okręgowej Warszawa II w sezonie 2016/17 (wyniki na dzień 14 listopada 2016 roku).

Utwórz na serwerze bazę danych i zaimportuj plik SQL. Jeśli nie wiesz, jak to zrobić, poszukaj w Google, używając słów kluczowych: *PostgreSQL, import, dump*.

Przyjrzyj się strukturze i danym. Znajdują się tam dwie tabele: **Teams** i **Games**. Pierwsza z nich to lista klubów piłkarskich i punkty zdobyte do dnia eksportu bazy danych. Druga tabela to wyniki gier. Pola `team_home` i `team_away` to klucze obce do tabeli **Teams**

Napisz zapytania, które:

1. Wyciągną klub, który jest liderem tabeli,
2. Wyciągną tabelę, posortowaną według liczby zdobytych punktów,
3. Wyciągną wszystkie mecze, które Naprzód Brwinów grał u siebie,
4. Wyciągną wszystkie mecze, które Naprzód Brwinów grał na wyjeździe,
5. Wyciągną wszystkie mecze (u siebie i na wyjeździe) klubu Naprzód Brwinów. 
6. Zsumują wszystkie gole zdobyte przez klub Naprzód Brwinów u siebie i na wyjeździe (zrób dwa zapytania: osobno u siebie, osobno na wyjeździe).

W podpunktach 3 - 5 wynik ma zawierać kolejno: 

* nazwę klubu gospodarzy,
* nazwę klubu gości,
* liczbę goli strzelonych przez gospodarzy,
* liczbę goli strzelonych przez gości.  
