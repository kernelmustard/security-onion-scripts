# pcap_nfs
This was created to extend the storage capability of Security Onion sensors. 
# Summary
The pcap_nfs salt state performs 3 configuration changes to each salt minion enrolled as a sensor
- push a script to `/usr/sbin-so-rotate-pcap` that checks if /nsm usage is above 85%, and copies the oldest 5 pcap files to cold storage until 
- create an hourly cron job to run it
- mount the share on a specified NFS server as cold storage to copy old pcap to.
# Installation
0. You should be on the manager. Make sure `yamllint` and `nfs-utils` is installed
1. If `test -f /opt/so/saltstack/local/salt/top.sls` is false, cp top.sls from default to local before modifying it.
2. Add `- pcap_nfs` to the end of the section whose header is `'*_sensor and G@saltversion:{{saltversion}}'`
3. Modify the NFS_SERVER variable in pcap_nfs/init.sls to match yours, and ensure the path specified matches the path exported on that server.
4. Run `yamllint /opt/so/saltstack/local/salt/{top,pcap_nfs/init}.sls`
5. Run `sudo salt -l debug \* state.apply`
# Issues/Improvements/Warnings
- so-rotate-pcap assumes stenographer has the default threshold for deleting pcap (90%), but it is possible and maybe preferrable to grab that number from the local config file
- It works in my test environment, but users should ensure their stenographer searches cold storage in addition to hot storage. It has been fickle in my experience. 
- The `yamllint` step is optional, but it has saved me hours that I used to spend trying to chase down weird errors only to find it was a stray space. 