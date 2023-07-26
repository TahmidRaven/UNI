input_file_path01 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_input01.txt"
output_file_path01 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_output01.txt"

input_file_path02 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_input02.txt"
output_file_path02 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_output02.txt"

input_file_path03 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_input03.txt"
output_file_path03 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_output03.txt"

input_file_path04 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_input04.txt"
output_file_path04 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_output04.txt"

input_file_path05 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_input05.txt"
output_file_path05 = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task05_output05.txt"


from collections import defaultdict, deque

def shortest_path(N, M, D, roads):
    graph = defaultdict(list)
    for u, v in roads:
        graph[u].append(v)
        graph[v].append(u)

    visited = [False] * (N + 1)
    time_to_reach = [float('inf')] * (N + 1)
    path_to_city = [0] * (N + 1)

    queue = deque()
    queue.append(1)
    visited[1] = True
    time_to_reach[1] = 0

    while queue:
        current_city = queue.popleft()

        for neighbor in graph[current_city]:
            if not visited[neighbor]:
                visited[neighbor] = True
                queue.append(neighbor)
                time_to_reach[neighbor] = time_to_reach[current_city] + 1
                path_to_city[neighbor] = current_city

    min_time_to_D = time_to_reach[D]
    shortest_path_list = [D]
    city = D
    while city != 1:
        city = path_to_city[city]
        shortest_path_list.append(city)
    shortest_path_list.reverse()

    return min_time_to_D, shortest_path_list

def GimmeOutputAtOnce(input_file_path, output_file_path):
    with open(input_file_path, 'r') as f:
        N, M, D = map(int, f.readline().split())
        roads = [tuple(map(int, line.split())) for line in f]

    min_time_to_D, shortest_path_list = shortest_path(N, M, D, roads)

    output_str = f"Time: {min_time_to_D}\nShortest Path: {' '.join(map(str, shortest_path_list))}\n"

    with open(output_file_path, 'w') as f:
        f.write(output_str)


GimmeOutputAtOnce(input_file_path01,output_file_path01)
GimmeOutputAtOnce(input_file_path02,output_file_path02)
GimmeOutputAtOnce(input_file_path03,output_file_path03)
GimmeOutputAtOnce(input_file_path04,output_file_path04)
GimmeOutputAtOnce(input_file_path05,output_file_path05)
