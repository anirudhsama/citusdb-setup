# Vagrant Citus DB 
(Patched from : https://github.com/hung135/vagrant_citusdb)

# Steps to set-up vagrant machine:
- Ensure you have vagrant installed. If not, follow http://sourabhbajaj.com/mac-setup/Vagrant/README.html
- cd into citus-vm-setup directory 
- vagrant plugin install vagrant-disksize
- vagrant plugin install vagrant-cachier
- vagrant plugin install vagrant-scp
- execute: vagrant up
- when up,execute: vagrant ssh 
- inside vargrant vm, execute : sudo su ubuntu
- execute: docker ps (should see all instances of postgres)
- execute: psql -h localhost -U postgres -c "SELECT * FROM master_get_active_worker_nodes();"
- Should see nodes like:
```
node_name | node_port 
-----------+-----------
 localhost |      5434
 localhost |      5436
 localhost |      5433
 localhost |      5435
```

- cd /vagrant/ to get access to files that load data in db
