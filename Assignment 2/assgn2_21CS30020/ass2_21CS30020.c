
#include "myl.h"
int printInt(int n) {
    char buff[100], zero = '0';
    int i = 0, j, k, bytes;

    if (n == 0) {
        buff[i++] = zero;
    } else {
        if (n < 0) {
            buff[i++] = '-';
            n = -n;
        }

        while (n) {
            int dig = n % 10;
            buff[i++] = (char)(zero + dig);
            n /= 10;
        }

        if (buff[0] == '-') j = 1;
        else j = 0;
        k = i - 1;
        while (j < k) {
            char temp = buff[j];
            buff[j++] = buff[k];
            buff[k--] = temp;
        }
        
    }
	buff[i] = '\0';
        bytes = i + 1;
    asm volatile (
        "movq $1, %%rax \n\t"
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        :
        : "S"(buff), "d"(bytes)
    );
    return i ;
}



int readInt(int *n) {
    char buffer[100];
    int bytes_read;

    asm volatile ( "syscall"
        : "=a" (bytes_read)          
        : "0" (0) , "D" (0) ,"S" (buffer),"d" (sizeof(buffer))     
    
    );

    if (bytes_read <= 0) {
        return ERR; 
    }

    buffer[bytes_read - 1] = '\0'; 

    int i = 0;
    if(buffer[i] == '-' || buffer[i] == '+')i = i+1;

    int number = 0;
    while(buffer[i] != '\0' && buffer[i] != '.' && buffer[i] != 'e'){
        number = number*10 + (buffer[i] - '0');
        if(buffer[i] - '0' > 9 || buffer[i] - '0' < 0)return ERR;
        i++;
    }
    if(buffer[0] == '-')number = number* -1;
    *n = number;
    return OK; 
}


int printStr(char * buffer){
    int bytes = 0;
    while(buffer[bytes] != '\0'){
        bytes = bytes + 1;
    }
    buffer[bytes++] = '\0';
    
    
    asm volatile (
        "movq $1, %%rax \n\t"
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        :
        : "S"(buffer), "d"(bytes)
    );
    
    return bytes;
}

int printFlt(float f){
    char buffer[100];
    
    float div = 1;
    int i =0;
    int part1 = (int)f;

    if(f < 0.000000){buffer[i++] = '-'; f = f*(-1);part1 = part1*-1;}
    // printf("%f",f);
    while(part1 > 0){
        div = div*10;
        part1 = part1/10;
    }


    
    if(div == 1){
    	buffer[i++] = '0';
    	buffer[i++] = '.';
    }
    div = div/10;
    while(f > 0.0000001){
    	

        int rem = (int)(f/div);

        buffer[i++] = (char)('0' + rem);
        f = f - (float)rem*div;
        
	if(div == 1){
            buffer[i++] = '.';
        }
        // printf("%f \n", f);
        
        div = div/10;
        
    }
    if(div >= 1){
    	while(div >= 1){
    		buffer[i++] = '0';
    		div = div/10;
    	}
    
    }
    buffer[i++] = '\0';


    asm volatile (
        "movq $1, %%rax \n\t"
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        :
        : "S"(buffer), "d"(i)
    );
    return i -1;

}

int readFlt(float * f){
    char buffer[100];
    int bytes_read;

    asm volatile ( "syscall"
        : "=a" (bytes_read)          
        : "0" (0) , "D" (0) ,"S" (buffer),"d" (sizeof(buffer))     
    
    );
    if (bytes_read <= 0) {
        return ERR; 
    }

    buffer[bytes_read - 1] = '\0';
    int i = 0;
    if(buffer[i] == '-' || buffer[i] == '+')i = i+1;

    float number = 0;
    while((buffer[i] != '\0') && (buffer[i] != '.')  && (buffer[i] != 'e')){
        number = number*10 + (buffer[i] - '0');
        i++;
    }
    if(buffer[i] == '.'){
        float div = 0.1;
        i++;
        while(buffer[i] != '\0' && buffer[i] != 'e'){
            number = number + (buffer[i] - '0')*div;
            if(buffer[i] != 'e' && (buffer[i] - '0')>9 &&  buffer[i] - '0' < 0)return ERR;
            div = div/10;
            i++;
        }
        // For the input string of number -123.456 the float number stored is -123.4560001, I tried to convert the number into int and divide but still dividing it 
                      // produces the 0.000001;
    }
    
    if(buffer[i] == 'e'){
    	float mul = 1;
    	i = i + 1;
    	int count = 0;
    	float multiplier = 10;
    	if(buffer[i] == '-')multiplier = 0.1;
    	if(buffer[i] == '-' || buffer[i] == '+') i = i + 1;
    	
    	while(buffer[i] != '\0' ){
        	count = count*10 + (buffer[i] - '0');
            if((buffer[i] - '0')>9 ||  buffer[i] - '0' < 0)return ERR;
        	i++;
    	}
    	
    	while(count>0){mul = mul*multiplier;
    		count--;
    	}
    	
    	number = number*mul;
    	
    }
    if(buffer[0] == '-'){
        number = number* -1;
    }
    
    *f = number;
    return OK;    
}





