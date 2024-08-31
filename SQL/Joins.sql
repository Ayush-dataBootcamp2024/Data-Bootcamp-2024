use sample_1;

show tables;

 
CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);
 
CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);
 
 
INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');
 
INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');


select * from members;

select * from committees;


-- INNER JOIN --
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c USING(name);
-- INNER JOIN committees c ON c.name = m.name;


-- LEFT JOIN --
SELECT
  m.member_id, 
  m.name AS member, 
  c.committee_id, 
  c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name)
-- LEFT JOIN committees c ON c.name = m.name;
WHERE c.committee_id is null;


SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    committees c
LEFT JOIN members m ON m.name=c.name;
-- where c.committee_id is null;


-- RIGHT JOIN --
SELECT
  m.member_id, 
  m.name AS member, 
  c.committee_id, 
  c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(name);
-- LEFT JOIN committees c ON c.name = m.name;






