create database booking_system;

-- create a Users Table

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('fan', 'admin', 'organizer')),
    phone_number VARCHAR(20)
);



-- create  matched table

CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    fixture VARCHAR(150) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price DECIMAL(10,2) NOT NULL CHECK (base_ticket_price >= 0),

match_status VARCHAR(50) NOT NULL CHECK (match_status IN ('upcoming', 'ongoing', 'completed'))
);



-- create a booking table


CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    match_id INT NOT NULL,
    seat_number VARCHAR(20),
   total_cost DECIMAL(10,2) NOT NULL CHECK (total_cost >= 0),

payment_status VARCHAR(50) CHECK (payment_status IN ('paid', 'pending', 'failed')),

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (match_id)
        REFERENCES Matches(match_id)
);



-- Data insert to user tabel 
INSERT INTO Users (user_id, full_name, email, role, phone_number)
VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'organizer', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'fan', NULL);


-- data insert matches tabel

INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status)
VALUES
(1, 'Bangladesh vs India', 'International Friendly', 500.00, 'upcoming'),
(2, 'Brazil vs Argentina', 'World Cup Qualifier', 1200.00, 'ongoing'),
(3, 'Germany vs France', 'UEFA Nations League', 800.00, 'completed'),
(4, 'Spain vs Portugal', 'International Friendly', 700.00, 'upcoming'),
(5, 'England vs Italy', 'Euro Qualifier', 900.00, 'completed');


-- data insert into bookings
INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, total_cost, payment_status)
VALUES
(1, 1, 1, 'A1', 500.00, 'paid'),
(2, 2, 1, 'A2', 500.00, 'pending'),
(3, 1, 2, 'B1', 1200.00, 'paid'),
(4, 3, 2, 'B2', 1200.00, 'failed'),
(5, 4, 3, 'C1', 800.00, 'paid'),
(6, 2, 3, 'C2', 800.00, 'pending'),
(7, 3, 4, 'D1', 700.00, 'paid'),
(8, 4, 5, 'D2', 900.00, 'pending');
