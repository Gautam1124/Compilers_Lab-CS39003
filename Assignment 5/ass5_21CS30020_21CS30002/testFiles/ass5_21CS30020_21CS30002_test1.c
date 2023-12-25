// Program to check how many student passed the test

void view(int grades, int elements)
{
	printf("%d ",grades);
	printf("\n");
}

int Pass_count(int grades, int elements,int value)
{
	int i=2, passes = 0 ;
	char a='a';
	int arr[10];
	arr[passes+1]=15;
	double x=2.3;
	passes = x + i;
	if(grades>= value)
		passes++;
	
	return(passes);
}


int main()
{
	int grades=10;
	int result;
	view(grades,10);
	result = Pass_count(grades,10,70);
	
	if(result == 1)
		printf("There was %d pass.\n",result);
	else
		printf("There were %d passes.\n",result);

	return 0;
}


