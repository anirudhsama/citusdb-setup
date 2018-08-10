#this will be last and most of the time we won't need and requires 4gb of ram to run
docker build -t postgrescitus .
      #docker run  --restart=always --name postgres -e POSTGRES_PASSWORD=ubuntu -p 54322:5432 -d postgres:latest   
      # Add Citus repository for package manager
      #https://docs.citusdata.com/en/v6.1/installation/production_deb.html
      curl https://install.citusdata.com/community/deb.sh | sudo bash
      # install locally sowe can have client tools 
      sudo apt-get -y install postgresql-client-9.6 libpq5 pgdg-keyring postgresql-client-common


      # preload citus extension
      #sudo pg_conftool 9.6 main set shared_preload_libraries citus
      docker run -d  --name master  -p 5432:5432 postgrescitus
      master_id=$(docker ps -aq)
      docker run -d  postgrescitus
      docker run -d  postgrescitus
      docker run -d  postgrescitus
      docker run -d  postgrescitus

      container_ids=$(docker ps | grep citus | grep -o -e '^\S*'| grep -v "${master_id}")

      master_ip=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $master_id)

	for id in $container_ids
	do
    		name=$(docker inspect --format="{{ .Name }}" $id)
    		ip=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $id)

     		psql -h "${master_ip}" -U postgres -c "SELECT * from master_add_node('"${ip}"', 5432)"
	done



