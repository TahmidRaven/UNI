def adj_matrix(N, M, edges):
 
    matrix = [[0] * (N) for i in range(N)]

 
    for i in edges: 
        u, v, w = i  
        matrix[u -1 ][v - 1] = w


    return matrix
 
input_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\task01_a_input01.txt"
output_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\task01_a_output01.txt"

with open(input_file_path, 'r') as file:
    N, M = map(int, file.readline().split())
    edges = []
    for i in range(M):
        u, v, w = map(int, file.readline().split())
        edges.append((u, v, w))

 
adjacency_matrix = adj_matrix(N+1, M, edges)
 
with open(output_file_path, 'w') as file:
    for row in adjacency_matrix:
        file.write(' '.join(map(str, row)) + '\n')


