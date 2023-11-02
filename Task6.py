#this is the installation of flask

from flask import Flask, render_template
from five import fetch_student_records 

app = Flask(__name)

@app.route('/')
def index():
    student_records = fetch_student_records() n

    return render_template('index.html', student_records=student_records)

if __name__ == '__main__':
    app.run()

#this is the the html that is suppused to be in index html file

<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
</head>
<body>
    <h1>Student Details</h1>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Course</th>
        </tr>
        {% for student in student_records %}
        <tr>
            <td>{{ student.student_id }}</td>
            <td>{{ student.name }}</td>
            <td>{{ student.age }}</td>
            <td>{{ student.gender }}</td>
            <td>{{ student.course }}</td>
        </tr>
        {% endfor %}
    </table>
</body>
</html>


server {
    listen 80;
    server_name your_server_domain_or_ip;

    location / {
        proxy_pass http://localhost:5000;  # Assuming your Flask app runs on port 5000
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /static {
        alias /path/to/your/static/files;  # If you have static files
    }
}
