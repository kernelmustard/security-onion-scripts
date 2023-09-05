install_uf:
  pkg.installed:
    - sources:
      salt://splunk_uf/files/splunkforwarder-9.1.0.1-77f73c9edb85.x86_64.rpm

install_splunk:
  file.managed:
    - source: salt://files/install_uf.sh
    - user: root
    - group: root
    - mode: 0755
    - name: /root/install_uf.sh
  cmd.run:
    - name: /root/install_uf.sh 

inputs_conf:
  file.managed:
    - source: salt://files/inputs.conf
    - user: splunkfwd
    - group: splunkfwd
    - mode: 0644
    - name: /opt/splunkforwarder/etc/apps/search/local/inputs.conf
  cmd.run:
    - name: sudo /opt/splunkforwarder/bin/splunk restart