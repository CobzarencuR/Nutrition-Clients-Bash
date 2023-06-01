#!/bin/bash
IFS=','
stergere_id() {
  local id="$1"
  sed -i "/^${id},/d" $(find -name "*.csv" -type f)
  echo "Clientul cu ID-ul $id a fost sters din fisier."
}

ok=1
while [ $ok -eq 1 ]; do
  echo "1. Sterge client"
  echo "2. Iesire"

  read -p "Alege o optiune: " optiune

  case $optiune in
    1)
      read -p "ID-ul clientului de sters: " client_id
      if grep -q "$client_id," $(find -name "*.csv" -type f); then
        stergere_id "$client_id"
      else
        echo "Clientul cu ID-ul $client_id nu a fost gasit."
      fi
      ;;
    2)
      echo "Bye!"
      exit
      ;;
    *)
      echo "Optiune invalida!"
      ;;
  esac
  echo
done

