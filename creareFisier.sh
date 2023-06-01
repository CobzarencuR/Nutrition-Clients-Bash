#!/bin/bash

echo "Scrie un nume pentru fisier:"
read name
echo "ID,Nume,Sex,Varsta,Greutate,Inaltime,Calorii,Carbohidrati,Proteine,Grasimi" > "${name}.csv"
echo "Fisierul a fost creat cu succes!"
