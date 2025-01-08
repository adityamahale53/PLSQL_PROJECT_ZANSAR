# PLSQL_PROJECT_ZANSAR

# Bus Booking System

## Overview
The Bus Booking System is a database-driven project that facilitates the management of buses, routes, schedules, passengers, and bookings. It provides an efficient way to organize and query data for a bus transportation service.

This system can be used to:
- Manage details of buses, routes, and schedules.
- Maintain passenger information.
- Handle bookings and track their status.
- Query information to generate reports.

---

## Features
1. **Bus Management**
   - Add and manage bus details, including bus number, capacity, type, driver details, etc.

2. **Route Management**
   - Define and manage routes, specifying the source, destination, and distance.

3. **Schedule Management**
   - Assign buses to specific routes with departure and arrival times.
   - Specify days of operation for each schedule.

4. **Passenger Management**
   - Maintain a record of passengers, including their contact information.

5. **Booking Management**
   - Allow passengers to book seats for specific schedules.
   - Track booking details such as the number of seats, total amount, and booking status.

6. **Reporting**
   - Generate reports on bookings, schedules, and passenger details.

---

## Database Structure
### Tables
1. **`buses`**
   - Holds details about the buses, including bus ID, bus number, capacity, type, and driver details.

2. **`routes`**
   - Contains information about routes, including route ID, source, destination, and distance.

3. **`schedules`**
   - Links buses to routes with departure and arrival times, and specifies the days of operation.

4. **`passengers`**
   - Stores passenger details such as name, contact number, email, and address.

5. **`bookings`**
   - Tracks booking details, linking passengers to specific schedules with information on seats booked, total amount, and booking status.

### Relationships
- `schedules` references `buses` and `routes`.
- `bookings` references `passengers` and `schedules`.

---

## Usage Instructions
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```

2. Set up the database:
   - Ensure you have a database system like Oracle, MySQL, or PostgreSQL installed.
   - Create a new database for the project.

3. Populate the database:
   - Use the provided schema and data files to create and populate the database tables.

4. Query the data:
   - Use SQL queries to retrieve information from the database or perform operations as needed.

5. Extend the system:
   - You can add more features like user authentication, a front-end interface, or additional reporting capabilities.

---

## Technologies Used
- **Database Management System**: Oracle (or any compatible DBMS of your choice).
- **Query Language**: SQL.
- **Tools**: SQL Developer, DBeaver, or any other database client.

---

## Future Enhancements
- Add a front-end interface for end-users to interact with the system.
- Implement APIs for seamless integration with other services.
- Introduce advanced reporting tools and analytics.
- Enhance the system with role-based access controls.

---

## Contributing
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature description"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

---

## License
This project is licensed under the [MIT License](LICENSE).

---

## Contact
For any questions or feedback, feel free to contact the project maintainer:
- **Name**: Aditya Mahale
- **Email**: adityamahale53@gmail.com
- **GitHub**: https://github.com/adityamahale53

