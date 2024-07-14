import mysql.connector

def fetchStudentRecords():
    # Define the database connection parameters
    db_config = {
        "host": "localhost",  # Your MySQL host
        "user": "tshwarelo",
        "password": "Ttmokoane7?",
        "database": "studentManagement"
    }

    # connection to the database
    connection = mysql.connector.connect(**db_config)

    try:
        # A cursor to execute SQL queries
        cursor = connection.cursor()

        # SQL query to fetch all records from the "students" table
        query = "SELECT * FROM students"

        # Execute the query
        cursor.execute(query)

        # Fetch all records and store them in a list of dictionaries
        records = []
        for row in cursor.fetchall():
            student = {
                "student_id": row[0],
                "name": row[1],
                "age": row[2],
                "gender": row[3],
                "course": row[4]
            }
            records.append(student)

        return records

    finally:
        # Close the cursor and the database connection
        cursor.close()
        connection.close()

if __name__ == "__main__":
    studentManagement = fetchStudentRecords()
    for student in studentManagement:
        print(student)
