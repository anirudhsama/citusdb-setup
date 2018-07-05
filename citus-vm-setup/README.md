# Vagrant Citus DB 
(Patched from : https://github.com/hung135/vagrant_citusdb)
- This vagrant script will build a VM with 5 docker instances of postgres 9.6 citusdb.
# Steps:
- Ensure you have vagrant installed. If not, follow http://sourabhbajaj.com/mac-setup/Vagrant/README.html
- cd into citus-vm-setup directory 
- execute: vagrant up
- when up,execute: vagrant ssh 
- inside vargrant vm, execute : sudo su ubuntu
- execute: docker ps (should see all instances of postgres)
- execute: psql -h localhost -U postgres -c "SELECT * FROM master_get_active_worker_nodes();"
- Should see nodes like:
```
- node_name | node_port 
- -----------+-----------
-  localhost |      5434
-  localhost |      5436
-  localhost |      5433
-  localhost |      5435
```

# Postgres
- The master is port forwarded to 5432. 
- Workers are port fowarded to 5433,5434,5435,5436
