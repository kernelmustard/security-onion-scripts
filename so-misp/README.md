# securityonion-misp
* a suite of scripts to ingest threat indicators from MISP *

## Prerequisites:   
- Security Onion (installed,configured)
- MISP Instance and API Key   
  
## Download and Configure (on Master or Standalone)
- Clone the repo:   
`git clone https://github.com/kernelmustard/security-onion-scripts/so-misp`   
- run the installer (note: have your MISP running and API key handy)
  - `bash ./so-misp/so-misp-install` 
- Update rules (if desired):   
`sudo so-misp-install` will update them at runtime if NIDS rules are imported
`sudo so-rule-update` will force an update in-between daily 0601 runs of the `so-misp-download` cronjob
- Confirm rules in place:    
`grep -i misp /opt/so/rules/nids/all.rules`    
- Confirm Zeek Intel in place:    
`cat /opt/so/conf/zeek/policy/intel/intel.dat`

A cron job will run every morning at 6:01AM to download new NIDS rules and Intel.

Any previously configured intel files will be wiped away (bug)

# Files this suite of scripts changes
- Configurations
`/etc/misp/`
- sbin scripts
`/usr/sbin/so-misp-*`
- so-misp-download cron job
`/etc/cron.d/so-misp-download`
- load zeek local config (modified if intel is selected)
`/opt/so/saltstack/local/salt/zeek/policy/intel/__load__.zeek`
- IDSTools local config (modified if NIDS rules are selected)
`/opt/so/saltstack/local/salt/idstools/etc/rulecat.conf`

# TODO
- figure out how to load custom zeek intel files

NEEDS TO BE SHELLCHECKED