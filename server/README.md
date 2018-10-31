## Project setup

Installs all dependencies and initializes database:
```
docker-compose up
```

With all dependencies available inside of the Docker container, you can run all
`rails`, `rake`, and `heroku` commands from Docker. However, these commands
should work outside of a Docker container, should you choose to install these
dependencies on the host machine.

To enter interactive mode for a container:
```
docker exec -it ducky-api_server_1 bash
```

### Run your tests
```
rails test
```

### Deploy
```
heroku login
git push heroku master
```

## Production

### Database changes
To run commands on Production db, prefix the command with `heroku run`. Example:
```
heroku run rake db:migrate
```
