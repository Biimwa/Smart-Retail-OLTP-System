import pandas as pd
import mysql.connector
from mysql.connector import Error

def load_csv_to_mysql(csv_path):
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='yourpassword',
            database='sales'
        )
        cursor = conn.cursor()
        df = pd.read_csv(csv_path)

        for _, row in df.iterrows():
            cursor.execute("""
                INSERT INTO sales_data (product_name, quantity_sold, price_per_unit, sale_date)
                VALUES (%s, %s, %s, %s)
            """, (
                row['product_name'],
                int(row['quantity_sold']),
                float(row['price_per_unit']),
                row['sale_date']
            ))

        conn.commit()
        print("✅ Data loaded successfully!")

    except Error as e:
        print(f"❌ Error: {e}")

    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

if __name__ == "__main__":
    load_csv_to_mysql("../data/oltpdata.csv")
