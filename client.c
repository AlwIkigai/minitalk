/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: asyed <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/07 16:28:05 by asyed             #+#    #+#             */
/*   Updated: 2024/03/07 16:28:10 by asyed            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	sendbits(pid_t PID, char c)
{
	int	i;

	i = 0;
	while (i < 8)
	{
		usleep(777);
		if ((c >> i) & 1)
		{
			kill(PID, SIGUSR1);
		}
		else
		{
			kill(PID, SIGUSR2);
		}
		i++;
	}
}

void	client(pid_t PID, char *str)
{
	int	i;

	i = 0;
	while (str[i] != '\0')
	{
		sendbits(PID, str[i]);
		i++;
	}
}

int	main(int ac, char *av[])
{
	pid_t	serverpid;
	char	*str;

	if (ac == 3)
	{
		serverpid = ft_atoi(av[1]);
		str = av[2];
		client(serverpid, str);
	}
	else
	{
		ft_printf("usage: ./client <server pid> <message>\n");
		return (1);
	}
	return (0);
}
