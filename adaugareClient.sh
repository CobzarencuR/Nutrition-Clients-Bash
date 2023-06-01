#!/bin/bash

last_id(){
    id=$(tail -n 1 $(find -name "*.csv" -type f) | cut -d "," -f 1)
    if [ -z "$id" ]
    then
        id=0
    fi
id=$((id+1))
}

calorii_macros(){
prot=$(printf "%.2f" $(echo "2*$greutate" | bc))
gras=$(printf "%.2f" $(echo "2.2*$greutate*0.4" | bc))
case $sex in
    M)
        calorii=$(printf "%.2f" $(echo "((66 + 13.7*$greutate + 5*$inaltime - 6*$varsta)*1.2)" | bc))
        carbo=$(printf "%.2f" $(echo "(($calorii - $prot*4 - $gras*9)/4)" | bc))
        aranjare
        ;;
    m)
        calorii=$(printf "%.2f" $(echo "((66 + 13.7*$greutate + 5*$inaltime - 6*$varsta)*1.2)" | bc))
        carbo=$(printf "%.2f" $(echo "(($calorii - $prot*4 - $gras*9)/4)" | bc))
        aranjare
        ;;
    F)
        calorii=$(printf "%.2f" $(echo "((665 + 9.6*$greutate + 1.7*$inaltime - 4.7*$varsta)*1.2)" | bc))
        carbo=$(printf "%.2f" $(echo "(($calorii - $prot*4 - $gras*9)/4)" | bc))
        aranjare
        ;;
    f)
        calorii=$(printf "%.2f" $(echo "((665 + 9.6*$greutate + 1.7*$inaltime - 4.7*$varsta)*1.2)" | bc))
        carbo=$(printf "%.2f" $(echo "(($calorii - $prot*4 - $gras*9)/4)" | bc))
        aranjare
        ;;
esac
}

verif_nume() {
nume_ok=0
while [ $nume_ok -eq 0 ]
do
  if echo "$nume" | grep -qE '^[A-Z][a-z]{1,20}$'; then
     nume_ok=1
  else
     echo  ""
     echo "Numele este invalid!"
     echo "Introduceti corect numele clientului: "
     read nume
  fi
done
}

verif_sex() {
sex_ok=0
while [ $sex_ok -eq 0 ]
do
        case $sex in
   M)
        sex_ok=1
        ;;
   m)
        sex_ok=1
        ;;
   F)
        sex_ok=1
        ;;
   f)
        sex_ok=1
        ;;
   *)
        echo ""
        echo "Sexul este invalid!"
        echo "Introduceti corect sexul clientului: "
        read sex
        ;;
    esac
done
}

verif_varsta() {
varsta_ok=0
while [ $varsta_ok -eq 0 ]
do
  if echo "$varsta" | grep -qE '^[1-9][0-9]$'; then
     varsta_ok=1
  else
     echo ""
     echo "Varsta este invalida!"
     echo "Introduceti corect varsta clientului: "
     read varsta
  fi
done
}

verif_greutate() {
greutate_ok=0
while [ $greutate_ok -eq 0 ]
do
  if echo "$greutate" | grep -qE '^[1-9][0-9]{1,2}$'; then
     greutate_ok=1
  else
     echo ""
     echo "Greutatea este invalida!"
     echo "Introduceti corect greutatea clientului: "
     read greutate
  fi
done
}

verif_inaltime() {
inaltime_ok=0
while [ $inaltime_ok -eq 0 ]
do
  if echo "$inaltime" | grep -qE '^[1-2][0-9]{2}$'; then
     inaltime_ok=1
  else
     echo ""
     echo "Inaltimea este invalida!"
     echo "Introduceti corect inaltimea clientului: "
     read inaltime
  fi
done
}

aranjare(){
marime_nume=$(printf "%s" "$nume" | wc -c)
    echo "$id,$nume,$sex,$varsta,$greutate,$inaltime,$calorii,$carbo,$prot,$gras" >> $(find -name "*.csv" -type f| head -n 1)
}

nr_clienti(){
echo "Cati clienti vreti sa adaugati in fisier?"
read nrClienti
for ((i=1; i<=nrClienti; i++))
  do
    last_id
    echo "Clientul nr.$id"
    echo "Introduceti numele clientului:"
    read  nume
    verif_nume
    echo "Introduceti sexul clientului(M/F):"
    read  sex
    verif_sex
    echo "Introduceti varsta clientului(ani):"
    read  varsta
    verif_varsta
    echo "Introduceti greutatea clientului(kg):"
    read  greutate
    verif_greutate
    echo "Introduceti inaltimea clientului(cm):"
    read  inaltime
    verif_inaltime
    calorii_macros
done
}

nr_clienti

