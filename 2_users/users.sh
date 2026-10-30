#!/bin/bash

sudo groupadd profes 2>/dev/null 

for user in ferran pablo oriol; do
    if ! id "$user" &>/dev/null; then
        sudo useradd -m -s /bin/bash -G profes "$user"
        sudo passwd -d "$user"
    else
        echo "User $user ja existeix."
    fi
done

sudo mkdir -p /tmp/prac3
sudo chown root:profes /tmp/prac3
sudo chmod 770 /tmp/prac3
sudo chmod +t /tmp/prac3

echo "Arxiu compartit per a tots els profes" | sudo tee /tmp/prac3/shared.txt > /dev/null
sudo chown oriol:profes /tmp/prac3/shared.txt
sudo chmod 770 /tmp/prac3/shared.txt

echo "Arxiu privat d'e Ferran" | sudo tee /tmp/prac3/ferran.txt > /dev/null
echo "Arxiu privat d'e Pablo" | sudo tee /tmp/prac3/pablo.txt > /dev/null
echo "Arxiu privat d'e Oriol" | sudo tee /tmp/prac3/oriol.txt > /dev/null

sudo chown ferran:profes /tmp/prac3/ferran.txt
sudo chown pablo:profes /tmp/prac3/pablo.txt
sudo chown oriol:profes /tmp/prac3/oriol.txt

sudo chmod 700 /tmp/prac3/ferran.txt
sudo chmod 700 /tmp/prac3/pablo.txt
sudo chmod 700 /tmp/prac3/oriol.txt