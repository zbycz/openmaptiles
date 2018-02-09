#!/bin/bash
#tools
apt-get update
apt-get install -y screen gawk mc bc build-essential htop

#docker
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update && sudo apt-get install -y docker-ce
docker run hello-world

#docker-compose
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version


#my omt
cd openmaptiles/
mkdir data
cd data/
wget http://upload.zby.cz/my.osm.pbf
cd ..

./quickstart.sh my


# send info mail
logfile="`date`.log"
mv quickstart.log "$logfile"
echo "$logfile\n`df -h`" | mutt -a "$logfile" -s "AWS job finished" -- zbytovsky@gmail.com

#halt

exit

#-----------------------
# FOR user-data in aws:   (doesnt work... ?)
#-----------------------
#!/bin/bash
git clone --depth=1 https://github.com/zbycz/openmaptiles; sudo screen -dmS huhu; sudo screen -S huhu -X stuff 'bash openmaptiles/setup.sh\n'

