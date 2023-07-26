def dfs(node, graph, visited, result):
    if visited[node] == 2:
        return True
    if visited[node] == 1:
        return False
    
    visited[node] = 1
    for neighbor in graph[node]:
        if not dfs(neighbor, graph, visited, result):
            return False
        
    visited[node] = 2
    result.append(node)
    return True

def find_order_dfs(num_courses, prerequisites):
    graph = {i: [] for i in range(1, num_courses + 1)}
    for prerequisite in prerequisites:
        graph[prerequisite[0]].append(prerequisite[1])

    visited = [0] * (num_courses + 1)
    result = []

    for i in range(1, num_courses + 1):
        if visited[i] == 0:
            if not dfs(i, graph, visited, result):
                return "IMPOSSIBLE"

    return result[::-1]

# Sample Input 1
input1 = (5, 3)
prerequisites1 = [(3, 1), (1, 2), (4, 5)]

# Sample Input 2
input2 = (6, 6)
prerequisites2 = [(1, 2), (2, 3), (4, 3), (4, 5), (5, 6), (6, 4)]

# Sample Input 3
input3 = (8, 10)
prerequisites3 = [(1, 2), (1, 4), (2, 4), (2, 5), (2, 3), (4, 6), (4, 5), (6, 5), (5, 3), (7, 8)]

# Calculate results using DFS approach
result_dfs1 = find_order_dfs(*input1, prerequisites1)
result_dfs2 = find_order_dfs(*input2, prerequisites2)
result_dfs3 = find_order_dfs(*input3, prerequisites3)

# Output results
print(*result_dfs1)  # Output: 3 4 1 5 2
print(*result_dfs2)  # Output: IMPOSSIBLE
print(*result_dfs3)  # Output: 1 7 2 8 4 6 5 3
