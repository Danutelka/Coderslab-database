<img alt="Logo" src="http://coderslab.pl/svg/logo-coderslab.svg" width="400">

##  Tworzenie bazy danych i tabel

### Zadanie 1 &ndash; zadania rozwiązywane z wykładowcą
Stwórz nową bazę danych o nazwie ```exercises_db```.
Następnie napisz funkcję, która stworzy i zwróci połączenie do tej bazy danych.

### Zadanie 2 &ndash; zadania rozwiązywane z wykładowcą
W bazie danych o nazwie ```exercises_db``` stwórz następujące tabele:
* Product:
  * id: serial
  * name: string
  * description: string
  * price: float(5,2)
* Order:
  * id:serial
  * description: string
* Client:
  * id: int
  * name: string
  * surname: string

---

### Zadanie 3.
Stwórz nową bazę danych o nazwie ```cinemas_db```. Kod SQL zapisz jako komentarz w pliku **A3.sql**.
Następnie, w pliku **A3.py**, napisz funkcję, która stworzy połączenie do tej bazy danych.

### Zadanie 4.
W bazie danych o nazwie ```cinemas_db``` stwórz następujące tabele (pamietaj o tym, że wszystkie nazwy powinny być zapisane w języku angielskim):

* Cinema:
  * id: serial
  * name: string
  * address: string
* Movie:
  * id: serial
  * name: string
  * description: string
* Ticket:
  * id: serial
  * quantity: int
  * price: float
* Payment:
  * id: serial
  * type: string
  * date: date

1. Załóż odpowiednie atrybuty na pola (np. każde **id** powinno być kluczem głównym, być automatycznie numerowane).
2. Napisz odpowiednie zapytania SQL.
3. W pliku **A4.py** napisz program, który będzie tworzył bazę danych (pamiętaj o stworzeniu i zamknięciu połączenia). **UWAGA:** pamiętaj, że jeżeli tabela już istnieje, to nie da się jej stworzyć ponownie. Aby stworzyć ją ponownie, trzeba ją najpierw usunąć.
4. Dokładnie czytaj kody błędów zwracane przez bazę danych.
