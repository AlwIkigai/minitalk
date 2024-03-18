# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asyed <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/14 12:07:44 by asyed             #+#    #+#              #
#    Updated: 2024/03/07 16:48:49 by asyed            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= minitalk

SERVERNAME 		= server

CLIENTNAME		= client

SERVER_FILE 	= server.c 

CLIENT_FILE	= client.c

CC 		= cc

CFLAGS 		= -Wall -Wextra -Werror -g -I.

RM		= rm -f
		
SERVER 		= $(SERVER_FILE:.c=.o) 

CLIENT		= $(CLIENT_FILE:.c=.o)

$(NAME): $(SERVER)$(CLIENT)
	@$(MAKE) -C libft
	@$(MAKE) -C ft_printf
	$(CC) $(CFLAGS) $(SERVER) ./libft/libft.a ./ft_printf/ft_printf.a -o $(SERVERNAME)
	$(CC) $(CFLAGS) $(CLIENT) ./libft/libft.a ./ft_printf/ft_printf.a -o $(CLIENTNAME)

all:	$(NAME)

clean:
	$(RM) $(SERVER)$(CLIENT)
	@$(MAKE) -C libft clean
	@$(MAKE) -C ft_printf clean

fclean:	clean
	$(RM) $(NAME)
	@$(MAKE) -C libft fclean
	@$(MAKE) -C ft_printf fclean

re:	fclean all

.PHONY:	all clean fclean re
