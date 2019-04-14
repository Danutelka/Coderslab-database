<img alt="Logo" src="http://coderslab.pl/svg/logo-coderslab.svg" width="400">

##  Relacje pomiędzy tabelami, relacja wiele-wiele

**Uwaga: Jeśli w poleceniu widnieje "napisz stronę", oznacza to, że należy
napisać program w Pythonie, używając Flaska, który będzie się komunikował z 
użytkownikiem za pomocą stron WWW i protokołu HTTP.**

### Zadanie 1 &ndash; zadania rozwiązywane z wykładowcą
Stwórz nową tabelę ```Opinions``` zawierającą:
* description: string

Tabela ```Opinions``` ma być połączona z tabelą ```Products``` relacją jeden 
do wielu (produkt ma wiele opinii, opinia jest przypisana do jednego produktu).

Napisz kilka zapytań, które dodadzą opinie do istniejących produktów. Napisz 
zapytania, które wyciągną opinie dotyczące produktu.

### Zadanie 2 &ndash; zadania rozwiązywane z wykładowcą
Połącz tabele ```Products``` i ```Orders``` relacją wiele do wielu. Napisz 
kilka zapytań, które połączą produkty z zamówieniami.

Napisz stronę, na której będą widoczne:
* wszystkie zamówienia,
* wszystkie produkty należące do zamówienia (pod spodem).

Napisz stronę, na której będą widoczne:
* wszystkie produkty,
* zamówienia, w których ten produkt się pojawił (pod spodem).

---

### Zadanie 3 &ndash; relacja wiele do wielu

Połącz tabele `Kina` i `Filmy` poprzez relację wiele do wielu (film może być 
wyświetlany w wielu kinach, kino może mieć wiele filmów).

Dodatkowo stworzoną tabelę nazwij `Seans`.

Następnie:

* Napisz stronę, na której można stworzyć nowy seans.
* Napisz stronę, na której można wybrać wszystkie kina mające w repertuarze dany film.
* Napisz stronę, na której wypisane są wszystkie filmy wyświetlane w danym kinie.

Pamiętaj, żeby najpierw przetestować zapytania SQL w konsoli lub aplikacji, dopiero potem pisać kod Pythona.
