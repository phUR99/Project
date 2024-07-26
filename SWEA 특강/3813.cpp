#include <bits/stdc++.h>
using namespace std;
#define fastio ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0)

int T, N, S;
int wearLevel[200005];
int bulk[200005];
int low, high, mid;

bool canMatch(int x){
    deque<int> possibleBulks;
    int cnt = 0;
    for (int i = 0; i < N; i++)
    {
        if(wearLevel[i] <= x) cnt++;
        else{
            if(cnt != 0) {                
                possibleBulks.push_back(cnt);
            }
            cnt = 0;
        }
    }
    if(cnt != 0) possibleBulks.push_back(cnt);

    int idx = 0;
    while (!possibleBulks.empty() && idx < S)
    {                
        int cur = possibleBulks.front(); possibleBulks.pop_front();        
        if(bulk[idx] > cur) continue;        
        int diff = cur - bulk[idx++];
        if(diff > 0) possibleBulks.push_front(diff);        
    }    

    return idx == S;
}


int main(){
    fastio;
    cin >> T;
    int ans;

    for (int tc = 1; tc <= T; tc++)
    {
        cin >> N >> S;
        for (int i = 0; i < N; i++)
        {
            cin >> wearLevel[i];
        }
        for (int i = 0; i < S; i++)
        {
            cin >> bulk[i];
        }
        low = 1; high = 200000;
        
        while (low <= high)
        {
            mid = (low + high) / 2;
            if(canMatch(mid)){
                high = mid - 1;
                ans = mid;
            }
            else{
                low = mid + 1;
            }
        }
        cout << "#" << tc << ' ';
        cout << ans << '\n';
    }
    
    
}