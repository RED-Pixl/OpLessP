import sqlite3
from sqlite3 import Error

# name of the SQL script file to execute
sql_file = "script.sql"

# connect to the database
conn = sqlite3.connect("database.db")


# Executing the script
def create():
    try:
        with open(sql_file, "r") as file:
            print("reading file!")
            script = file.read()
            print("script has been read!")
            print("executing the script...")
            conn.executescript(script)
            print("done!")
    except Error as e:
        print("ERROR! something went wrong...", e)
        conn.close()
    # Committing and closing
    conn.commit()
    conn.close()
