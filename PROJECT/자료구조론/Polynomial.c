#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
// 다항식의 항 선언
// input 방식 : 계수와 차수는 띄어쓰기로 구분, 공백으로 다항식 구분, 첫 항과 마지막 항은 반드시 최고차수와 최소차수여야 함
typedef struct term { 
	int coef; // 계수 선인
	int exp; // 차수 선언
	struct term* link; //연결리스트의 다음 링크(포인터 선언)
}term;
//연결리스트의 헤드 선언
typedef struct headpointer { 
	int length;
	term* head;
	term* tail;

}headpointer;

// 초기화 함수
void init(headpointer* plist) {
	plist->length = 0;
	plist->head = plist->tail = NULL;
}
// 리스트의 마지막에 노드를 추가해주는 함수
void add_node(headpointer* plist, int coef, int exp)
{
	term* temp = (term*)malloc(sizeof(term)); // 메모리 할당

	if (temp == NULL) { // 오류 방지용
		printf("메모리 할당 에러");
		exit;
	}

	temp->coef = coef;
	temp->exp = exp;
	temp->link = NULL;

	if (plist->tail == NULL) { // 처음 삽입시
		plist->head = plist->tail = temp;
	}
	else { // 이후
		plist->tail->link = temp;
		plist->tail = temp;
	}
	plist->length++;

}
// 두 연결리스트를 더하는 함수
void poly_add(headpointer* plist1, headpointer* plist2, headpointer* plist3)
{
	term* a = plist1->head;
	term* b = plist2->head;
	int sum;

	while (a && b) { // 리스트의 항의 차수를 비교하여 더한다
		 // 같을 때
		if (a->exp == b->exp) {
			sum = a->coef + b->coef;
			if (sum != 0)add_node(plist3, sum, a->exp);
			a = a->link; b = b->link;
		} 
		//한 쪽이 클 때
		else if (a->exp > b->exp) { 
			add_node(plist3, a->coef, a->exp);
			a = a->link;
		}
		else {
			add_node(plist3, b->coef, b->exp);
			b = b->link;
		}
	}
	// 한 리스트가 끝났을 때 남은 리스트 처리
	for (; a != NULL; a = a->link) 
		add_node(plist3, a->coef, a->exp);
	for (; b != NULL; b = b->link)
		add_node(plist3, b->coef, b->exp);


}
// 연결리스트를 출력하는 함수
void poly_print(headpointer* plist, int mode) {
	term* p = plist->head; //리스트를 받아옴
	FILE* fp = NULL; //파일 포인터 선언 

	if (mode) // 곱셈과 덧셈 설정
	{
		fp = fopen("output.txt", "w"); //파일 포인터 초기화
		fprintf(fp, "addition\n");
	}

	else {
		fp = fopen("output.txt", "a"); //파일 포인터 초기화
		fprintf(fp, "multiplication\n");
	}	

	for (; p; p = p->link) // 포인터를 따라가면서 하나씩 출력
		fprintf(fp, "%d   %d\n", p->coef, p->exp);

	fclose(fp); // 파일 포인터를 닫음

}
// 두 리스트를 곱하는 함수
void poly_multi(headpointer* plist1, headpointer* plist2, headpointer* plist3, headpointer* plist4) {


	term* p1 = plist1->head;
	term* p2 = plist2->head;


	while (p1) //p1이 끝까지 갈 때 반복문이 끝남
	{
		while (p2) { // p2가 끝까지 갈 때 반복문이 끝남
			// 한 항씩 곱한 결과를 새로운 리스트에 추가
			int coef_product = (p2->coef) * (p1->coef); 
			int exp_sum = p2->exp + p1->exp;
			add_node(plist3, coef_product, exp_sum);

			p2 = p2->link;

		}
		p1 = p1->link;

		p2 = plist2->head; //p2를 다시 헤드를 가리키게 초기화
	}


	term* p3 = plist3->head;

	int n = p3->exp; // 생성된 리스트의 첫 항(최고차수)
	int n_min = plist3->tail->exp; // 생성된 리스트의 마지막 항(최소차수)
	// 정렬 및 합
	for (n; n >= n_min; n--) { // 최고차수가 최소차수랑 같을 때 까지 실행

		int coef_sum = 0;

		while (p3) { // 리스트의 처음부터 끝까지 실행

			if (p3->exp == n) // 같은 차수끼리 모아줌
				coef_sum = coef_sum + p3->coef;

			p3 = p3->link;
		}

		if (coef_sum != 0) // 계수가 0이 아닐 때 항을 추가
			add_node(plist4, coef_sum, n);

		p3 = plist3->head; // 리스트의 처음으로 초기화
	}
}
//input.txt를 읽는 함수
void input(headpointer* plist1, headpointer* plist2) {

	FILE* fp = NULL;
	char buffer[20] = {NULL,};

	fp = fopen("input.txt", "r"); // 파일 포인터 초기화
	int n1 = 0, n2 = 0;

	if (fp == NULL) // 오류 체크
		printf("파일 열기에 실패했습니다\n\n");
	else
		printf("파일 열기에 성공했습니다\n\n");
	int i = 0;
	// 공백 구분
	while (fgets(buffer, sizeof(buffer), fp) != NULL) {

		if (isspace(buffer[0])) // 버퍼의 첫 항이 공백일 시
		{
			break;
		}
		i++; // 공백이 나오는 줄을 세줌
	}
	fp = fopen("input.txt", "r"); // 파일 포인터 초기화
	//파일 읽기
	while (EOF != fscanf(fp, "%d %d", &n1, &n2)) {

		if (i!=0) {  // 공백이 나오기 전까지
			add_node(plist1, n1, n2);
			i--;
		}
		else { // 공백이 나온 후
			add_node(plist2, n1, n2);
			
		}
		
	}

	fclose(fp);
}

void main() {

	headpointer list1, list2, list3, list4, list5;

	init(&list1);
	init(&list2);
	init(&list3);
	init(&list4);
	init(&list5);
	
	input(&list1, &list2);
	poly_add(&list1, &list2, &list3);
	poly_multi(&list1, &list2, &list4, &list5);

	poly_print(&list3, 1);	
	poly_print(&list5, 0);







}