# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asyed <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/14 12:07:44 by asyed             #+#    #+#              #
#    Updated: 2024/03/07 16:48:49 by asyed            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME 		= minitalk.a

SRC_FILES 	= server.c client.c

CC 			= cc

CFLAGS 		= -Wall -Wextra -Werror -g -I.

RM			= rm -f
		
OBJ 		= $(SRC_FILES:%.c=%.o)

$(NAME): $(OBJ)
	@$(MAKE) -C libft
	@$(MAKE) -C ft_printf
	$(CC) $(CFLAGS) $(OBJ) ./libft/libft.a ./ft_printf/libftprintf.a -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all:		$(NAME)

clean:
			$(RM) $(OBJ)
			@$(MAKE) -C libft clean
			@$(MAKE) -C ft_printf clean

fclean:		clean
			$(RM) $(NAME)
			@$(MAKE) -C libft fclean
			@$(MAKE) -C ft_printf fclean

re:			fclean all

.PHONY:		all clean fclean re
