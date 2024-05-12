-- 2 a.)
select S.city, I.color, C.cName, F.price
    from Sales F, Store S, Item I, Customer C
    where F.storeID = S.storeID and F.itemID = I.itemID 
    and F.custID = C.custID and S.state = 'CA' 
    and I.category = 'Tshirt' and C.age < 22 and F.price < 25;
    
-- 2 b.)
select storeID, cName, sum(price)
from Sales s, Customer c
where s.custID=c.custID
group by storeID, cName;

-- 2 c.)
select storeID, i.category, cName, sum(price)
from Sales s, Customer c, Item i
where s.custID=c.custID and s.itemID=i.itemID
group by storeID, i.category, cName;

-- 2 d.)
select s.storeID, i.category, cName, sum(price)
from Sales s, Customer c, Item i, Store t
where s.custID=c.custID and s.itemID=i.itemID
and s.storeID=t.storeID and t.storeId ='store6'
group by storeID, i.category, cName;

-- 2 e.)
select s.storeID, i.category, cName, sum(price)
from Sales s, Customer c, Item i, Store t
where s.custID=c.custID and s.itemID=i.itemID
and s.storeID=t.storeID and t.storeId ='store6' and i.category='Jacket'
group by storeID, i.category, cName;

-- 2 f.)
select i.category, sum(price)
from Sales s, Customer c, Item i, Store t
where s.custID=c.custID and s.itemID=i.itemID and s.storeID=t.storeID
group by i.category;

-- 2 g.)
select state, county, city, sum(price)
from Sales F, Store S
where F.storeID = S.storeID
group by state, county, city;

-- 2 h.)
select state, county, city, sum(price)
from Sales F, Store S
where F.storeID = S.storeID
group by state, county, city with rollup;

-- 3.a)
SELECT S.state, C.age, SUM(F.price) AS total_sales
FROM Sales F
JOIN Store S ON F.storeID = S.storeID
JOIN Customer C ON F.custID = C.custID
GROUP BY S.state, C.age;

-- 3.b) 
SELECT S.state, C.age, I.color, SUM(F.price) AS total_sales
FROM Sales F
JOIN Store S ON F.storeID = S.storeID
JOIN Customer C ON F.custID = C.custID
JOIN Item I ON F.itemID = I.itemID
GROUP BY S.state, C.age, I.color;

-- 3.c)
SELECT IFNULL(S.state, 'Total') AS state,
       IFNULL(C.age, 'Total') AS age,
       IFNULL(I.color, 'Total') AS color,
       SUM(F.price) AS total_sales
FROM Sales F
JOIN Store S ON F.storeID = S.storeID
JOIN Customer C ON F.custID = C.custID
JOIN Item I ON F.itemID = I.itemID
GROUP BY S.state, C.age, I.color WITH ROLLUP;

-- 3.d)
SELECT S.state, C.age, I.color, SUM(F.price) AS total_sales
FROM Sales F
JOIN Store S ON F.storeID = S.storeID
JOIN Customer C ON F.custID = C.custID
JOIN Item I ON F.itemID = I.itemID
WHERE I.color = 'blue'
GROUP BY S.state, C.age, I.color;

-- 3.e)
SELECT IFNULL(C.age, 'Total') AS age,
       IFNULL(I.color, 'Total') AS color,
       SUM(F.price) AS total_sales
FROM Sales F
JOIN Customer C ON F.custID = C.custID
JOIN Item I ON F.itemID = I.itemID
GROUP BY C.age, I.color WITH ROLLUP;





