#!/bin/bash

while true; do
echo "1. Sortare crescator dupa greutate"
echo "2. Sortare descrescator dupa necesarul de calorii"
echo "3. Iesire"
read -p "Alege o optiune: " optiune

  case $optiune in
    1)
     sortare_date=$(tail -n +2 "$(find -name *.csv)" | sort -k5 -n)
     echo "Sortarea a fost efectuata in fisierul sort_cresc_greutate.txt"
     echo "ID,  Nume,Sex,Varsta,Greutate,Inaltime,Calorii,Carbohidrati,Proteine,Grasimi" > "sort_cresc_greutate.txt"
     echo "$sortare_date" >> "sort_cresc_greutate.txt"
      ;;
    2)
     sortare_date=$(tail -n +2 "$(find -name *.csv)" | sort -k7 -nr)
     echo "Sortarea a fost efectuata in fisierul sort_descresc_kcal.txt"
     echo "ID,  Nume,Sex,Varsta,Greutate,Inaltime,Calorii,Carbohidrati,Proteine,Grasimi" > "sort_descresc_kcal.txt"
     echo "$sortare_date" >> "sort_descresc_kcal.txt"
      ;;
    3)
      echo "Bye!"
      exit 0
      ;;
    *)
      echo "Optiune invalida!"
      ;;
  esac
echo
done

