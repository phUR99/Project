#include <vector>
#include <string>
#include <queue>
#include <map>
using namespace std;

#define NAME_MAXLEN 6
#define PATH_MAXLEN 1999

struct node
{
    node* parent = NULL;
    map<string, node*> childs;
    int subCount = 0;      
    string name = "";
};
node* root = NULL;

node* find_dir(char path[PATH_MAXLEN + 1], int cnt){
    node* ret = root;   
    queue<string> q;
    int idx = 0;
    ret->subCount += cnt;

    while (path[idx] != '\0')
    {
        if(path[idx] == '/'){
            idx++;
            continue;            
        }
        string temp = "";
        while (path[idx] != '/')
        {
            temp += path[idx];
            idx++;
        }
        q.push(temp);                
    }
    while (!q.empty())
    {
        string name = q.front(); q.pop();        
        ret = ret->childs[name];
        ret->subCount += cnt;
    }        
    return ret;        
}
void erase(node* cur, int value){
    while (cur != NULL)
    {
        cur->subCount += value;
        cur = cur->parent;
    }
    return;
}



void init(int n) {
    
    root = new node;
    root->name = "/";
}




void cmd_mkdir(char path[PATH_MAXLEN + 1], char name[NAME_MAXLEN + 1]) {
    node* parent = find_dir(path, 1);                    
    node* child = new node;
    string temp = string(name);
    child->name = temp;                
    child->parent = parent;
    parent->childs[temp] = child;    
    return;
}

void cmd_rm(char path[PATH_MAXLEN + 1]) {
    node* deleteNode = find_dir(path, 0);    
    int deleteCnt = deleteNode->subCount + 1;
    erase(deleteNode, -deleteCnt);
    
    node* parent = deleteNode->parent;
    parent->childs.erase(deleteNode->name);         
}
node* copyNode(node* parent, node* source){
    node* ret = new node;    
    ret->parent = parent;
    ret->subCount = source->subCount;
    ret->name = source->name;    

    for (auto child : source->childs)
    {
        node* retChild = copyNode(ret, child.second);        
        ret->childs[child.first] = retChild;
    }
    return ret;
}


void cmd_cp(char srcPath[PATH_MAXLEN + 1], char dstPath[PATH_MAXLEN + 1]) {    
       
   node* source = find_dir(srcPath, 0);
   int copyCount = source->subCount + 1;
   
   node* parent = find_dir(dstPath, copyCount);
   node* subRoot = copyNode(parent, source);
   subRoot->parent = parent;   
   parent->childs[subRoot->name] = subRoot;   
}

void cmd_mv(char srcPath[PATH_MAXLEN + 1], char dstPath[PATH_MAXLEN + 1]) {
    node* source = find_dir(srcPath, 0);    
    node* parent = source->parent;    
    string name = source->name;
    int mvCount = source->subCount + 1;        
    erase(source, -mvCount);
    source->subCount += mvCount;

    parent->childs.erase(source->name);    
    node* dest = find_dir(dstPath, mvCount);    
    dest->childs[source->name] = source;
    source->parent = dest;            
}

int cmd_find(char path[PATH_MAXLEN + 1]) {
    int ret;
    node* cur = find_dir(path, 0);
    ret = cur->subCount;            
	return ret;
}