#include<iostream>
#include<string.h>

using namespace std;
int N;
char arr[300];
void inorder(int parent){
    if(parent > N) return;
    inorder(parent * 2);
    cout << arr[parent];
    inorder(parent * 2 + 1);    
}
int main(int argc, char** argv)
{
	int test_case;

	//freopen("input.txt", "r", stdin);
    int parent;
    int t;
    char c;
	for(test_case = 1; test_case <= 10; ++test_case)
	{
        cin >> N;
        for (int i = 1; i <= N; i++)
        {
            cin >> parent >> c;                
            arr[parent] = c;
            while (getc(stdin) == ' ')
            {
                cin >> t;
            }                        
        }                
        cout << "#" << test_case << " ";
        inorder(1);
        cout << '\n';
	}
	return 0;//정상종료시 반드시 0을 리턴해야합니다.
}