# KabaScript Server Setup

KabaScript Server Setup is a set of Ansible playbooks for provisionning and setuping Ubuntu >= 18.04 server with also Traefik configuration with Docker and others services such as: `mysql` , `phpmyadmin`, `portainer`

## Installation

- Copy `inventory.ini.example` into `inventory.ini`
- Copy `vars-overrides.yml.example` into `vars-overrides.yml`

Update all needed variables

**Avaible app urls**

```shell
your-domain.com
t.your-domain.com
portainer.your-domain.com
pma.your-domain.com
netdata.your-domain.com
```

**Firewall**

Do not forget to set *fail2ban_ignoreip*

Make sure to update your DNS (your-domain.com) with **ipaddress**

## Useful commands

Etablish permanent ssh connexion

```shell
ssh-copy-id -i ~/.ssh/id_rsa.pub root@161.97.68.183
```

## References

- [Ansible + Docker](https://gist.github.com/ttwthomas/017891e536f745dcbcc5d0bc160a2643)
- [Set Up SSH Keys](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)

## Know issues

- For AWS make sure to `chmod 400 ~/.ssh/aws-edu.pem`
- [Ansible python interpreter](https://www.toptechskills.com/ansible-tutorials-courses/how-to-fix-usr-bin-python-not-found-error-tutorial/)
- When deploying to use ssh forwarding, run this : [ssh forwarding](https://roots.io/docs/trellis/master/ssh-keys/#cloning-remote-repo-using-ssh-agent-forwarding)

```shell
ssh-add -K
```

## Provision server per environment

```shell
docker-compose exec master ansible-playbook server.yml -e env=<environment>
```

## References

- [Docker images Python Docker Images](https://pythonspeed.com/articles/base-image-python-docker-images/)
- [Docker Swarm on AWS](https://www.seelk.co/blog/docker-swarm-on-aws-with-ansible/)
