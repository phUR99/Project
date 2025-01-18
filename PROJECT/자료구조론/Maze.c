#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#define MAX_SIZE 100 
// input.txt를 읽어서 row와 col을 읽어오는 함수
void read_txt(int* row, int* col) {
	FILE* fp = NULL;
	fp = fopen("input.txt", "r");
	int num_element = 0;
	int* row_ptr, *col_ptr;
	row_ptr = row;
	col_ptr = col;
	
	if (fp == NULL) // 오류 체크
	{
		printf("파일 열기에 실패했습니다\n");
		exit(1);
	}
	else printf("파일 열기에 성공했습니다\n");

	while (1) { // 한 줄을 끝까지 세서 col을 읽는다.

		char c = fgetc(fp);

		if (c == EOF) break; // 파일의 끝이면 멈춘다.

		if (c == '\n') break; // 개행이면 멈춘다.

		if (!isalnum(c)) continue; // 숫자나 알파벳이 아닌(공백)이면 세지 않는다.
		(*col_ptr)++;
		
	}

	rewind(fp); // 파일 포인터를 다시 초기화 시킨다.
	
	while (1) {
		char c = fgetc(fp);
		if (c == EOF) break;

		if (!isalnum(c)) continue; 
		num_element++; // 전체 글자의 개수
	}
		
	*row_ptr = num_element / *col_ptr; // 행의 수 = 전체 글자 개수 / 열의 개수

	fclose(fp);
}
// stack의 원소 선언
typedef struct element {
	int x;
	int y;
} element;

// stack 선언
typedef struct stack {
	element data[MAX_SIZE];
	int top;
}stack;

// stack이 다 차있는지
int is_full(stack* p) {
	return (p->top == MAX_SIZE - 1);
}
// stack이 비어있는지
int is_empty(stack* p) {
	return (p->top == -1);
}
// stack을 쌓는 함수
 void push(stack* p, element data) {
	if (is_full(p)) // 꽉차있는 지 체크
	{
		printf("스택이 꽉찼습니다\n"); 
		return;
	}
	else
	{
		p->top++;
		p->data[p->top].x = data.x;
		p->data[p->top].y = data.y;
	}
}

 // stack의 원소를 제거하고 그 데이터를 반환하는 함수
element pop(stack* p)
{
	if (is_empty(p)) //비어있는 지 체크
	{
		printf("스택이 비어있습니다\n");
		exit;
	}

	return p->data[(p->top)--];
}

// 시작점을 찾는 함수
void find_here(element* here, char** m, int row, int col)
{

	for (int i = 0; i < row; i++) { // 2차원 배열 m에서
		for (int j = 0; j < col; j++) {
			if (m[i][j] == 'E') { // E를 찾아서 그 값을 반환한다.
				here->x = i;
				here->y = j;
				break;
			}
		}		
	}
}

// stack 초기화
void init(stack* p) {
	p->top = -1;
}

void pushLoc(stack* s, char** m, int row, int col) {
	// 오류방지 . m 바깥의 원소를 탐색하는 것을 방지
	if (row < 0 || col < 0) return;
	// 탐색한 결과가 벽이 아니거나, 이미 갔다온 구간이 아니면
	if (m[row][col] != '1' && m[row][col] != '.') {
		element tmp;
		tmp.x = row;
		tmp.y = col;
		push(s, tmp); // stack에 한 칸 쌓는다.
	}
}


void main(void){
	int row, col; // row, col
	row = 0, col = 0;

	read_txt(&row, &col); // row, col을 받아온다.

	char** m = NULL; // 미로 m 생성

	m = malloc(sizeof(char*) * row);  // row X col로 만들어진 2차원 배열 생성

	for (int i = 0; i < row; i++) {
		m[i] = malloc(sizeof(char) * col);
	}
	// 초기화
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {
			m[i][j] = NULL;
		}
	}

	FILE* fp;
	int i = 0;
	int j = 0;
	// 파일을 읽어와서 미로를 m에 입력한다.
	fp = fopen("input.txt", "r");
	while (1) {
		char c = fgetc(fp);
		if (c == EOF) break; // 파일의 끝이면 끝냄
		if (!isalnum(c)) continue; // 문자가 공백이면 다시 시작
		m[i][j] = c; // 그 값을 미로에 입력해준다.
		j++;
		if (j % col == 0) { // col 값과 같아지면 다음 row 값으로 넘어간다.
			i++;
			j = 0;
		}

	}
	fclose(fp);

	// 미로 탐색 전 파일 출력
	fp = fopen("output.txt", "w"); // output.txt를 읽는다.
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {
			if (m[i][j] == '1') fputc('#', fp); // 1을 #으로 출력시켜준다.

			else if (m[i][j] == '0') fputc('B', fp); // 0을 B로 출력시켜준다.
			
			else fputc(m[i][j], fp); // 그 외는 그대로 출력시켜준다.

		}
		fputc('\n', fp); // 개행으로 행 구분을 해준다.

	}
	fputc('\n', fp);

	element here; // 시작위치 받아오기
	find_here(&here, m, row, col);
	printf("시작 (%d, %d) -> ", here.x, here.y);

	stack s;

	init(&s); // 스택 초기화

	int k = 0;
	// 미로탐색
	while (m[here.x][here.y] != 'X') { // 탈출할 때까지 탐색하기
		int r = here.x;
		int c = here.y;
		m[r][c] = '.'; // 탐색한 위치를 바꿔준다.
		// 상하좌우로 탐색. 
		pushLoc(&s,m,r-1, c);
		pushLoc(&s,m,r+1, c);
		pushLoc(&s,m,r, c-1);
		pushLoc(&s,m,r, c+1);
		// 스택이 비어있으면 길이 막혀있다 -> 실패
		if (is_empty(&s)) {
			printf("실패\n");
			k++;
			break;
		}

		else{// pop을 통해서 스택에서 하나씩 뽑아오면서 탐색시킨다.
			here = pop(&s);
			printf("(%d, %d) -> ", here.x, here.y);
		}
	
	}
	if (k==0) printf("도착\n탐색 성공\n");


	// 탐색 후 출력 
	fputs("탐색 경로\n", fp);
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {

			if (m[i][j] == '1') fputc('#', fp); // 1을 #으로 출력한다.

			else if (m[i][j] == '0') fputc('B', fp); // 0을 B로 출력한다.

			
			else if (m[i][j] == '.') fputc('T', fp); // .을 T로 출력한다.

			else fputc(m[i][j], fp); // 그 외는 그대로 출력한다.
		}
		fputc('\n', fp); // 행을 구분해준다.
	}
	fclose(fp);
	
	free(m[0]); // 할당됐던 메로리를 풀어준다.
	free(m);
}