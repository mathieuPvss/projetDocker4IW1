CREATE DATABASE db;
\c db;

CREATE TABLE article (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255),
    author VARCHAR(100),
    content TEXT
);

INSERT INTO article (titre, author, content) VALUES
    ('Premier article', 'John Doe', 'Contenu de l''article 1.'),
    ('Deuxième article', 'Jane Doe', 'Contenu de l''article 2.'),
    ('Troisième article', 'Alice Smith', 'Contenu de l''article 3.'),
    ('Quatrième article', 'Bob Johnson', 'Contenu de l''article 4.'),
    ('Cinquième article', 'Eva Brown', 'Contenu de l''article 5.'),
    ('Sixième article', 'Charlie White', 'Contenu de l''article 6.'),
    ('Septième article', 'Grace Davis', 'Contenu de l''article 7.'),
    ('Huitième article', 'Mike Miller', 'Contenu de l''article 8.'),
    ('Neuvième article', 'Sophie Wilson', 'Contenu de l''article 9.'),
    ('Dixième article', 'David Jones', 'Contenu de l''article 10.');
