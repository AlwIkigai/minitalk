In this project, I learnt how to improve on my makefile and access my libraries from libft and ft_printf under my subfolder. 

As for the libraries, I used signals.h to handle signals and sys/types.h to give a type for the PID.

kill is used to send signal and you have to use bitwise operation to move to the bits you want to send

I also learnt about PID, Process ID and how to get them using getpid().

The program begins with the server starting first and getting the PID. The PID is initialised with type pid_t.
The client program will take 2 parameter, av[1] being the PID and av[2] being the string.
As the input of av[1] is using ascii/ char input.  The program will convert the ascii to integer. 
The client will send (PID, string) to the server bit by bit. 

In this project, we send the signal bit by bits from client to server.

I used sendbits function and right shift operation that moves as my counter increased.
My solotion is to send the least significant bit to most significant bit.
This is where we use SIGUSR1 to send 1 and SIGUSR2 to send 0.
As the bit moves to i-th bit is isloated and check if it is to be sent as 1 or 0.

If you’re sending the character “T” (which has the binary representation 01010100), 
and you’re sending the bits from least significant to most significant, then the order of the signals would indeed be:
0, 0, 1, 0, 1, 0, 1, 0

This corresponds to the binary representation of “T” read from right to left. 

The server program will received the bit.
I use a struct sigaction variable name sa to determine how the signal will be handled.
In sigaction, we have a few "functions" we can use like the sa_handler which operation is determined by my helper function, signal handler.

My signal handler receives the signals from the client.
I use 2 static variable, char to construct the bits and int to act as counter until the 8th bit.
In this function, I construct the bits by adding 1 or 0 to the left bit.

The binary representation of the character is constructed one bit at a time. 
The static char c variable in the signal_handler function holds the character being constructed from the signals. 
It’s initialized to 0, which is equivalent to 00000000 in binary.
The 0 or 
The 8 bits will then be constructed to a character.

struct sigaction sa
sa.sa_handler
sa.sa_flags
sigemptyset

how to use bitwise operation.
  >> shifting the bit to the right. this operation removes the bits from the right.
      For example, if you left shift 0000 0101 (which represents 5) by 2 positions,
                             you get 0001 0100 (which represents 20).
>  > << shifting to the bit to the left. this operation adds zero to the right. 
      For example, if you right shift 0001 0100 (which represents 20) by 2 positions, 
                            you get 0000 0101 (which represents 5).
>  > | the or operation
>  > & the & operator
