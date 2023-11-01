#!/bin/bash
echo "HELLO WELCOME TO 221967575 MOKOANE T PRACTICAL LAB 1 "
echo "Now executing webserver configurations"

# Step 1: Delete existing configurations (if any)
echo "Searching... and Deleting.. any configuration"

sleep 2

# Stop Nginx if it is running
if systemctl is-active --quiet nginx; then
    sudo systemctl stop nginx
fi

# Uninstall Nginx
if dpkg -l | grep -q "nginx"; then
    sudo apt-get remove --purge nginx nginx-common nginx-full -y
    sudo apt-get autoremove -y
    sudo apt-get clean
fi

# Delete the 'labs' directory
sudo rm -rf /var/www/html/labs

# Remove the symbolic link 'html' in the home directory
rm -f ~/html

echo "Nginx and 'labs' directory have been removed."

sleep 2

echo "i am cheking iif Nginx is installed and start if not running"

sleep 3

# Step 2: Check if Nginx is installed and start it if not running
if ! dpkg -l | grep -q "nginx"; then
    sudo apt-get update
    sudo apt-get install nginx -y
fi

if ! systemctl is-active --quiet nginx; then
    sudo systemctl start nginx
fi

# Step 3: Create the 'labs' directory
sudo mkdir -p /var/www/html/labs

# Step 4: Change ownership of the 'labs' directory to the current user
sudo chown -R $USER:$USER /var/www/html/labs

# Step 5: Create a symbolic link 'html' in the home directory
ln -s /var/www/html/labs ~/html

# Step 6: Create an index.html file in the 'labs' directory
cat <<EOF > /var/www/html/labs/index.html
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
EOF

# Step 7: Additional information has been added to index.html


echo "Nginx setup and The webpage was created succesfuly created."
echo "Task 1 and Task 2 has finished executing"

sleep 3 

echo "Now Deploying database"

#dEPLOY MYSQL DATABASE

apt install mysql-server

#SECURITY configuration

mysql_secure_installation

#improve security

mysql -u root -p
