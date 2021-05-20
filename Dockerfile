FROM registry.centos.org/centos/centos:latest 

COPY playbook.yml requirements.yml ansible.cfg hosts /root

WORKDIR /root

RUN yum -y update \
  && yum install -y epel-release \
  && yum install -y ansible \
  && ansible-galaxy collection install -r requirements.yml

ENTRYPOINT ["ansible-playbook", "-v", "/root/playbook.yml"]
