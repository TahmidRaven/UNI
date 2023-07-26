def dfs(node, graph, visited, result, stack):
    if visited[node] == 1:
        return False
    if visited[node] == 2:
        return True
    
    visited[node] = 1
    for neighbor in graph[node]:
        if not dfs(neighbor, graph, visited, result, stack):
            return False
        
    visited[node] = 2
    stack.append(node)
    return True

def find_order_dfs(num_courses, prerequisites):
    graph = {i: [] for i in range(1, num_courses + 1)}
    for prerequisite in prerequisites:
        graph[prerequisite[0]].append(prerequisite[1])

    visited = [0] * (num_courses + 1)   
    stack = []

    for i in range(1, num_courses + 1):
        if not dfs(i, graph, visited, [], stack):
            return "IMPOSSIBLE"

    return stack[::-1]

# Input file path
input_file = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB05\\task01_b_input01.txt"
output_file = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB05\\task01_b_output01.txt"

# Read input from file
with open(input_file, 'r') as file:
    N, M = map(int, file.readline().split())
    prerequisites = [tuple(map(int, file.readline().split())) for _ in range(M)]

# Calculate result using DFS approach
result_dfs = find_order_dfs(N, prerequisites)

# Write output to file
with open(output_file, 'w') as file:
    if result_dfs == "IMPOSSIBLE":
        file.write(result_dfs + "\n")
    else:
        file.write(" ".join(map(str, result_dfs)) + "\n")

# def dfs(node, graph, visited, result):
#     if visited[node] == 1:
#         return False
#     if visited[node] == 2:
#         return True
    
#     visited[node] = 1
#     for neighbor in graph[node]:
#         if not dfs(neighbor, graph, visited[:], result):
#             return False
        
#     visited[node] = 2
#     result.append(node)
#     return True

# def find_order_dfs(num_courses, prerequisites):
#     graph = {i: [] for i in range(1, num_courses + 1)}
#     for prerequisite in prerequisites:
#         graph[prerequisite[0]].append(prerequisite[1])

#     visited = [0] * (num_courses + 1)
#     result = []

#     for i in range(1, num_courses + 1):
#         if not dfs(i, graph, visited, result):
#             return "IMPOSSIBLE"

#     return result[::-1]

# # Input file path
# input_file = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB05\\task01_b_input01.txt"
# output_file = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB05\\task01_b_output01.txt"

# # Read input from file
# with open(input_file, 'r') as file:
#     N, M = map(int, file.readline().split())
#     prerequisites = [tuple(map(int, file.readline().split())) for _ in range(M)]

# # Calculate result using DFS approach
# result_dfs = find_order_dfs(N, prerequisites)

# # Write output to file
# with open(output_file, 'w') as file:
#     if result_dfs == "IMPOSSIBLE":
#         file.write(result_dfs + "\n")
#     else:
#         file.write(" ".join(map(str, result_dfs)) + "\n")

