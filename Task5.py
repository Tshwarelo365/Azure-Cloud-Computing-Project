import mysql.connector

def fetch_student_records():
    # Define the database connection parameters
    db_config = {
        "host": "localhost",  # Your MySQL host
        "user": "tshwarelo",
        "password": "Ttmokoane7",
        "database": "student_records"
    }

    # Establish a connection to the database
    connection = mysql.connector.connect(**db_config)

    try:
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Define the SQL query to fetch all records from the "students" table
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
    student_records = fetch_student_records()
    for student in student_records:
        print(student)
