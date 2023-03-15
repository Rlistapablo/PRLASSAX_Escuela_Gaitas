import pyodbc
import datetime
import time
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
def telefonos(nif):
    cantidad=rd(1,3)
    for x in range(1,cantidad):
        telefonos=str(rd(5000000,9999999))
        q=f"INSERT INTO Telefono VALUES ('{telefonos}','{nif}');"
        cursor.execute(q)
        cnxn.commit()
def correos(nif):
    cantidad=rd(1,3)
    prov=['gmail','hotmail','yahoo','mundo-r']
    do=['.com','.es','.gal']
    cursor.execute(f"SELECT Nombre, Apellidos FROM Personas where NIF = '{nif}';")
    nombre=cursor.fetchall()
    for x in range(1,cantidad):
        correo=nombre[0][0]+'_'+nombre[0][1]+str(x)+'@'+prov[rd(0,len(prov)-1)]+do[rd(0,len(do)-1)]
        correo=correo.replace(' ','_')
        q=f"INSERT INTO Email VALUES ('{correo}','{nif}');"
        cursor.execute(q)
        cnxn.commit()
cursor.execute('SELECT NIF FROM Personas;')
personas=[filas[0] for filas in cursor.fetchall()]
for x in personas:
    telefonos(x)
    correos(x)