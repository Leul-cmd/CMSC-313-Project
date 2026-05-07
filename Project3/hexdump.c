#include <stdio.h>
#include <ctype.h>

const size_t LINE = 16;    // number of bytes per line

int main(int argc, char *argv[]){

  // Check if filename is passed as an argument
  if (argc == 2){
    
    // Open file in binary read mode
    FILE* file = fopen(argv[1], "rb");

    // Check if file opens successfully
    if (file){
      unsigned char buffer[LINE];   // input buffer
      size_t i = 0;                   // index in buffer
      size_t offset = 0;              // address in file
      int c = fgetc(file);            // first byte in the file

      // Check if not end of file
      while (c != EOF) {
	// Store the byte in buffer
	buffer[i++] = (unsigned char)c;

	// Check if 16 bytes are stored
	if (i == LINE){

	  // Print address in hex
	  printf("%08zx ", offset);

	  // Print bytes in hex 
	  for (size_t j = 0; j < LINE; j++) {
	    printf("%02x ", buffer[j]);
	  }

	  // Print ASCII representation of bytes
	  printf("|");
	  for (size_t j = 0; j < LINE; j++) {
	    printf("%c", isprint(buffer[j]) ? buffer[j] : '.');
	  }
	  printf("|\n");

	  // Update current address and reset buffer index
	  offset += LINE;
	  i = 0;
	}
	
	// Read next byte
	c = fgetc(file);
      }

      // Check if any there are any remaining bytes (if total number of bytes not multiple of 16)
      if (i > 0) {

	// Print address in hex
	printf("%08zx ", offset);

	// Print hex values
	for (size_t j = 0; j < LINE; j++) {
	  if (j < i){
	    printf("%02x ", buffer[j]);
	  }
	  else{
	    printf(" ");
	  }
	}

	// Print ASCII representation of bytes
	printf("|");
	for (size_t j = 0; j < i; j++) {
	  printf("%c", isprint(buffer[j]) ? buffer[j] : '.');
	}
	printf("|\n");
      }

      // Close file
      fclose(file);
    }
	// File not found
    else{
      printf("File doesn't exist\n");
    }
  }
  // File not given
  else{
    printf("No attached file\n");
  }
}
