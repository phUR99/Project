#include<iostream>
#include<vector>
#include<cmath>
#include<string.h>
#include<queue>

#define X first
#define Y second

using namespace std;
int T, N;
double E;
vector<pair<long long, int>> adj[1005];
bool visited[1005];

long long dist(pair<long long, long long> a, pair<long long, long long> b){
    return (a.X - b.X) * (a.X - b.X) + (a.Y - b.Y) * (a.Y - b.Y);
}

int main(int argc, char** argv)
{
	int test_case;
	
	cin>>T;

	for(test_case = 1; test_case <= T; ++test_case)
	{
        cin >> N;
        vector<pair<long long, long long>> coordinate(N,{0, 0});
        memset(visited, false, sizeof(visited));
        priority_queue<pair<long long,  int>> pq;
        long long ans = 0;

        for (int i = 0; i < N; i++)
        {
            adj[i].clear();
        }        
        for (int i = 0; i < N; i++)
        {
            cin >> coordinate[i].X;
        }
        for (int i = 0; i < N; i++)
        {
            cin >> coordinate[i].Y;
        }
        cin >> E;
        for (int i = 0; i < N; i++)
        {
            for (int j = i + 1; j < N; j++)
            {
                adj[i].push_back({dist(coordinate[i], coordinate[j]), j});
                adj[j].push_back({dist(coordinate[i], coordinate[j]), i});
            }            
        }        
        visited[0] = true;
        for (auto nxt : adj[0])
        {
            pq.push({-nxt.first, nxt.second});
        }
        int cnt = 0;
        while (cnt < N -1)
        {
            auto cur = pq.top(); pq.pop();
            if(visited[cur.second]) continue;
            ans -= cur.first;            
            visited[cur.second] = true;
            cnt++;
            for (auto nxt : adj[cur.second])
            {
                if(visited[nxt.second]) continue;
                pq.push({-nxt.first, nxt.second});
            }
            
        }
        cout << "#" << test_case << ' ';
        cout << (long long)round(ans * E) << '\n';

	}
	return 0;//정상종료시 반드시 0을 리턴해야합니다.
}