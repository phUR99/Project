#include<iostream>
#include<queue>

#define INSERT 1

using namespace std;

int N;

int main(int argc, char** argv)
{
	int test_case;
	int T, n, m;

	//freopen("input.txt", "r", stdin);
	cin>>T;

	for(test_case = 1; test_case <= T; ++test_case)
	{
        cin >> N;
        priority_queue<int> pq;
        cout << "#" << test_case << ' ';
        for (int i = 0; i < N; i++)
        {
            cin >> n;
            if(n == INSERT){
                cin >> m;
                pq.push(m);
            }
            else{
                if(pq.empty()) cout << -1 << ' ';
                else{
                    cout << pq.top() << ' ';
                    pq.pop();
                } 
                
            }
        }
        cout << '\n';

	}
	return 0;
}