/*
 * This program fills the entire filesystem with poison values.
 */

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

int main()
{
	char *buf = NULL;
	unsigned long poison = 0xEDFECEFAEDFECEFA;
	char *ptr = NULL;
	int idx = 0, fd = -1, ret = 0, cnt = 0;
	buf = (char *)calloc(1048576, 1);
	if (!buf) {
		printf("Failed\n");
		return -1;
	} 

	ptr = buf;
	for (idx = 0; idx < 131072; idx++) {
		bcopy(&poison, ptr, 8);
		ptr += 8;
	}	
	printf("Success %d\n", sizeof(poison));
	fd = open("/ocfs2/gtmfile", O_WRONLY, O_CREAT|O_APPEND);
	if (fd < 0) {
		printf("Failed\n");
		return -1;
	} else {
		printf("fd: %d\n", fd);
	}
	while (1) {
		ret = write(fd, buf, 1048576);
		if (ret < 0) {
			printf("FULL %d errno: %d\n", ret, errno);
			break;
		}
		cnt++;

		if (cnt % 1000 == 0) {
			fsync(fd);
		}
	}
	free(buf);
	return 0;
	
}
