#!/bin/bash

venvname="env"
declare -a users=("john" "bob")
declare -a modules=("requests" "cryptography")


for i in "${users[@]}"
do
	sudo -u $i python -m pip install --user --upgrade pip
	sudo -u $i python -m pip install --user virtualenv
	sudo -u $i python -m virtualenv /home/$i/$venvname &&
	for m in "${modules[@]}"
	do
		source /home/$i/$venvname/bin/activate &&
		pip install $m &&
		deactivate
	done;
	chown -R $i:$i /home/$i/$venvname
done




