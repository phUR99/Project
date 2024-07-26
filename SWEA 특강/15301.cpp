#include<iostream>
#include<list>

using namespace std;
int N, M, L;
list<int> arr;

int main(int argc, char** argv)
{
	int test_case;
	int T;
    ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);

	cin>>T;
    int num, idx;
    char c;
	for(test_case = 1; test_case <= T; ++test_case)
	{
        arr.clear();
        cin >> N >> M >> L;
        for (int i = 0; i < N; i++)
        {
            cin >> num;
            arr.push_back(num);
        }
        for (int i = 0; i < M; i++)
        {
            cin >> c;
            if(c == 'D'){
                cin >> idx;
                list<int>::iterator iter = arr.begin();
                while (idx--)
                {
                    iter++;
                }                                
                arr.erase(iter);
            }
            else if(c == 'I'){
                cin >> idx >> num;
                list<int>::iterator iter = arr.begin();
                while (idx--)
                {
                    iter++;
                }                                
                arr.insert(iter, num);
            }
            else{
                cin >> idx >> num;
                list<int>::iterator iter = arr.begin();
                while (idx--)
                {
                    iter++;
                }                                
                *iter = num;
            }
        }
        int ans = -1;
        
        if(L < arr.size()) {
            list<int>::iterator iter = arr.begin();
            while (L--)
            {
                iter++;
            }
            ans = *iter;
        }
        cout << "#" << test_case << ' ';
        cout << ans << '\n';
	}
	return 0;
}