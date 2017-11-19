#! /bin/bash
# Ejecutar Instancia Mongo

docker run --name mongoked -d mongo

# Ejecutar Instancia Rails
docker run --rm -it --link mongoked -p 3000:3000 -v $PWD:/var/www -w /var/www --name plataforma ruby:2.3.1 gem install bundler && gem install rails -v '4.2.5' && bundle install && rails s -b 0.0.0.0
