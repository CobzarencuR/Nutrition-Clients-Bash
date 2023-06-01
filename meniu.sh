#!/bin/bash

k=101
while [ $k -ne 0 ]
do
  clear
  echo "~~~~~~~~~~~~~~~~~~~"
  echo "      COMENZI      "
  echo "~~~~~~~~~~~~~~~~~~~"
  echo "1. Creare fisier"
  echo "2. Adaugare clienti"
  echo "3. Stergere clienti"
  echo "4. Sortare clienti"
  echo "5. Iesire"
  echo "~~~~~~~~~~~~~~~~~~~"
  echo ""
  echo "Selecteaza o comanda:"
read a
  case $a in
        1)
                ./creareFisier.sh
                sleep 2;
                echo "Fisierul s-a creat cu succes!";
                ;;
        2)
                ./adaugareClient.sh
                sleep 1;
                echo "Adaugarea clientilor in fisier s-a efectuat cu succes!";
                sleep 2;
                ;;
        3)
                ./stergereClient.sh
                sleep 1;
                echo "Stergerea clientilor din fisier s-a efectuat cu succes!";
                sleep 2;
                ;;
        4)

                ./sortare_fisier.sh
                sleep 1;
                echo "Sortarea clientilor in fisier s-a efectuat cu succes!";
                sleep 2;
                ;;
        5)
                echo "Iesirea s-a efectuat cu succes!";
                exit 0
                ;;
        *)
                echo "Optiune invalida!";
                ;;
esac
done
