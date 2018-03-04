#!/bin/bash
#tools
apt-get update && apt-get install -y screen gawk mc bc build-essential htop

#docker
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update && apt-get install -y docker-ce
docker run hello-world

#docker-compose
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version


#already checked out from git:
cd openmaptiles/
mkdir data
wget http://upload.zby.cz/my.osm.pbf -P data/


start=`date`; ./sample.sh time ./quickstart.sh my; echo "/// start: $start - end: `date`";


# send info mail
logfile="`date`.log"
mv quickstart.log "$logfile"
echo "$logfile\n`df -h`" | mutt -a "$logfile" -s "AWS job finished" -- zbytovsky@gmail.com


exit

wget -c https://dumps.wikimedia.org/wikidatawiki/entities/latest-all.json.gz -P wikidata/  #cca 28GB

#-----------------------
# FOR user-data in aws:   (doesnt work... ?)
#-----------------------
#!/bin/bash
git clone --depth=1 https://github.com/zbycz/openmaptiles; sudo screen -dmS huhu; sudo screen -S huhu -X stuff 'bash openmaptiles/setup.sh\n'

