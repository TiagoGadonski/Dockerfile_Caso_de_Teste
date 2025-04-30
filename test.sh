#!/bin/sh

echo "Esperando o servidor iniciar..."

sleep 3



echo "Executando teste..."

response=$(curl -s http://app:3000/)

expected='{"message":"Servidor Node no ar!"}'



if [ "$response" = "$expected" ]; then

 echo "Teste passou!"

 exit 0

else

 echo "Teste falhou!"

 echo "Esperado: $expected"

 echo "Recebido: $response"

 exit 1

fi