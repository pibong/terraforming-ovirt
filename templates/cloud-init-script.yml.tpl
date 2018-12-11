## cloud-config

# Add SSH public key to authorized_keys of root user for the first login (using for example a terraform provisioner)
users:
  - name: root
    ssh_pwauth: True
    ssh_authorized_keys:
      - ${ssh_pub_key}

# Set yum repositories
yum_repos:
  - rhel-x86_64-server-7:
    baseurl: http://${repo_server}/rpm/up2date_clone/channels/rhel-x86_64-server-7/
    enabled: true
    failovermethod: priority
    gpgcheck: true
    gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
    name: rhel-x86_64-server-7

  - equens-rhel-x86_64-server-7:
    baseurl: http://${repo_server}/rpm/up2date_clone/channels/equens-rhel-x86_64-server-7/
    enabled: true
    failovermethod: priority
    gpgcheck: true
    gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
    name: equens-rhel-x86_64-server-7

  - rhel-x86_64-server-optional-7
    baseurl: http://${repo_server}/rpm/up2date_clone/channels/rhel-x86_64-server-optional-7/
    enabled: true
    failovermethod: priority
    gpgcheck: true
    gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
    name: rhel-x86_64-server-optional-7


bootcmd:
  - echo bootcmd >> /etc/motd

runcmd:
  - echo runcmd >> /etc/motd
  - hostnamectl set-hostname ${hostname}

# set hostname manually because of a bug in the RHEL 7.4 cloud-init rpm
