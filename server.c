/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: asyed <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/07 16:28:21 by asyed             #+#    #+#             */
/*   Updated: 2024/03/07 16:28:23 by asyed            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	signal_handler(int siggy)
{
	static char	c = 0;
	static int	i = 0;

	if (siggy == SIGUSR1)
	{
		c = c | (1 << i);
	}
	else if (siggy == SIGUSR2)
	{
		c = c | (0 << i);
	}
	i++;
	if (i == 8)
	{
		ft_printf("%c", c);
		c = 0;
		i = 0;
	}
}

void	server(void)
{
	pid_t				serverpid;
	struct sigaction	sa;

	serverpid = getpid();
	ft_printf("server PID: %d\n", serverpid);
	sa.sa_handler = signal_handler;
	sa.sa_flags = 0;
	sigemptyset(&sa.sa_mask);
	if (sigaction(SIGUSR1, &sa, NULL) == -1
		|| sigaction(SIGUSR2, &sa, NULL) == -1)
	{
		ft_printf("error: cannot handle signals\n");
		exit(EXIT_FAILURE);
	}
	while (1)
	{
		pause();
	}
}

int	main(void)
{
	server();
	return (0);
}
