#/bin/sh

user=$1
passwd=$2
domain=$3

# boxes=$(curl --location-trusted -s -m 5 --user "$user:$passwd" --url "imaps://$domain")
curl --location-trusted -s -m 5 --user "$user:$passwd" --url "imaps://$domain"
echo "$boxes" | grep -v HasChildren
