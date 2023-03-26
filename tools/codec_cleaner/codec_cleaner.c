/* -*- mode: c; compile-command: "gcc -Wall -O2 -static -s -o codec_cleaner codec_cleaner.c"; -*- */

/*
 * Copyright (C) 2021 - 2023 Daniel Caujolle-Bert, F1RMB
 *
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer
 *    in the documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * 4. Use of this source code or binary releases for commercial purposes is strictly forbidden. This includes, without limitation,
 *    incorporation in a commercial product or incorporation into a product or project which allows commercial use.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <getopt.h>

#define VERSION_MAJOR 0
#define VERSION_MINOR 0
#define VERSION_REV   3

#if defined(_WIN32)
#define OPEN_RO_FLAGS O_RDONLY|O_RAW
#define OPEN_RW_FLAGS O_CREAT|O_WRONLY|O_TRUNC|O_RAW
#else
#define OPEN_RO_FLAGS O_RDONLY
#define OPEN_RW_FLAGS O_CREAT|O_WRONLY|O_TRUNC
#endif

static int ClearBinFile(const char *inFile, const char *outFile)
{
     int           inFD = -1, outFD = -1;
     struct stat   fileStat;
     char         *buffer = NULL;
     int           exitStatus = EXIT_SUCCESS;

     printf("Input file: '%s'\nOutput file: '%s'\n", inFile, outFile);

     if ((inFD = open(inFile, OPEN_RO_FLAGS)) == -1)
     {
	  perror("open");
	  exitStatus = EXIT_FAILURE;
	  goto exitFailure;
     }

     if ((outFD = open(outFile, OPEN_RW_FLAGS, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IWGRP)) == -1)
     {
	  perror("open");
	  exitStatus = EXIT_FAILURE;
	  goto exitFailure;
     }

     if (fstat(inFD, &fileStat) == -1)
     {
	  perror("fstat");
	  exitStatus = EXIT_FAILURE;
	  goto exitFailure;
     }

     buffer = (char *)malloc(sizeof(char) * fileStat.st_size);

     if (read(inFD, buffer, fileStat.st_size) != fileStat.st_size)
     {
	  perror("read");
	  exitStatus = EXIT_FAILURE;
	  goto exitFailure;
     }

     // Clear the codec region
     memset(buffer + 0x6937C, 0xFF, 0x48BB0);

     if (write(outFD, buffer, fileStat.st_size) != fileStat.st_size)
     {
	  perror("write");
	  exitStatus = EXIT_FAILURE;
     }

exitFailure:
     if (buffer)
     {
	  free(buffer);
	  buffer = NULL;
     }

     if ((outFD != -1) && (close(outFD) == -1))
     {
	  perror("close");
     }

     if ((inFD != -1) && (close(inFD) == -1))
     {
	  perror("close");
     }

     printf("File '%s' created\n", outFile);

     return exitStatus;
}

static void CreateDummyCodec(void)
{
	const int BLOB_SIZE = 0x48BB0;
	const char *codecFile = "codec_bin_section_1.bin";
	char buffer[BLOB_SIZE];

	// "zeroing" codec data
	memset(buffer, 0xFF, sizeof(buffer));

	int fd = -1;

	printf(" - Creating file %s\n", codecFile);
	if ((fd = open(codecFile, OPEN_RW_FLAGS, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IWGRP)) == -1)
	{
		perror("open");
		return;
	}

	if (write(fd, buffer, BLOB_SIZE) != BLOB_SIZE)
	{
		perror("write");
		return;
	}

	if ((fd != -1) && (close(fd) == -1))
	{
		perror("close");
		return;
	}

	printf("Done\n");
}

static bool FileExist(const char *filename)
{
     struct stat buffer;
     return (stat(filename, &buffer) == 0);
}

static void usage(void)
{
     printf("\n");
     printf("Usage: codec_cleaner [OPTION]\n");
     printf("\n");
     printf("Options:\n");
     printf("         -i <inputfile.bin>   : clear the codec regions of the <inputfile.bin>.\n");
     printf("         -o <outfile.bin>     : write to resulting cleaned inputfile (see -i) to <outfile.bin>.\n");
     printf("         -C                   : create dummy codec region files.\n");
     printf("   \n\n");
}

int main(int argc, char **argv)
{
     printf("codec_cleaner (STM32) v%u.%u.%u (c) 2021 - 2023 Roger Clark, VK3KYY / G4KYF & Daniel Caujolle-Bert, F1RMB.\n",
	    VERSION_MAJOR, VERSION_MINOR, VERSION_REV);
	  
     if (argc > 1)
     {
	  int c;
	  char *inFileName = NULL;
	  char *outFileName = NULL;

	  while ((c = getopt(argc, argv, "i:o:Ch")) != -1 )
	  {
	       switch (c)
	       {
	       case 'h':
		    usage();
		    return EXIT_SUCCESS;
		    break;

	       case 'i':
		    if (optarg)
		    {
			 inFileName = optarg;

			 if (FileExist(inFileName) == false)
			 {
			      fprintf(stdout, "ERROR: File '%s' is missing.\n", inFileName);
			      return EXIT_FAILURE;
			 }
		    }
		    break;

	       case 'o':
		    if (optarg)
		    {
			 outFileName = optarg;
		    }
		    break;

	       case 'C':
		    CreateDummyCodec();
		    return EXIT_SUCCESS;
		    break;

	       default:
		    usage();
		    return EXIT_FAILURE;
	       }
	  }

	  if ((inFileName != NULL) && (outFileName != NULL))
	  {
	       if (ClearBinFile(inFileName, outFileName) == -1)
	       {
		    perror("Error");
		    return EXIT_FAILURE;
	       }
	  }
	  else
	  {
	       if (inFileName == NULL)
	       {
		    printf("ERROR: inputfile is not specified\n");
	       }
	       if (outFileName == NULL)
	       {
		    printf("ERROR: outputfile is not specified\n");
	       }

	       usage();
	       return EXIT_FAILURE;
	  }

     }
     else
     {
	  usage();
     }

     return EXIT_SUCCESS;
}
