import sqlite3
from sqlite3 import Error

# name of the SQL script file to execute
sql_file = "my_script.sql"

# connect to the database
conn = sqlite3.connect("my_database.db")

# Executing the script
try:
    with open(sql_file, "r") as file:
        print("Reading file!" + "\n")
        script = file.read()
        print("Script has been read!" + "\n")
        print("Executing the script..." + "\n")
        conn.executescript(script)
        print("done!")
except Error as e:
    print("crap! Something went wrong...", e)
    conn.close()

# Committing and closing
conn.commit()
conn.close()
