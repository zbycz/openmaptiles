



```
# zobrazení MEM + CPU
docker stats

#
docker ps
docker-compose ps
docker-compose logs <id>


./quickstart.sh czech-republic


https://stackoverflow.com/questions/774556/peak-memory-usage-of-a-linux-unix-process

#!/usr/bin/env bash
"$@" & # Run the given command line in the background.
pid=$! peak=0
while true; do
  sleep 1
  sample="$(ps -o rss= $pid 2> /dev/null)" || break
  let peak='sample > peak ? sample : peak'
done
echo "Peak: $peak" 1>&2



# https://apple.stackexchange.com/a/46655/175658
top -l 1 -s 0 | grep PhysMem

# https://stackoverflow.com/a/42810377/671880
docker stats --no-stream | awk '{ print $3 }' | sed '1d'|sort | tail -1


docker stats --no-stream --format "{{.Container}}: {{.MemUsage}}"
pid=$! peak=0
while true; do
  sleep 1
  sample="$(ps -o rss= $pid 2> /dev/null)" || break
  let peak='sample > peak ? sample : peak'
done
echo "Peak: $peak" 1>&2

```
