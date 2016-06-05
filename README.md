# potmum

[Project Page](https://github.com/rutan/potmum)

## Set environment

Please set envs in docker-compose.yml before running.

See [potmum README](https://github.com/rutan/potmum#environment-variables).

## Updating

```sh
# Pull newest commit from potmum repo
git submodule foreach git pull origin master
# Rebuild and relaunch
docker-compose build
docker-compose up -d
```
