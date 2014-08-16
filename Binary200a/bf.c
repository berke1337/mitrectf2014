#include <stdio.h>
#include <stdint.h>

int main(void)
{
	char cbuf[16];
	uint64_t* ibuf=&cbuf;
	int i;
	for (i=0;i<16777216;i++)
	{
		write(1,"0",1);
		sprintf(cbuf,"%08o",i);
		*ibuf+=0x0101010101010101ULL;
		write(1,cbuf,8);
		write(1,"9",1);
	}
}
