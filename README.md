docker-ansible : using ansible without installing it
======================================================

This docker allows you to use ansible on your computer without installing it.

This allows you to :

* share your ssh agent with the ansible docker
* share your AWS CLI configuration
* Use a specifc version without installation
* Use AWS and Junos componants: `aws cli`, `junos-eznc`, `Juniper.junos` ansible module

Just add these aliases to your `~/.{bash|zsh|...}_aliases` in order to use ansible as it where installed on your computer.

```bash
export DOCKER_ANSIBLE_VERSION=2.5
base_ansible() {
        docker run -it --rm \
            --env ANSIBLE_REMOTE_USER=${USER} \
            --env AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
            --env AWS_PROFILE=${AWS_PROFILE} \
            --volume $SSH_AUTH_SOCK:/ssh-agent \
            --env SSH_AUTH_SOCK=/ssh-agent \
            -v ${PWD}:project \
            -v ${HOME}/.aws/:/root/.aws/ \
            -v ${HOME}/.ssh/known_hosts:/root/.ssh/known_hosts \
            -w ${PWD} \
            inetsix/docker-ansible:${DOCKER_ANSIBLE_VERSION} $@
}

alias ansible-shell='base_ansible bash'
alias ansible='base_ansible ansible'
alias ansible-playbook='base_ansible ansible-playbook'
alias ansible-vault='base_ansible ansible-vault'
alias ansible-galaxy='base_ansible ansible-galaxy'
```

## Usage

Simply use your aliases, and you can override ansible default version when required

```bash
$ docker-ansible --version 
ansible 2.0.2.0
  config file = /tmp/ansible.cfg
  configured module search path = Default w/o overrides

$ DOCKER_ANSIBLE_VERSION=2.5 docker-ansible --version 
ansible 2.5.2
  config file = /Users/tgrimonet/Scripting/ansible.projects/ansible.training.phase2/ansible.cfg
  configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python2.7/site-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 2.7.14 (default, Apr 27 2018, 09:37:08) [GCC 4.9.2]
```

If for some reasons, you need to use your installed ansible version, just use `\\` in front of any ansible command like below:

```bash
$ \ansible --version
ansible 2.5.1
  config file = /Users/tgrimonet/Scripting/ansible.projects/ansible.training.phase2/ansible.cfg
  configured module search path = [u'/Users/tgrimonet/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python2.7/site-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 2.7.14 (default, Mar 22 2018, 15:04:47) [GCC 4.2.1 Compatible Apple LLVM 9.0.0 (clang-900.0.39.2)]

$ ansible --version
ansible 2.5.2
  config file = /Users/tgrimonet/Scripting/ansible.projects/ansible.training.phase2/ansible.cfg
  configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python2.7/site-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 2.7.14 (default, Apr 27 2018, 09:37:08) [GCC 4.9.2]
```

