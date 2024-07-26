#include<iostream>
#include<vector>
#include<string.h>
#include<queue>

using namespace std;
int N, M;
vector<int> adj[105];
bool visited[105];

int main(int argc, char** argv)
{
	int test_case;
	int T;
    int u, v;
	cin>>T;
    int ans;
	for(test_case = 1; test_case <= T; ++test_case)
	{
        cin >> N >> M;

        memset(visited, false, sizeof(visited));
        ans = 0;
        for (int i = 1; i <= N; i++) adj[i].clear();

        for (int i = 0; i < M; i++)
        {
            cin >> u >> v;
            adj[u].push_back(v);
            adj[v].push_back(u);
        }
        queue<int> q;
        for (int i = 1; i <= N; i++)
        {
            if(visited[i]) continue;
            ans++;
            q.push(i);
            visited[i] = true;
            while (!q.empty())
            {
                auto cur = q.front(); q.pop();
                for (auto nxt : adj[cur])
                {
                    if(visited[nxt]) continue;
                    q.push(nxt);
                    visited[nxt] = true;
                }                
            }            
        }
        cout << "#"    << test_case << ' ';
        cout << ans << '\n';

	}
	return 0;
}