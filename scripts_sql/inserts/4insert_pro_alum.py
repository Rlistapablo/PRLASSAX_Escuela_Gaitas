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
cnxn,cursor=connect('localhost','prl_EscuelaGaitas','sa','masterkey')

def alumno(nif):
    id_al=nif[:-1]+'A'
    q=f"INSERT INTO Alumnos VALUES ('{nif}','{id_al}');"
    cursor.execute(q)
    cnxn.commit()

def profesor(nif):
    id_al=nif[:-1]+'P'
    q=f"INSERT INTO Profesores VALUES ('{nif}','{id_al}');"
    cursor.execute(q)
    cnxn.commit()

def conj(nif):
    id_al=nif[:-1]+'C'
    q=f"INSERT INTO Conserje VALUES ('{nif}','{id_al}');"
    cursor.execute(q)
    cnxn.commit()

def trab(nif):
    t=str(rd(0,1))
    fecha=datetime.date(rd(2010,2019),rd(1,6),rd(1,21))
    q=f"INSERT INTO Trabajadores VALUES ('{nif}','{fecha}', {t});"
    cursor.execute(q)
    cnxn.commit()


cursor.execute('SELECT NIF FROM Personas;')
personas=[filas[0] for filas in cursor.fetchall()]
for x in range(1,20):
    per=personas[rd(0,len(personas)-1)]
    trab(per)
    profesor(per)
    personas.remove(per)
for x in range(1,7):
    per=personas[rd(0,len(personas)-1)]
    trab(per)
    conj(per)
    personas.remove(per)
for x in personas:
    alumno(x)