# Learning Units

Standardisierte Kompilierung der Aufgaben sowie Erstellung eines Buchs. Hierzu
muss `docker` und `docker compose` vorhanden sein, welche zusammen für Windows 
direkt von 
[docker.com](https://docs.docker.com/desktop/setup/install/windows-install/) 
bezogen werden kann: 

Die Komplierung kann in einem Terminal bspw. der Windows PowerShell angestoßen 
werden:

```shell
docker compose up -d --build
```

Die statische Buch-Website kann der URI [localhost:8080](http://localhost:8080) im Browser angesehen 
werden.

Abschließend kann mit folgendem Befehl die Dockerinstanz geschlossen werden:

```shell
docker-compose down 
```