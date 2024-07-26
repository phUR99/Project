#include<algorithm>
#include<iostream>
#include<queue>
#include<vector>

using namespace std;
int N;
vector<int> arr;


int main(int argc, char** argv)
{
	int test_case;
	int T, tmp, K;
    int ans;
	//freopen("input.txt", "r", stdin);
	cin>>T;
	for(test_case = 1; test_case <= T; ++test_case)
	{        
        cin >> N;        
        arr.clear();
        arr.resize(N);
        priority_queue<pair<int, int>> pq;

        for (int i = 0; i < N; i++)
        {
            cin >> arr[i];            
        }
        sort(arr.begin(), arr.end(), greater<>());
        cin >> K;
        pq.push({0, K});
        
        while (true)
        {
            auto cur = pq.top(); pq.pop();
            if(cur.second == 0) {
                ans = -cur.first;
                break;
            }
            pq.push({cur.first - cur.second, 0});
            for (int i = 0; i < N; i++)
            {
                pq.push({cur.first - cur.second % arr[i], cur.second / arr[i]});
            }
            
        }
        cout << "#" << test_case << ' ';
        cout << ans << '\n';

	}
	return 0;
}