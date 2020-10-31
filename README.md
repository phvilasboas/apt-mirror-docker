# apt-mirror-docker
Repositório APT DEBIAN 09 em container

**Gerar a imagem**

_root@docker~# docker build -t aptmirror:latest ._

# Config nas maquinas

**Para config nas maquinas usuario e senha no aquivo auth.conf**
_root@user-# vim /etc/apt/auth.conf_

Exemplo de auth.conf:
```
machine apt.exemplo.com.br
  login user
  password pass
```


[//]: # (licenciado sob a licença Apache 2.0)
[//]: # (Copyright 2020 Pedro Henriqure Vilas Boas - pedro@vilasboas.eti.br)
