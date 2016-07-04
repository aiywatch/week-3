SELECT isbn
FROM editions JOIN publishers 
ON publisher_id = publishers.id
WHERE publishers.name = 'Random House'

ex 2
SELECT isbn, title
FROM editions JOIN publishers 
ON publisher_id = publishers.id
JOIN books ON book_id = books.id
WHERE publishers.name = 'Random House'

ex3
SELECT editions.isbn, title, stock, cost
FROM editions JOIN publishers 
ON publisher_id = publishers.id
JOIN books ON book_id = books.id
JOIN stock ON editions.isbn=stock.isbn
WHERE publishers.name = 'Random House'

ex4
SELECT editions.isbn, title, stock, cost
FROM editions JOIN publishers 
ON publisher_id = publishers.id
JOIN books ON book_id = books.id
JOIN stock ON editions.isbn=stock.isbn
WHERE publishers.name = 'Random House'
AND stock != 0

ex5
SELECT editions.isbn, title, stock, cost, CASE
WHEN type = 'h' THEN 'hardcover'
WHEN type = 'p' THEN 'paperback'
END
FROM editions JOIN publishers 
ON publisher_id = publishers.id
JOIN books ON book_id = books.id
JOIN stock ON editions.isbn=stock.isbn
WHERE publishers.name = 'Random House'
AND stock != 0

ex 6
SELECT books.title, editions.publication
FROM books LEFT JOIN editions 
ON editions.book_id = books.id

EX7
SELECT SUM(stock) FROM stock

EX8
SELECT AVG(cost), AVG(retail), AVG(retail-cost)
FROM stock

ex9
SELECT books.id, stock
FROM books JOIN editions ON book_id = books.id
JOIN stock ON editions.isbn = stock.isbn
ORDER BY stock DESC LIMIT 1

ex10
SELECT a.id, 
(a.first_name || ' ' || a.last_name) AS "full name", 
COUNT(BOOKS.ID) AS "number of books"
FROM authors a LEFT OUTER JOIN books ON author_id = a.id
GROUP BY a.id

ex11
SELECT books.title
FROM books JOIN editions e1 ON books.id = e1.book_id
JOIN editions e2 ON books.id = e2.book_id
WHERE e1.type = 'p' and e2.type = 'h'

ex12
SELECT books.title
FROM books
JOIN editions e1 ON e1.book_id = books.id
JOIN editions e2 ON e2.book_id = books.id
WHERE e1.type = 'p' AND e2.type = 'h'

ex13
SELECT publishers.name, 
ROUND(AVG(retail),2) AS "AVG sell price",
COUNT(stock.isbn)
FROM editions 
JOIN publishers ON publishers.id = publisher_id
JOIN stock ON editions.isbn = stock.isbn
GROUP BY publishers.name
