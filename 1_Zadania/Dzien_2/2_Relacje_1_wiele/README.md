<img alt="Logo" src="http://coderslab.pl/svg/logo-coderslab.svg" width="400">

##  Relacje pomiędzy tabelami, relacja 1-wiele

**Uwaga: Jeśli w poleceniu widnieje "napisz stronę", oznacza to, że należy
napisać program w Pythonie, używając Flaska, który będzie się komunikował z 
użytkownikiem za pomocą stron WWW i protokołu HTTP.**

### Zadanie 1 &ndash; zadania rozwiązywane z wykładowcą
Stwórz nową tabelę ```Opinions``` zawierającą:
* description: string

Tabela ```Opinions``` ma być połączona z tabelą ```Products``` relacją jeden 
do wielu (produkt ma wiele opinii, opinia jest przypisana do jednego produktu).

Napisz kilka zapytań, które dodadzą opinie do istniejących produktów. Napisz 
zapytania, które wyciągną z bazy danych opinie dotyczące produktu.

---

### Zadanie 2.
Połącz tabele `Seanse` i `Bilety` za pomocą relacji wiele do jednego (na 
seans może być sprzedanych wiele biletów, jeden bilet może być tylko na jeden 
seans).

Napisz stronę, na której możemy kupić bilet na wybrany seans. Seanse mają być 
wybierane z listy drop-down (użyj do tego tagu ```<select>```). W tym celu 
wczytaj z bazy danych wszystkie dostępne seanse i pętlą **for** wygeneruj 
```option``` do formularza.  

Napisz stronę, na której wyświetlamy dane z biletu (**ID** seansu, nazwa 
filmu, nazwa kina, cena biletu).

Najpierw przetestuj zapytania SQL w konsoli lub panelu administracyjnym, 
a następnie napisz kod Pythona.

Strony twórz używając Flaska.
