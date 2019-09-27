# gitlab
Setup GitLab with Docker : swarm, runner, vhosts

# Deploy to swarm with .env vars
docker-compose -f gitlab.yml config | docker stack deploy --compose-file - gitlab
