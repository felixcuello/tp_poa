set -a
source .env
set +a

docker-compose start database
docker-compose run -p 80:3000 --entrypoint bash app

