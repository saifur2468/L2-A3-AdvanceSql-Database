#  Football Ticket Booking System

##  Project Overview
This is a **Football Ticket Booking System** database project.  
It is designed to manage users, matches, and ticket bookings with proper relationships and SQL constraints.

The system demonstrates:
- ERD design (1-to-1, 1-to-many relationships)
- Primary Key & Foreign Key usage
- SQL constraints and data integrity
- Intermediate SQL queries

---

##  Objectives
- Design a normalized database structure
- Implement relationships between tables
- Ensure data integrity using constraints
- Perform advanced SQL queries (JOIN, GROUP BY, HAVING)

---

## ERD LIVE LINK:
https://drawsql.app/teams/saif-rahmamn/diagrams/football-ticket-booking-system

###  Users Table
Stores user information.

###  Matches Table
Stores football match details.

###  Bookings Table
Stores ticket booking information and connects Users & Matches.

---

## 🔗 Relationships

- **One User → Many Bookings**
- **One Match → Many Bookings**
- **Each Booking → One User + One Match**

---

##  Key Concepts Used

- Primary Key
- Foreign Key
- NOT NULL constraint
- CHECK constraint
- COUNT(), GROUP BY, HAVING
- Data normalization



