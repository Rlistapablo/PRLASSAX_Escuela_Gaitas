import pyodbc
import datetime
from random import randint as rd
def connect(server,database,username,password):
    try:
        cnxn=pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
        cursor = cnxn.cursor()
        print('Conectado')
        return cnxn,cursor
    except Exception as ex:
        print(ex)
        exit()
cnxn,cursor=connect('192.168.1.201','Gaitas_Masking','sa','abc123..')
def rand(list):
    return list[rd(0,len(list)-1)]
letter='ABCDEFGHIJKMNÑOPQRSTUVWXYZ'
for x in range(1000,1125):
    cuenta=str(rd(1000,9999))+'-'+str(rd(1000,9999))+'-'+str(rd(1000,9999))+'-'+str(rd(1000,9999))
    cursor.execute(f"INSERT INTO alum_tar VALUES ('{str(x+5)}','{str(rd(1000,6999))+str(x)+rand(letter)}','{cuenta}','{str(rd(100,999))}','{datetime.date(rd(2023,2040),rd(1,12),rd(1,28))}');")
    cnxn.commit()

