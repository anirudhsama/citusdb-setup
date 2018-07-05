# Vagrant Citus DB demo 
(Patched from : https://github.com/hung135/vagrant_citusdb)
- This vagrant script will build a VM with 5 docker instances of postgres 9.6 citusdb.
# Steps:
- Ensure you have vagrant installed. If not, follow (http://sourabhbajaj.com/mac-setup/Vagrant/README.html)
- clone this repo
- cd into citus-vm-setup directory 
- execute: vagrant up
- when up,  vagrant ssh 
- inside vargrant vm, execute : sudo su ubuntu
- run: docker ps 
- should see all instances of postgres
- run: psql -h localhost -U postgres -c "SELECT * FROM master_get_active_worker_nodes();"
- node_name | node_port 
- -----------+-----------
-  localhost |      5434
-  localhost |      5436
-  localhost |      5433
-  localhost |      5435
- (4 rows)

# Postgres
- The master is port forwarded to 5432. 
- Workers are port fowarded to 5433,5434,5435,5436
