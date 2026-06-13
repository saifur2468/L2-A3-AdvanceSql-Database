create database football_booking;

-- create user table
 
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) CHECK (role IN ('Ticket Manager', 'Football Fan')) NOT NULL,
    phone_number VARCHAR(20)
);

-- create match table


CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    fixture VARCHAR(150) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price DECIMAL(10,2) NOT NULL CHECK (base_ticket_price >= 0),

    match_status VARCHAR(50) NOT NULL CHECK (
        match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed')
    )
);

-- create booking table 
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
  user_id INT NOT NULL,
    match_id INT NOT NULL,
  seat_number VARCHAR(20),
    payment_status VARCHAR(50) CHECK (
       payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
    ),

    total_cost DECIMAL(10,2) NOT NULL CHECK (total_cost >= 0),

    
    FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (match_id)
        REFERENCES Matches(match_id)
        ON DELETE CASCADE
);


-- user table data insert 

INSERT INTO Users (user_id, full_name, email, role, phone_number)
VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);



-- matches table data insert 
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status)
VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80, 'Available');


-- bookings table data insert 
INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost)
VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150),
(502, 1, 102, 'B-04', 'Confirmed', 120),
(503, 2, 101, 'A-13', 'Confirmed', 150),
(504, 2, 101, NULL, NULL, 150),
(505, 3, 102, 'C-20', 'Pending', 120);


-- Champions League Available matches

SELECT match_id, fixture, base_ticket_price
FROM Matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';


-- query 2 
select user_id,full_name,email
from users
where full_name ilike 'Tanvir%'
or full_name ilike '%Haque%';

-- query 3

select booking_id,user_id,match_id,
coalesce(payment_status ,'action Required') as systematic_status
FROM Bookings
WHERE payment_status IS NULL; 


-- query4

SELECT
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Matches m ON b.match_id = m.match_id;


-- query 5 
SELECT
  u.user_id,
  u.full_name,
b.booking_id
    
    
from users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
ORDER BY u.user_id;



--  query 6 
select booking_id,match_id,total_cost
from bookings
where total_cost > (
  select avg(total_cost)
  from bookings
)

-- query7

SELECT match_id, fixture, base_ticket_price
FROM Matches
ORDER BY base_ticket_price DESC
OFFSET 1
LIMIT 2;

