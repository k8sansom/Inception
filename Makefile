all:
	docker-compose -f docker-compose.yml up --build

clean:
	docker-compose down --volumes --remove-orphans
	rm -rf /home/yourlogin/data/db /home/yourlogin/data/wp

fclean: clean
	docker rmi $(docker images -q)

re: fclean all
