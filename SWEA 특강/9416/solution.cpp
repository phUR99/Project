#include <bits/stdc++.h>
using namespace std;

bool likeList[1005][1005];
int timeStamp_PID[100010];
int timeStamp_UID[100010];
int PID_like[100010];
deque<int> UID_timestamp[1005];
int n;

struct node
{
    int like, timestamp;
    const bool operator<(const node & a) const {
        if(a.like == like) return a.timestamp < timestamp;
        return a.like < like;
    }
};


void init(int N)
{
    memset(likeList, false, sizeof(likeList));
    memset(timeStamp_PID, 0, sizeof(timeStamp_PID));
    memset(timeStamp_UID, 0, sizeof(timeStamp_UID));
    memset(PID_like, 0, sizeof(PID_like));
    
    
    for (int i = 1; i <= N; i++)
    {        
        UID_timestamp[i].clear();
        likeList[i][i] = true;
    }
    n = N;
}

void follow(int uID1, int uID2, int timestamp)
{    
    likeList[uID1][uID2] = true;
    
}

void makePost(int uID, int pID, int timestamp)
{
    timeStamp_PID[timestamp] = pID;
    timeStamp_UID[timestamp] = uID;
    auto &cur = UID_timestamp[uID];
    cur.push_back(timestamp);
    if(cur.size() > 10) cur.pop_front();
}

void like(int pID, int timestamp)
{
    PID_like[pID]++;
}

void getFeed(int uID, int timestamp, int pIDList[])
{    
    priority_queue<node> regardLike;
    for (int i = max(1, timestamp - 1000); i <= timestamp; i++)
    {
        if(!likeList[uID][timeStamp_UID[i]]) continue;
        regardLike.push({PID_like[timeStamp_PID[i]], i});
        if(regardLike.size() > 10) regardLike.pop();
    }
    if(regardLike.size() < 10){
        priority_queue<int, vector<int>, greater<int>> notRegardLike;
        for (int i = 1; i <= n; i++)
        {
            if(!likeList[uID][i]) continue;
            for (int j = (int)UID_timestamp[i].size()-1; j >= 0; j--)
            {
                if(timestamp - UID_timestamp[i][j] <= 1000) continue;
                notRegardLike.push(UID_timestamp[i][j]);
                if(notRegardLike.size() + regardLike.size() > 10) notRegardLike.pop();
            }        
        }            
        while (!notRegardLike.empty())
        {
            regardLike.push({0, notRegardLike.top()}); notRegardLike.pop();
        }
    }

    int idx = (int)regardLike.size() - 1;
    while (idx >= 0)
    {
        pIDList[idx--] = timeStamp_PID[regardLike.top().timestamp]; regardLike.pop();        
    }
}