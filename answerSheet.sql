Joins

1. select * from invoice i
join invoice_line il on il.invoice_id = i.invoice_id
where il.unit_price > 0.99;

2. select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
join customer c on i.customer_id = c.customer_id;

3. select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e on c.support_rep_id = e.employee_id;

4. select a.name, al.title from album al
join artist a on a.artist_id = al.artist_id;

5. select pl.track_id from playlist_track pl
join playlist p on p.playlist_id = pl.playlist_id
where p.name = 'Music';

6. select t.name from track t
join playlist_track p on p.track_id = t.track_id
where p.playlist_id = 5;

7. select t.name, p.name from track t
join playlist_track pl on t.track_id = pl.track_id
join playlist p on pl.playlist_id = p.playlist_id;

8. select t.name, a.title from track t
join album a on t.album_id = a.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'Alternative & Punk';

Nested Queries

1. select * from invoice
where invoice_id in (select invoice_id from invoice_line where unit_price > 0.99);

2. select * from playlist_track
where playlist_id in (select playlist_id from playlist where name = 'Music');

3. select name from track
where track_id in (select track_id from playlist_track where playlist_id = 5);

4. select * from track
where genre_id in (select genre_id from genre where name = 'Comedy');

5. select * from track
where album_id in (select album_id from album where title = 'Fireball');

6. select * from track
where album_id in (select album_id from album where artist_id in (select artist_id from artist where name = 'Queen'));

Updating Rows

1. update customer
set fax = null
where fax is not null;

2. update customer
set company = 'Self'
where company is null;

3. update customer 
set last_name = 'Thompson' 
where first_name = 'Julia' and last_name = 'Barnett';

4. update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

5. update track
set composer = 'The darkness around us'
where genre_id = (select genre_id from genre where name = 'Metal') and composer is null;

Group By

1. select count(*), g.name from track t
join genre g on t.genre_id = g.genre_id
group by g.name;

2. select count(*), g.name from track t
join genre g on g.genre_id = t.genre_id
where g.name = 'Pop' or g.name = 'Rock'
group by g.name;

3. select a.name, count(*) from album al
join artist a on a.artist_id = al.artist_id
group by a.name;

Distinct

1. select distinct composer from track;

2. select distinct billing_postal_code from invoice;

3. select distinct company from customer;

Delete Rows 

2. delete from practice_delete where type = 'bronze';

3. delete from practice_delete where type = 'silver';

4. delete from prectice_delete where value = 150;

E-Commerce

create table users (user_id serial primary key, name varchar(20), email varchar(30));

create table products (product_id serial primary key, name varchar(40), price numeric(9,2));

create table orders (order_id serial primary key, product_id int references products(product_id));

insert into users (name, email)
values ('Jim', 'jim@email.com'),('Sam', 'sam@email.com'),('Bob', 'bob@email.com');

insert into products (name, price)
values ('cheese wheel', 99.99), ('sandals', 61.99),('vacuum', 120.65);

insert into orders (product_id) values (1),(2),(3);

select * from orders where order_id = 1;

select * from orders;

select sum(price) from orders o join products p on p.product_id = o.product_id where order_id = 1;

alter table orders add column user_id int references users(user_id);

update orders set user_id = 3 where order_id = 1;

update orders set user_id = 2 where order_id = 3;

update orders set user_id = 1 where order_id = 2;

alter table orders add column qty int;

insert into orders (product_id, user_id, qty) values (3,3,4), (2,3,1), (1,1,7), (2,2,2), (3,2,5);