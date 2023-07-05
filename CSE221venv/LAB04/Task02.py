from collections import deque

def bfs(adj_list):
    n = len(adj_list)
    visited = [0] * n   
    visited[0] = 1   
    queue = deque([0])   
    path = []   

    while queue:
        u = queue.popleft()   
        path.append(u+1)  
        for v in adj_list[u]:
            if visited[v] == 0:   
                visited[v] = 1   
                queue.append(v)   

    return path



input_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\task02_input01.txt"
output_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\task02_output01.txt"

 
with open(input_file_path, 'r') as input_file:
    N, M = map(int, input_file.readline().split())
    adj_list = [[] for _ in range(N)]
    for _ in range(M):
        u, v = map(int, input_file.readline().split())
        adj_list[u-1].append(v-1)
        adj_list[v-1].append(u-1)

 
bfs_path = bfs(adj_list)

with open(output_file_path, 'w') as output_file:
    output_file.write(' '.join(map(str, bfs_path)))
