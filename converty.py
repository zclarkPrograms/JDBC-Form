# from openpyxl import load_workbook
from faker import Faker
import random 
import pandas as pd
from collections import defaultdict
import random_address

# Takes in a excel file and converts it to SQL statements

# Load the excel shete information
# wb = load_workbook("fields.xlsx")
# ws = wb["Sheet1"]

# cur_table = ""
# collect_columns = False
# numberOfColumns = 5

# tables = {}
# table_info = []

fake = Faker()
fake_family = defaultdict(list)

# address = fake.address()
# print(address)
# with open("insertions.sql", "a") as file:
#     for row in range(1, 7):
#         # cid NUMBER(38,0),
#         # street VARCHAR2(50),
#         # apt VARCHAR2(10),
#         # city VARCHAR2(30),
#         # state VARCHAR2(50),
#         # zip VARCHAR2(20),
#         # PRIMARY KEY(cid,street,apt,city,state,zip),
#         # FOREIGN KEY (cid) REFERENCES Customers(cid)
#         # cid = random.randint(1, 50)
#         address = random_address.real_random_address_by_state('CA')
#         street = address["address1"]
#         apt = address["address2"]
#         city = address["city"]
#         state = address["state"]
#         postal = address["postalCode"]
#         insert_str = f"INSERT INTO Addresses VALUES ({row}, '{street}', '{apt}', '{city}', '{state}', '{postal}')\n"
#         file.writelines(insert_str)
# fake.locales = 'en-US'
# def gen_phone():
#     first = str(random.randint(100,999))
#     second = str(random.randint(1,888)).zfill(3)

#     last = (str(random.randint(1,9998)).zfill(4))
#     while last in ['1111','2222','3333','4444','5555','6666','7777','8888']:
#         last = (str(random.randint(1,9998)).zfill(4))
        
#     return '{}-{}-{}'.format(first,second, last)

# with open("insertions.sql", "a") as file:
#     for row in range(1, 8):
#         ptype = ['work', 'home', 'cell']
#         insert_str = f"INSERT INTO Phones VALUES ({row}, '{gen_phone()}', '{ptype[random.randint(0, 2)]}')\n"
#         file.writelines(insert_str)




# Loop through the excel sheet
# for row in range(1,67):
#     print(f"\nRow: {row} | Table: {cur_table}")
#     # Once at a new table need to collect the # of columns
#     if collect_columns:
#         i = 1
#         while ws.cell(row=row, column=i).value is not None:
#             i += 1
#         numberOfColumns = i
#         collect_columns = False

#     for col in range(1, numberOfColumns):
#         cell_info = str(ws.cell(row=row, column=col).value).strip()
#         if cell_info is None:
#             continue
#         if "TABLE:" in cell_info.upper():
#             cur_table = cell_info.split(":")[1]
#             collect_columns = True

#             break







