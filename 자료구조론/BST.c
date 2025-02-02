#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <ctype.h>

// 이진트리 선언
typedef struct node{
	int data; // tree의 데이터
	struct node* left, * right; // 이진트리의 줄기

}node;

// 새로운 노드를 만들어주는 + 초기화까지
node* newNode(int data)
{
	node* temp = malloc(sizeof(node)); // 공간 할당
	temp->data = data; // 데이터 할당
	temp->left = temp->right = NULL; //줄기 초기화

	return temp; // temp 포인터 반환
}

// 삽입 함수
node* insertion(node* node, int data) {
	// 노드를 만들어준다.
	if (node == NULL) return newNode(data);
		
		// 루트 삽입하기
		// 작으면 왼쪽, 크면 오른쪽
	if (data <= node->data)
		node->left = insertion(node->left, data);
	else
		node->right= insertion(node->right, data);
	
	// 노드 포인터 반환
	return node;
	
}
node* min_value_node(node* root)
{
	node* current = root;
	// 맨 왼쪽 단말 노드를 찾으러 내려감
	while (current->left != NULL)
		current = current->left;
	return current;
}
// 삭제 함수
node* deletion(node* root, int data) {
	// 발견하지 못했을 때 노드 포인터 반환
	if (root == NULL) return root;
	// 키가 루트보다 작으면 왼쪽 서브 트리에 있음
	if (data < root->data) 			
		root->left = deletion(root->left, data);
	// 키가 루트보다 크면 오른쪽 서브 트리에 있음
	else if (data > root->data) 		
		root->right = deletion(root->right, data);
	// 키가 루트와 같으면 이 노드를 삭제함
	else {
		// 왼쪽이 비어있을 때
		if (root->left == NULL) {	
			node* temp = root->right;
			free(root);
			return temp;
		}
		// 오른쪽이 비어있을 때
		else if (root->right == NULL) {	
			node* temp = root->left;
			free(root);
			return temp;
		}

		node* temp = min_value_node(root->right); 		
		root->data = temp->data; // 직후 키 복사
		root->right = deletion(root->right, temp->data); // 직후 노드 삭제
	}
	// 포인터 반환
	return root;
}
// 탐색 함수(전위 순회)
int search(node* root, int data) {
	// 찾는 데이터가 없을 때
	if (root == NULL)  return NULL;
	// 찾는 데이터가 있을 때
	if (data == root->data) return root;
	// 루트의 데이터랑 비교해서 다시 실행
	else if (data < root->data)
		return  search(root->left, data);
	else
		return  search(root->right, data);
}
// 깊이탐색함수
int maxDepth(struct node* node)
{
	// 아무것도 없을 때
	if (node == NULL)
		return 0;

	// 각각의 서브트리의 깊이를 탐색하고
	else {
		int lDepth = maxDepth(node->left);
		int rDepth = maxDepth(node->right);

		// 더 큰것을 사용한다.
		if (lDepth > rDepth)
			return (lDepth + 1);
		else
			return (rDepth + 1);
	}
}
// 레벨 순회
void printCurrentLevel(struct node* root, int level, FILE* fp)
{
	// 비어있으면
	if (root == NULL) {
		fprintf(fp, "0 " );
		// 비어있는데 루트의 레벨이 1이 아니다 => 밑에 빈 줄기들 출력하기
		if (level != 1) {
			for (int i = 1; i < pow(2, level-1); i++)
				fprintf(fp, "0 ");
		}
		return;
	}
	// 레벨이 1이면 그 값을 출력한다.
	if (level == 1)
		fprintf(fp, "%d ", root->data);
	// 레벨이 1보다 크면 레벨을 감소시기고 다시 탐색한다.
	else if (level > 1) {
		printCurrentLevel(root->left, level - 1, fp);
		printCurrentLevel(root->right, level - 1, fp);
	}
}
//레벨 순회
void printLevelOrder(struct node* root, int height, FILE* fp)
{
	// 레벨 마다 탐색하기
	int h = height;
	for (int i = 1; i <= h; i++)
		printCurrentLevel(root, i, fp);
}


// main 함수
void main() {
	node* root = NULL; // 루트
	FILE* fp, *wfp; // 파일 포인터
	char mode; // 모드
	int data; // 받을 데이터
	fp = fopen("input.txt", "r");
	wfp = fopen("output.txt", "w");
	// 오류 체크
	if (fp == NULL) {
		printf("파일 열기를 실패했습니다");
		exit(1);
	}
	if (wfp == NULL) {
		printf("파일 열기를 실패했습니다");
		exit(1);
	}


	// 파일의 끝이 아니면 계속 실행
	while (EOF != fscanf(fp, "%c%d", &mode, &data)) {
		// 모드에 이상한 값이 들어가는지 체크
		if (!isalpha(mode)) continue;
		// insertion
		if (mode == 'i') {
			root = insertion(root, data);
			fprintf(wfp, "%c%d : ", mode, data);
			printLevelOrder(root, maxDepth(root), wfp);
			fprintf(wfp, "\n");


		}
		// deletion
		else if (mode == 'd') {
			fprintf(wfp, "%c%d : ", mode, data);
			// search 값이 없으면 실행하지 않는다.
			if (NULL == search(root, data)) {
				fprintf(wfp, "Not exist\n");
				continue;
			}
			root = deletion(root, data);
			printLevelOrder(root, maxDepth(root), wfp);
			fprintf(wfp, "\n");
			
			
		}

		// search
		else {
			if (NULL == search(root, data)) {
				fprintf(wfp, "%c%d : ", mode, data);
				fprintf(wfp, "Not exist\n");
			}
			else {
				fprintf(wfp, "%c%d : ", mode, data);
				fprintf(wfp, "exist\n");
			}
		}
	}

	fclose(fp);
	fclose(wfp);
	
	
}