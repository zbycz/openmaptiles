sudo docker run --rm --volumes-from 3d -v /Users/pavel:/backup busybox tar cvf /backup/backup.tar /var/lib/postgresql/data
