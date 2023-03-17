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
cnxn,cursor=connect('192.168.1.201','EscuelaGaitas_prl','sa','abc123..')
q='INSERT INTO Municipio VALUES '
lista=['Arteixo','Coruña','Culleredo','Santiago','Ferrol']
for x in range(0,len(lista)):
    string="("+str(x+1)+",'"+lista[x]+"'), "
    q+=string
q=q[:-2]+';'
print(q)
cursor.execute(q)
cnxn.commit()
#