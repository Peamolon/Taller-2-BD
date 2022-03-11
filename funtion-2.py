from venv import create
import psycopg2


def post_order():
    try:
        connection = psycopg2.connect(user = "postgres",
                                      password = "postgres",
                                      host = "localhost",
                                        port = "5432",
                                        database = "postgres")
    
        

        cursor = connection.cursor()
        creta_order = 'insert into marketplace.order(default, 1, 1,1,1, "pending",  3213.2 )' 
        cursor.execute(creta_order)
        connection.commit()
        count = cursor.rowcount
        print(count, "Record inserted successfully into order table")
    except (Exception, psycopg2.Error) as error :
        if(connection):
            print("Failed to insert record into mobile table", error)

                    