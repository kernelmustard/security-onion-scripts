{% set NFS_SHARE = '192.168.32.131:/var/share/pcap' %}
pcap_script:
  file.managed:
    - source: salt://pcap_nfs/files/so-rotate-pcap
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - name: /usr/sbin/so-rotate-pcap

/usr/sbin/so-rotate-pcap:
  cron.present:
    - identifier: pcap_nfs
    - user: root
    - special: '@hourly'

create_mount_point:
  file.directory:
    - name: /nsm/pcap/backup

pcap_nfs:
  pkg.installed:
    - name: nfs-utils
  mount.mounted:
    - name: /nsm/pcap/backup
    - mkmount: true
    - require.file: create_mount_point
    - device: {{ NFS_SHARE }}
    - fstype: nfs
    - opts:
        - defaults