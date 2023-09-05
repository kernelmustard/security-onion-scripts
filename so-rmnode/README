# so-rmnode
A script to automate removing a node from a running Security Onion deployment

Confirmed works with sensors, have not figured out how to automate removal from cross-cluster search (yet)

Future Features
- Automate rehoming a sensor
- Reorganize scripts so related functions are in files and imported via main script
- Do we really need to remove a search node?

# Installation
1. Copy so_rmnode to /opt/so/saltstack/local/salt/ on the manager
2. Append so_rmnode to the role:manager section of /opt/so/saltstack/local/salt/top.sls
3. Execute `sudo salt \*_manager state.apply`