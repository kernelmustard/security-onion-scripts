push_script:
  file.managed:
    - source: salt://so_rmnode/files/so-rmnode
    - user: root
    - group: root
    - mode: "0755"
    - template: jinja
    - name: /usr/sbin/so-rmnode