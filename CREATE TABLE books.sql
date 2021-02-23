CREATE TABLE books (
  isbn INTEGER NOT NULL UNIQUE,
  title VARCHAR(150) NOT NULL,
  pub_date DATE NOT NULL,

  PRIMARY KEY(isbn)
);

CREATE TABLE authors(
  author_id INTEGER NOT NULL UNIQUE,
  author_name CHAR(15) NOT NULL, 
  book_isbn INTEGER NOT NULL,

  PRIMARY KEY(author_id),
  FOREIGN KEY (book_isbn) REFERENCES books(isbn)
);
CREATE TABLE publishers(
  publisher_id INTEGER NOT NULL UNIQUE,
  publisher_name VARCHAR(150) NOT NULL, 
  book_isbn INTEGER NOT NULL,

  PRIMARY KEY(publisher_id),
  FOREIGN KEY (book_isbn) REFERENCES books(isbn)
);
CREATE TABLE users(
  user_id INTEGER NOT NULL UNIQUE,
  user_name CHAR(15) NOT NULL, 
  book_isbn INTEGER NOT NULL, 
  
  PRIMARY KEY(user_id),
  FOREIGN KEY (book_isbn) REFERENCES books(isbn)
);

CREATE TABLE reserve(
  reserve_id INTEGER NOT NULL UNIQUE, 
  user_id INTEGER NOT NULL,
  book_isbn INTEGER NOT NULL,
  reserve_date DATE,
  delivery_date DATE,  

  PRIMARY KEY(reserve_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (book_isbn) REFERENCES books(isbn)
);



// BOOTSTARP

# BOOKS 
insert into books(isbn, title, pub_date) values (197868, 'A Simple Love - The Meeting', "2020-03-21");
insert into books(isbn, title, pub_date) values (277353, 'A Simple Love - The New Girl', "2020-07-10");
insert into books(isbn, title, pub_date) values (298547, 'NOX: A Fox VS A Rock',  "2021-01-07");
insert into books(isbn, title, pub_date) values (123193, 'SKANYA: A Conection', "2021-02-10");


# authors
insert into authors(author_id, author_name, book_isbn) values (1, 'FSK', 197868);
insert into authors(author_id, author_name, book_isbn) values (2, 'FSK', 277353);
insert into authors(author_id, author_name, book_isbn) values (3, 'NOX', 298547);
insert into authors(author_id, author_name, book_isbn) values (4, 'Nina N.', 123193);


# publishers

insert into publishers(publisher_id, publisher_name, book_isbn) values (01, 'FSK Lighnovels, Ltda', 197868);
insert into publishers(publisher_id, publisher_name, book_isbn) values (02, "Code and Paper", 277353);
insert into publishers(publisher_id, publisher_name, book_isbn) values (03, 'NOX Papeis, Inc', 298547);



SELECT DISTINCT a.author_name 
FROM books as b, authors as a
WHERE a.book_isbn = 197868 AND b.isbn = 197868;

SELECT DISTINCT b.title 
FROM books as b, authors as a
WHERE a.author_name="FSK" AND a.book_isbn = b.isbn;

SELECT COUNT(*)
FROM books as b, authors as a
WHERE a.author_name="FSK" AND a.book_isbn = b.isbn;


SELECT DISTINCT p.publisher_name 
FROM publishers as p, books as b
WHERE b.title="NOX: A Fox VS A Rock" AND b.isbn = p.book_isbn;

SELECT DISTINCT u.user_name 
FROM users as u, books as b, reserve as r
WHERE r.reserve_date < "2020-02-02";